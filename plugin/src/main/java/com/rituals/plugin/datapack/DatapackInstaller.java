package com.rituals.plugin.datapack;

import com.rituals.plugin.RitualsPlugin;
import org.bukkit.World;

import java.io.File;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

public final class DatapackInstaller {

    private final RitualsPlugin plugin;

    public DatapackInstaller(RitualsPlugin plugin) {
        this.plugin = plugin;
    }

    public void installBeforeWorldsLoad() {
        install(false);
    }

    /** Retry after worlds exist (e.g. if {@code onLoad} ran before paths were valid). */
    public void installAfterEnable() {
        install(true);
    }

    private void install(boolean worldAlreadyLoaded) {
        if (!plugin.getConfig().getBoolean("datapack.auto-install", true)) {
            return;
        }

        String zipFileName = plugin.getConfig().getString("datapack.zip-file", DatapackFiles.DEFAULT_ZIP_NAME);
        String folderName = plugin.getConfig().getString("datapack.folder-name", DatapackFiles.DEFAULT_FOLDER_NAME);
        Path serverRoot = ServerPaths.serverRoot(plugin);
        Path defaultWorld = ServerPaths.defaultWorld(plugin);
        File pluginJar = plugin.getPluginJar();

        plugin.getLogger().info("Rituals datapack install — server root: " + serverRoot
                + ", default world: " + defaultWorld);

        Set<Path> installed = new LinkedHashSet<>();

        if (worldAlreadyLoaded && plugin.getServer() != null) {
            for (World world : plugin.getServer().getWorlds()) {
                installed.addAll(DatapackFiles.installToWorld(
                        world.getWorldFolder().toPath(), zipFileName, folderName, RitualsPlugin.class, pluginJar));
            }
        }

        installed.addAll(DatapackFiles.installToWorld(
                defaultWorld, zipFileName, folderName, RitualsPlugin.class, pluginJar));
        installed.addAll(DatapackFiles.installAllWorlds(
                serverRoot, zipFileName, folderName, RitualsPlugin.class, pluginJar));

        for (Path path : installed) {
            plugin.getLogger().info("Rituals datapack ready at " + path.toAbsolutePath());
        }

        if (!isInstalled()) {
            Path expected = defaultWorld.resolve("datapacks").resolve(zipFileName);
            plugin.getLogger().severe("Rituals datapack NOT at " + expected.toAbsolutePath());
            plugin.getLogger().severe("Upload build/server-deploy/world/datapacks/rituals.zip manually, then restart.");
            return;
        }

        if (worldAlreadyLoaded && !installed.isEmpty() && plugin.getDatapackBridge() != null) {
            plugin.getLogger().info("New Rituals datapack files installed — reloading datapacks (plugin crafting recipes may need a server restart).");
            plugin.getDatapackBridge().reloadDatapacks();
        }
    }

    public boolean isInstalled() {
        Path world = ServerPaths.defaultWorld(plugin);
        String zipFileName = plugin.getConfig().getString("datapack.zip-file", DatapackFiles.DEFAULT_ZIP_NAME);
        String folderName = plugin.getConfig().getString("datapack.folder-name", DatapackFiles.DEFAULT_FOLDER_NAME);
        return DatapackFiles.isInstalledInWorld(world, zipFileName, folderName);
    }
}
