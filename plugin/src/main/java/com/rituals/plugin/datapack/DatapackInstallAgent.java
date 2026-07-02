package com.rituals.plugin.datapack;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

/**
 * Runs before {@code Main.main} when the server JVM is started with:
 * {@code -javaagent:plugins/rituals-plugin.jar}
 */
public final class DatapackInstallAgent {

    public static void premain(String agentArgs, java.lang.instrument.Instrumentation instrumentation) {
        install(DatapackFiles.resolveServerRoot(agentArgs));
    }

    public static void main(String[] args) {
        Path serverRoot = DatapackFiles.resolveServerRoot(args.length > 0 ? args[0] : null);
        boolean ok = !install(serverRoot).isEmpty()
                || DatapackFiles.isInstalled(serverRoot, DatapackFiles.readLevelName(serverRoot), DatapackFiles.DEFAULT_ZIP_NAME);
        System.exit(ok ? 0 : 1);
    }

    private static List<Path> install(Path serverRoot) {
        if (serverRoot == null) {
            serverRoot = Paths.get(".").toAbsolutePath().normalize();
        }
        File pluginJar = findPluginJar(serverRoot);
        System.out.println("[Rituals] Pre-start datapack install (server root: " + serverRoot + ")");
        return DatapackFiles.installAllWorlds(
                serverRoot,
                DatapackFiles.DEFAULT_ZIP_NAME,
                DatapackFiles.DEFAULT_FOLDER_NAME,
                DatapackInstallAgent.class,
                pluginJar
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
