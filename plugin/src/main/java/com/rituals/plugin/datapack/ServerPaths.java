package com.rituals.plugin.datapack;

import org.bukkit.plugin.java.JavaPlugin;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/** Resolves server root and default world directory on Spigot. */
public final class ServerPaths {

    private ServerPaths() {
    }

    /** Directory that contains {@code server.properties} and {@code plugins/}. */
    public static Path serverRoot(JavaPlugin plugin) {
        if (plugin != null && plugin.getServer() != null) {
            Path container = plugin.getServer().getWorldContainer().toPath().toAbsolutePath().normalize();
            if (hasServerProperties(container)) {
                return container;
            }
            Path parent = container.getParent();
            if (parent != null && hasServerProperties(parent)) {
                return parent;
            }
        }

        if (plugin != null) {
            Path fromDataFolder = fromPluginDataFolder(plugin);
            if (fromDataFolder != null) {
                return fromDataFolder;
            }
        }

        Path cwd = Paths.get(".").toAbsolutePath().normalize();
        if (hasServerProperties(cwd)) {
            return cwd;
        }
        return cwd;
    }

    /** Active default world folder (contains {@code level.dat} when the world exists). */
    public static Path defaultWorld(JavaPlugin plugin) {
        Path root = serverRoot(plugin);
        String levelName = DatapackFiles.readLevelName(root);

        if (plugin != null && plugin.getServer() != null) {
            Path container = plugin.getServer().getWorldContainer().toPath().toAbsolutePath().normalize();
            Path named = container.resolve(levelName);
            if (DatapackFiles.hasLevelDat(named)) {
                return named;
            }
            if (DatapackFiles.hasLevelDat(container)) {
                return container;
            }
            return named;
        }

        return root.resolve(levelName);
    }

    private static boolean hasServerProperties(Path dir) {
        return Files.isRegularFile(dir.resolve("server.properties"));
    }

    private static Path fromPluginDataFolder(JavaPlugin plugin) {
        try {
            Path data = plugin.getDataFolder().toPath().toAbsolutePath().normalize();
            Path pluginsDir = data.getParent();
            if (pluginsDir == null || !"plugins".equals(String.valueOf(pluginsDir.getFileName()))) {
                return null;
            }
            Path root = pluginsDir.getParent();
            if (root != null && Files.isDirectory(root)) {
                return root;
            }
        } catch (Exception ignored) {
            // fall through
        }
        return null;
    }
}
