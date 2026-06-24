package com.rituals.plugin.datapack;

import com.rituals.plugin.RitualsPlugin;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.zip.ZipFile;

/**
 * Copies the bundled datapack zip into the default world's datapacks folder during {@code onLoad()},
 * before Minecraft loads worlds (and their datapacks).
 */
public final class DatapackInstaller {

    static final String BUNDLED_ZIP = "rituals-datapack.zip";
    private static final long MIN_ZIP_BYTES = 200_000L;

    private final RitualsPlugin plugin;

    public DatapackInstaller(RitualsPlugin plugin) {
        this.plugin = plugin;
    }

    /**
     * Must run from {@link RitualsPlugin#onLoad()} — worlds are not loaded yet.
     */
    public void installBeforeWorldsLoad() {
        if (!plugin.getConfig().getBoolean("datapack.auto-install", true)) {
            return;
        }

        String zipFileName = plugin.getConfig().getString("datapack.zip-file", "rituals.zip");
        Path targetZip = defaultWorldDatapacksDir().resolve(zipFileName);

        try {
            if (isValidZip(targetZip)) {
                return;
            }

            Files.createDirectories(targetZip.getParent());

            try (InputStream in = openBundledZipStream()) {
                if (in == null) {
                    plugin.getLogger().severe("Bundled " + BUNDLED_ZIP + " is missing from the plugin JAR.");
                    return;
                }
                Files.copy(in, targetZip, StandardCopyOption.REPLACE_EXISTING);
            }

            if (!isValidZip(targetZip)) {
                plugin.getLogger().severe("Failed to install Rituals datapack zip at " + targetZip);
                return;
            }

            plugin.getLogger().info("Installed Rituals datapack zip -> " + targetZip + " (" + Files.size(targetZip) + " bytes)");
        } catch (IOException ex) {
            plugin.getLogger().severe("Failed to install Rituals datapack: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    public boolean isInstalled() {
        String zipFileName = plugin.getConfig().getString("datapack.zip-file", "rituals.zip");
        return isValidZip(defaultWorldDatapacksDir().resolve(zipFileName));
    }

    private static boolean isValidZip(Path zip) {
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

    private Path defaultWorldDatapacksDir() {
        return plugin.getServer().getWorldContainer().toPath()
                .resolve(readLevelName())
                .resolve("datapacks");
    }

    private String readLevelName() {
        try {
            Path propsFile = plugin.getServer().getWorldContainer().toPath().resolve("server.properties");
            for (String line : Files.readAllLines(propsFile)) {
                if (line.startsWith("level-name=")) {
                    return line.substring("level-name=".length()).trim();
                }
            }
        } catch (IOException ignored) {
            // default below
        }
        return "world";
    }

    private InputStream openBundledZipStream() throws IOException {
        InputStream resource = RitualsPlugin.class.getResourceAsStream("/" + BUNDLED_ZIP);
        if (resource != null) {
            return resource;
        }

        java.io.File jarFile = plugin.getPluginJar();
        if (!jarFile.isFile()) {
            return null;
        }

        JarFile jar = new JarFile(jarFile);
        JarEntry entry = jar.getJarEntry(BUNDLED_ZIP);
        if (entry == null) {
            jar.close();
            return null;
        }
        return new FilterCloseInputStream(jar.getInputStream(entry), jar);
    }

    private static final class FilterCloseInputStream extends InputStream {
        private final InputStream delegate;
        private final JarFile jar;

        private FilterCloseInputStream(InputStream delegate, JarFile jar) {
            this.delegate = delegate;
            this.jar = jar;
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
}
