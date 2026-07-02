package com.rituals.plugin.datapack;

import com.rituals.plugin.RitualsPlugin;
import org.bukkit.Bukkit;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;

/**
 * Dispatches vanilla commands that drive the Rituals datapack.
 */
public final class DatapackBridge {

    private final RitualsPlugin plugin;

    public DatapackBridge(RitualsPlugin plugin) {
        this.plugin = plugin;
    }

    public void runFunction(CommandSender as, String functionPath) {
        String path = functionPath.startsWith("rituals:") ? functionPath : "rituals:" + functionPath;
        if (as instanceof Player player) {
            dispatch("execute as " + player.getName() + " run function " + path);
        } else {
            dispatch("function " + path);
        }
    }

    public void runFunctionAsConsole(String functionPath) {
        String path = functionPath.startsWith("rituals:") ? functionPath : "rituals:" + functionPath;
        dispatch("function " + path);
    }

    public void setStorageBoolean(String key, boolean value) {
        dispatch("data modify storage rituals:config " + key + " set value " + value);
    }

    public void reloadDatapackConfig() {
        runFunctionAsConsole("rituals:config/reload");
    }

    /** Reload server datapacks (needed when the zip is copied after the world already loaded). */
    public void reloadDatapacks() {
        dispatch("minecraft:reload");
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

    private void dispatch(String command) {
        Bukkit.getScheduler().runTask(plugin, () -> {
            if (!Bukkit.dispatchCommand(Bukkit.getConsoleSender(), command)) {
                plugin.getLogger().warning("Datapack command failed (is the Rituals datapack loaded?): /" + command);
            }
        });
    }
}
