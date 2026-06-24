package com.rituals.plugin;

import com.rituals.plugin.command.RitualsCommand;
import com.rituals.plugin.config.ConfigMenuListener;
import com.rituals.plugin.config.PluginConfig;
import com.rituals.plugin.datapack.DatapackBridge;
import com.rituals.plugin.datapack.DatapackInstaller;
import com.rituals.plugin.integration.PlaceholderHook;
import com.rituals.plugin.integration.VaultHook;
import org.bukkit.event.HandlerList;
import org.bukkit.plugin.java.JavaPlugin;

/**
 * Spigot plugin for Rituals — permissions, config GUI, optional Vault / PlaceholderAPI.
 * Core gameplay remains in the bundled datapack (also installable standalone).
 */
public final class RitualsPlugin extends JavaPlugin {

    private static RitualsPlugin instance;

    private PluginConfig pluginConfig;
    private DatapackBridge datapackBridge;
    private DatapackInstaller datapackInstaller;
    private VaultHook vaultHook;
    private PlaceholderHook placeholderHook;
    private ConfigMenuListener configMenuListener;

    public static RitualsPlugin getInstance() {
        return instance;
    }

    public PluginConfig getPluginConfig() {
        return pluginConfig;
    }

    public DatapackBridge getDatapackBridge() {
        return datapackBridge;
    }

    public VaultHook getVaultHook() {
        return vaultHook;
    }

    public java.io.File getPluginJar() {
        return getFile();
    }

    @Override
    public void onLoad() {
        instance = this;
        saveDefaultConfig();
        datapackInstaller = new DatapackInstaller(this);
        datapackInstaller.installBeforeWorldsLoad();
    }

    @Override
    public void onEnable() {
        pluginConfig = new PluginConfig(this);
        pluginConfig.reload();

        datapackBridge = new DatapackBridge(this);

        if (!datapackInstaller.isInstalled()) {
            getLogger().severe("Rituals datapack zip is not in the default world's datapacks folder.");
            getLogger().severe("Set datapack.auto-install: true and restart, or copy rituals-datapack-*.zip to world/datapacks/rituals.zip");
        }

        var ritualsCommand = new RitualsCommand(this);
        var command = getCommand("rituals");
        if (command != null) {
            command.setExecutor(ritualsCommand);
            command.setTabCompleter(ritualsCommand);
        } else {
            getLogger().severe("Command 'rituals' missing from plugin.yml");
        }

        configMenuListener = new ConfigMenuListener(this);
        getServer().getPluginManager().registerEvents(configMenuListener, this);

        vaultHook = new VaultHook(this);
        vaultHook.tryHook();

        placeholderHook = new PlaceholderHook(this);
        placeholderHook.tryHook();

        getLogger().info("Rituals plugin enabled (v" + getDescription().getVersion() + ").");
        if (vaultHook.isEnabled()) {
            getLogger().info("Vault economy integration active.");
        }
        if (placeholderHook.isEnabled()) {
            getLogger().info("PlaceholderAPI expansion registered.");
        }
    }

    @Override
    public void onDisable() {
        if (configMenuListener != null) {
            HandlerList.unregisterAll(configMenuListener);
        }
        if (placeholderHook != null) {
            placeholderHook.unregister();
        }
        instance = null;
    }

    public void reloadAll() {
        reloadConfig();
        pluginConfig.reload();
        vaultHook.tryHook();
        placeholderHook.tryHook();
        datapackBridge.reloadDatapackConfig();
    }
}
