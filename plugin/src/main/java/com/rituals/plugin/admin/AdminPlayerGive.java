package com.rituals.plugin.admin;

import com.rituals.plugin.RitualsPlugin;
import com.rituals.plugin.config.Messages;
import org.bukkit.Bukkit;
import org.bukkit.entity.Player;

import java.util.UUID;

public final class AdminPlayerGive {

    private AdminPlayerGive() {
    }

    public static Player requireOnline(RitualsPlugin plugin, Player admin, UUID targetUuid) {
        Player target = Bukkit.getPlayer(targetUuid);
        if (target == null || !target.isOnline()) {
            Messages.send(admin, plugin.getPluginConfig().prefix("&cThat player must be online."));
            return null;
        }
        return target;
    }

    public static void giveFunction(RitualsPlugin plugin, Player admin, Player target, String functionPath, String label) {
        plugin.getDatapackBridge().runFunction(target, "rituals:" + functionPath);
        Messages.send(admin, plugin.getPluginConfig().prefix(
                "&aGave &f" + label + " &ato &f" + target.getName() + "&a."));
        if (!admin.equals(target)) {
            Messages.send(target, plugin.getPluginConfig().prefix("&aYou received &f" + label + "&a."));
        }
    }
}
