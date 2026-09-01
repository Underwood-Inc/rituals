package com.rituals.plugin.datapack;

import com.rituals.plugin.RitualsPlugin;
import org.bukkit.command.CommandSender;

/**
 * Rituals datapack command helpers — delegates to shared utils bridge.
 */public final class DatapackBridge {

    private final RitualsPlugin plugin;
    private final com.shirecraft.bukkit.datapack.DatapackBridge bridge;

    public DatapackBridge(RitualsPlugin plugin) {
        this.plugin = plugin;
        this.bridge = new com.shirecraft.bukkit.datapack.DatapackBridge(plugin, "rituals");
    }

    public void runFunction(CommandSender as, String functionPath) {
        bridge.runFunction(as, functionPath);
    }

    public void runFunctionAsConsole(String functionPath) {
        bridge.runFunctionAsConsole(functionPath);
    }

    public void setStorageBoolean(String key, boolean value) {
        bridge.setStorageBoolean(key, value);
    }

    public void reloadDatapackConfig() {
        bridge.reloadDatapackConfig("rituals:config/reload");
    }

    public void reloadDatapacks() {
        bridge.reloadDatapacks();
    }

    public void enableKiwiMode() {
        setStorageBoolean("kiwi_mode", true);
        reloadDatapackConfig();
        runFunctionAsConsole("rituals:admin/enable_kiwi_mode");
    }

    public void disableKiwiMode() {
        setStorageBoolean("kiwi_mode", false);
        reloadDatapackConfig();
        runFunctionAsConsole("rituals:admin/disable_kiwi_mode");
    }

    public void setRequireFireSacrifice(boolean required) {
        setStorageBoolean("require_fire_sacrifice", required);
        reloadDatapackConfig();
    }

    public void setSoulXpPreset(String preset) {
        runFunctionAsConsole("rituals:config/soul_xp/set_" + preset);
    }
}
