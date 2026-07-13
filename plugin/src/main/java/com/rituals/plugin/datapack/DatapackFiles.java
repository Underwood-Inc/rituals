package com.rituals.plugin.datapack;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.StandardCopyOption;
import java.nio.file.attribute.BasicFileAttributes;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HexFormat;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.jar.Manifest;
import java.util.zip.ZipFile;

/** Copy bundled {@code rituals-datapack.zip} into each world's {@code datapacks/} folder. */
public final class DatapackFiles {

    static final String BUNDLED_ZIP = "rituals-datapack.zip";
    private static final long MIN_ZIP_BYTES = 200_000L;
    private static final String DEFAULT_LEVEL = "world";
    static final String DEFAULT_ZIP_NAME = "rituals.zip";
    /** Legacy folder extract removed — delete if still present so only the zip loads. */
    static final String LEGACY_FOLDER_NAME = "rituals";

    private DatapackFiles() {
    }

    /** Install into one world folder (the path that contains {@code level.dat}). */
    public static List<Path> installToWorld(Path worldRoot, String zipFileName, Class<?> anchor, File pluginJar,
                                            String pluginVersion) {
        List<Path> installed = new ArrayList<>();
        Path zip = installZipWhenNeeded(worldRoot, zipFileName, anchor, pluginJar, pluginVersion);
        if (zip != null) {
            installed.add(zip);
        }
        return installed;
    }

    /** Install zip for every world directory under the server root. */
    public static List<Path> installAllWorlds(Path serverRoot, String zipFileName, Class<?> anchor, File pluginJar,
                                              String pluginVersion) {
        if (serverRoot == null) {
            return List.of();
        }
        List<Path> installed = new ArrayList<>();
        for (Path worldRoot : findWorldRoots(serverRoot)) {
            Path zip = installZipWhenNeeded(worldRoot, zipFileName, anchor, pluginJar, pluginVersion);
            if (zip != null) {
                installed.add(zip);
            }
        }
        return installed;
    }

    public static Path installIfMissing(Path serverRoot, String levelName, String zipFileName, Class<?> anchor,
                                          File pluginJar, String pluginVersion) {
        return installZipWhenNeeded(serverRoot.resolve(levelName), zipFileName, anchor, pluginJar, pluginVersion);
    }

    public static Path installIfMissing(Path serverRoot, Class<?> anchor, File pluginJar, String pluginVersion) {
        return installZipWhenNeeded(serverRoot.resolve(readLevelName(serverRoot)), DEFAULT_ZIP_NAME, anchor, pluginJar,
                pluginVersion);
    }

    private static Path installZipWhenNeeded(Path worldRoot, String zipFileName, Class<?> anchor, File pluginJar,
                                             String pluginVersion) {
        Path target = worldRoot.resolve("datapacks").resolve(zipFileName);
        Path marker = versionMarkerPath(target);
        Path temp = null;
        try {
            removeLegacyFolderExtract(worldRoot);

            temp = Files.createTempFile("rituals-datapack-", ".zip");
            try (InputStream in = openBundledZipStream(anchor, worldRoot, pluginJar)) {
                if (in == null) {
                    System.err.println("[Rituals] No bundled datapack zip found in plugin JAR.");
                    return null;
                }
                Files.copy(in, temp, StandardCopyOption.REPLACE_EXISTING);
            }

            if (!isValidZip(temp)) {
                System.err.println("[Rituals] Bundled datapack zip is invalid.");
                return null;
            }

            String bundledHash = sha256Hex(temp);
            if (isValidZip(target) && bundledHash.equals(sha256Hex(target))) {
                writeVersionMarker(marker, pluginVersion);
                return null;
            }

            Files.createDirectories(target.getParent());
            Files.copy(temp, target, StandardCopyOption.REPLACE_EXISTING);

            if (!isValidZip(target)) {
                Files.deleteIfExists(target);
                System.err.println("[Rituals] Invalid datapack zip after install: " + target.toAbsolutePath());
                return null;
            }

            writeVersionMarker(marker, pluginVersion);
            System.out.println("[Rituals] Installed datapack zip -> " + target.toAbsolutePath()
                    + " (" + Files.size(target) + " bytes, plugin v" + pluginVersion + ")");
            return target;
        } catch (IOException ex) {
            System.err.println("[Rituals] Failed to install datapack zip at " + target.toAbsolutePath() + ": " + ex.getMessage());
            ex.printStackTrace();
            return null;
        } finally {
            if (temp != null) {
                try {
                    Files.deleteIfExists(temp);
                } catch (IOException ignored) {
                    // best effort
                }
            }
        }
    }

    static void removeLegacyFolderExtract(Path worldRoot) throws IOException {
        Path legacy = worldRoot.resolve("datapacks").resolve(LEGACY_FOLDER_NAME);
        if (!Files.exists(legacy)) {
            return;
        }
        deleteRecursive(legacy);
        System.out.println("[Rituals] Removed legacy extracted datapack folder -> " + legacy.toAbsolutePath());
    }

    public static boolean isInstalled(Path serverRoot, String levelName, String zipFileName) {
        return isInstalledInWorld(serverRoot.resolve(levelName), zipFileName);
    }

    public static boolean isInstalledInWorld(Path worldRoot, String zipFileName) {
        return isValidZip(worldRoot.resolve("datapacks").resolve(zipFileName));
    }

    static List<Path> findWorldRoots(Path serverRoot) {
        if (serverRoot == null) {
            return List.of();
        }
        Set<Path> worlds = new LinkedHashSet<>();
        Path primary = serverRoot.resolve(readLevelName(serverRoot));
        if (hasLevelDat(primary)) {
            worlds.add(primary);
        }
        if (Files.isDirectory(serverRoot)) {
            try (var stream = Files.list(serverRoot)) {
                stream.filter(DatapackFiles::hasLevelDat).forEach(worlds::add);
            } catch (IOException ignored) {
                // keep primary only
            }
        }
        if (worlds.isEmpty()) {
            worlds.add(primary);
        }
        return List.copyOf(worlds);
    }

    static boolean hasLevelDat(Path dir) {
        return Files.isRegularFile(dir.resolve("level.dat"));
    }

    public static String readLevelName(Path serverRoot) {
        if (serverRoot == null) {
            return DEFAULT_LEVEL;
        }
        Path propsFile = serverRoot.resolve("server.properties");
        if (!Files.isRegularFile(propsFile)) {
            return DEFAULT_LEVEL;
        }
        try {
            for (String line : Files.readAllLines(propsFile)) {
                if (line.startsWith("level-name=")) {
                    String name = line.substring("level-name=".length()).trim();
                    return name.isEmpty() ? DEFAULT_LEVEL : name;
                }
            }
        } catch (IOException ignored) {
            // fall through
        }
        return DEFAULT_LEVEL;
    }

    public static Path resolveServerRoot(String agentArgs) {
        if (agentArgs != null && !agentArgs.isBlank()) {
            return Paths.get(agentArgs).toAbsolutePath().normalize();
        }
        return Paths.get(".").toAbsolutePath().normalize();
    }

    public static String readPluginVersion(File pluginJar) {
        if (pluginJar == null || !pluginJar.isFile()) {
            return "unknown";
        }
        try (JarFile jar = new JarFile(pluginJar)) {
            Manifest manifest = jar.getManifest();
            if (manifest != null) {
                String version = manifest.getMainAttributes().getValue("Implementation-Version");
                if (version != null && !version.isBlank()) {
                    return version.trim();
                }
            }
        } catch (IOException ignored) {
            // fall through
        }
        return "unknown";
    }

    private static Path versionMarkerPath(Path zipPath) {
        return zipPath.resolveSibling(zipPath.getFileName().toString() + ".version");
    }

    private static String readVersionMarker(Path marker) {
        try {
            if (!Files.isRegularFile(marker)) {
                return null;
            }
            String text = Files.readString(marker).trim();
            return text.isEmpty() ? null : text;
        } catch (IOException ex) {
            return null;
        }
    }

    private static void writeVersionMarker(Path marker, String pluginVersion) throws IOException {
        if (pluginVersion == null || pluginVersion.isBlank()) {
            return;
        }
        String installed = readVersionMarker(marker);
        if (pluginVersion.equals(installed)) {
            return;
        }
        Files.writeString(marker, pluginVersion + System.lineSeparator());
    }

    private static String sha256Hex(Path path) throws IOException {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            try (InputStream in = Files.newInputStream(path)) {
                byte[] buffer = new byte[8192];
                int read;
                while ((read = in.read(buffer)) != -1) {
                    digest.update(buffer, 0, read);
                }
            }
            return HexFormat.of().formatHex(digest.digest());
        } catch (NoSuchAlgorithmException ex) {
            throw new IllegalStateException("SHA-256 not available", ex);
        }
    }

    private static InputStream openBundledZipStream(Class<?> anchor, Path worldRoot, File pluginJar) throws IOException {
        InputStream fromJar = anchor.getResourceAsStream("/" + BUNDLED_ZIP);
        if (fromJar != null) {
            return fromJar;
        }
        fromJar = anchor.getClassLoader().getResourceAsStream(BUNDLED_ZIP);
        if (fromJar != null) {
            return fromJar;
        }

        if (pluginJar != null && pluginJar.isFile()) {
            JarFile jar = new JarFile(pluginJar);
            JarEntry entry = jar.getJarEntry(BUNDLED_ZIP);
            if (entry != null) {
                return new JarEntryInputStream(jar, jar.getInputStream(entry));
            }
            jar.close();
        }

        Path serverRoot = worldRoot.getParent() != null && Files.isRegularFile(worldRoot.getParent().resolve("level.dat"))
                ? worldRoot.getParent().getParent() != null ? worldRoot.getParent().getParent() : worldRoot.getParent()
                : worldRoot.getParent() != null ? worldRoot.getParent() : worldRoot;
        if (worldRoot.getParent() != null && Files.isRegularFile(worldRoot.getParent().resolve("server.properties"))) {
            serverRoot = worldRoot.getParent();
        } else if (worldRoot.getParent() != null && worldRoot.getParent().getParent() != null
                && Files.isRegularFile(worldRoot.getParent().getParent().resolve("server.properties"))) {
            serverRoot = worldRoot.getParent().getParent();
        }

        for (Path candidate : List.of(
                serverRoot.resolve("plugins/Rituals").resolve(DEFAULT_ZIP_NAME),
                serverRoot.resolve("plugins/Rituals").resolve(BUNDLED_ZIP),
                worldRoot.resolve("datapacks").resolve(DEFAULT_ZIP_NAME),
                worldRoot.resolve("datapacks").resolve("rituals-datapack-2.0.0.zip")
        )) {
            if (isValidZip(candidate)) {
                return Files.newInputStream(candidate);
            }
        }
        return null;
    }

    private static final class JarEntryInputStream extends InputStream {
        private final JarFile jar;
        private final InputStream delegate;

        private JarEntryInputStream(JarFile jar, InputStream delegate) {
            this.jar = jar;
            this.delegate = delegate;
        }

        @Override
        public int read() throws IOException {
            return delegate.read();
        }

        @Override
        public int read(byte[] b, int off, int len) throws IOException {
            return delegate.read(b, off, len);
        }

        @Override
        public void close() throws IOException {
            try {
                delegate.close();
            } finally {
                jar.close();
            }
        }
    }

    static boolean isValidZip(Path zip) {
        try {
            if (!Files.isRegularFile(zip) || Files.size(zip) < MIN_ZIP_BYTES) {
                return false;
            }
            try (ZipFile file = new ZipFile(zip.toFile())) {
                return file.getEntry("pack.mcmeta") != null
                        && file.getEntry("data/minecraft/tags/function/load.json") != null
                        && file.getEntry("data/rituals/function/load.mcfunction") != null;
            }
        } catch (IOException ex) {
            return false;
        }
    }

    private static void deleteRecursive(Path root) throws IOException {
        if (!Files.exists(root)) {
            return;
        }
        Files.walkFileTree(root, new SimpleFileVisitor<>() {
            @Override
            public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
                Files.delete(file);
                return FileVisitResult.CONTINUE;
            }

            @Override
            public FileVisitResult postVisitDirectory(Path dir, IOException exc) throws IOException {
                Files.delete(dir);
                return FileVisitResult.CONTINUE;
            }
        });
    }
}
