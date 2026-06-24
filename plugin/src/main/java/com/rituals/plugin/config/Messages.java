package com.rituals.plugin.config;

import org.bukkit.ChatColor;
import org.bukkit.command.CommandSender;

/** Chat helpers using Bukkit {@link org.bukkit.ChatColor} — Spigot-safe. */
public final class Messages {

    private Messages() {
    }

    public static String colorize(String input) {
        if (input == null || input.isEmpty()) {
            return "";
        }
        return ChatColor.translateAlternateColorCodes('&', input);
    }

    public static void send(CommandSender sender, String message) {
        sender.sendMessage(colorize(message));
    }

    public static String join(String prefix, String body) {
        return prefix + body;
    }
}
