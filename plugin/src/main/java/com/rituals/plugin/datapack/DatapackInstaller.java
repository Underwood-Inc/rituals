package com.rituals.plugin.datapack;

import com.rituals.plugin.RitualsPlugin;
import com.shirecraft.bukkit.datapack.DatapackInstallerRecipe;
import com.shirecraft.bukkit.datapack.DatapackSpec;

/**
 * Installs the bundled Rituals datapack zip using shared utils install recipe.
 */
public final class DatapackInstaller {

    public static final String DEFAULT_ZIP_NAME = "rituals.zip";

    private static final DatapackSpec SPEC = DatapackSpec.builder("Rituals", "rituals-datapack.zip")
            .defaultZipName(DEFAULT_ZIP_NAME)
            .minZipBytes(200_000L)
            .legacyFolderName("rituals")
            .build();

    private final RitualsPlugin plugin;
    private final DatapackInstallerRecipe recipe;

    public DatapackInstaller(RitualsPlugin plugin) {
        this.plugin = plugin;
        this.recipe = new DatapackInstallerRecipe(
                plugin,
                SPEC,
                RitualsPlugin.class,
                plugin::getPluginJar,
                () -> plugin.getConfig().getBoolean("datapack.auto-install", true),
                () -> plugin.getConfig().getString("datapack.zip-file", DEFAULT_ZIP_NAME));
    }

    public void installBeforeWorldsLoad() {
        recipe.installBeforeWorldsLoad();
    }

    public void installAfterEnable() {
        recipe.installAfterEnable();
        if (!recipe.isInstalled()) {
            plugin.getLogger().severe("Upload build/server-deploy/world/datapacks/rituals.zip manually, then restart.");
            return;
        }
        if (recipe.zipUpdatedThisSession() && plugin.getDatapackBridge() != null) {
            plugin.getLogger().info(
                    "New Rituals datapack files installed — reloading datapacks (plugin crafting recipes may need a server restart).");
            plugin.getDatapackBridge().reloadDatapacks();
        }
    }

    public boolean isInstalled() {
        return recipe.isInstalled();
    }
}
