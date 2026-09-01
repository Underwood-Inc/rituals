package com.rituals.plugin.admin;

import com.rituals.plugin.RitualsPlugin;
import com.shirecraft.bukkit.chat.AdminGiveFeedback;
import com.shirecraft.bukkit.chat.CommandFeedback;
import org.bukkit.Bukkit;
import org.bukkit.entity.Player;

import java.util.UUID;

public final class AdminPlayerGive {

    private AdminPlayerGive() {
    }

    public static Player requireOnline(RitualsPlugin plugin, Player admin, UUID targetUuid) {
        Player target = Bukkit.getPlayer(targetUuid);
        if (target == null || !target.isOnline()) {
            CommandFeedback.send(admin, plugin.getPluginConfig().prefix("&cThat player must be online."));
            return null;
        }
        return target;
    }

    public static void giveFunction(RitualsPlugin plugin, Player admin, Player target, String functionPath, String label) {
        plugin.getDatapackBridge().runFunction(target, "rituals:" + functionPath);
        AdminGiveFeedback.sendGiveMessages(
                admin, target, plugin.getPluginConfig().messagePrefix(), label);
    }
}
