package com.rituals.plugin.datapack;

import com.shirecraft.bukkit.datapack.DatapackFiles;
import com.shirecraft.bukkit.datapack.DatapackSpec;

import java.io.File;
import java.nio.file.Path;
import java.util.List;

/**
 * Runs before {@code Main.main} when the server JVM is started with:
 * {@code -javaagent:plugins/rituals-plugin.jar}
 */
public final class DatapackInstallAgent {

    private static final DatapackSpec SPEC = DatapackSpec.builder("Rituals", "rituals-datapack.zip")
            .defaultZipName(DatapackInstaller.DEFAULT_ZIP_NAME)
            .minZipBytes(200_000L)
            .legacyFolderName("rituals")
            .build();

    public static void premain(String agentArgs, java.lang.instrument.Instrumentation instrumentation) {
        install(DatapackFiles.resolveServerRoot(agentArgs));
    }

    public static void main(String[] args) {
        Path serverRoot = DatapackFiles.resolveServerRoot(args.length > 0 ? args[0] : null);
        boolean ok = !install(serverRoot).isEmpty()
                || DatapackFiles.isInstalledInWorld(
                serverRoot.resolve(DatapackFiles.readLevelName(serverRoot)),
                DatapackInstaller.DEFAULT_ZIP_NAME,
                SPEC);
        System.exit(ok ? 0 : 1);
    }

    private static List<Path> install(Path serverRoot) {
        if (serverRoot == null) {
            serverRoot = DatapackFiles.resolveServerRoot(null);
        }
        File pluginJar = findPluginJar(serverRoot);
        String pluginVersion = DatapackFiles.readPluginVersion(pluginJar);
        System.out.println("[Rituals] Pre-start datapack install (server root: " + serverRoot + ", plugin v"
                + pluginVersion + ")");
        return DatapackFiles.installAllWorlds(
                serverRoot,
                DatapackInstaller.DEFAULT_ZIP_NAME,
                SPEC,
                DatapackInstallAgent.class,
                pluginJar,
                pluginVersion
        );
    }

    private static File findPluginJar(Path serverRoot) {
        Path plugins = serverRoot.resolve("plugins");
        if (!java.nio.file.Files.isDirectory(plugins)) {
            return null;
        }
        try (var stream = java.nio.file.Files.list(plugins)) {
            return stream
                    .filter(p -> p.getFileName().toString().startsWith("rituals-plugin")
                            && p.getFileName().toString().endsWith(".jar"))
                    .map(Path::toFile)
                    .findFirst()
                    .orElse(null);
        } catch (java.io.IOException ex) {
            return null;
        }
    }

    private DatapackInstallAgent() {
    }
}
