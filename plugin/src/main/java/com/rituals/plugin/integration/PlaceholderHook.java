package com.rituals.plugin.integration;

import com.rituals.plugin.RitualsPlugin;
import me.clip.placeholderapi.expansion.PlaceholderExpansion;
import org.bukkit.Bukkit;
import org.bukkit.OfflinePlayer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/**
 * Optional PlaceholderAPI placeholders — soft dependency.
 */
public final class PlaceholderHook {

    private final RitualsPlugin plugin;
    private RitualsExpansion expansion;
    private boolean enabled;

    public PlaceholderHook(RitualsPlugin plugin) {
        this.plugin = plugin;
    }

    public void tryHook() {
        unregister();
        enabled = false;

        if (!plugin.getPluginConfig().isPlaceholderIntegrationEnabled()) {
            return;
        }
        if (Bukkit.getPluginManager().getPlugin("PlaceholderAPI") == null) {
            return;
        }
        expansion = new RitualsExpansion(plugin);
        if (expansion.register()) {
            enabled = true;
        }
    }

    public void unregister() {
        if (expansion != null) {
            expansion.unregister();
            expansion = null;
        }
        enabled = false;
    }

    public boolean isEnabled() {
        return enabled;
    }

    private static final class RitualsExpansion extends PlaceholderExpansion {

        private final RitualsPlugin plugin;

        private RitualsExpansion(RitualsPlugin plugin) {
            this.plugin = plugin;
        }

        @Override
        public @NotNull String getIdentifier() {
            return "rituals";
        }

        @Override
        public @NotNull String getAuthor() {
            return String.join(", ", plugin.getDescription().getAuthors());
        }

        @Override
        public @NotNull String getVersion() {
            return plugin.getDescription().getVersion();
        }

        @Override
        public boolean persist() {
            return true;
        }

        @Override
        public @Nullable String onRequest(OfflinePlayer player, @NotNull String params) {
            return switch (params.toLowerCase()) {
                case "version" -> plugin.getDescription().getVersion();
                case "datapack_installed" ->
                        plugin.getPluginConfig().isAutoInstallDatapack() ? "bundled" : "manual";
                case "vault" -> plugin.getVaultHook().isEnabled() ? "true" : "false";
                default -> null;
            };
        }
    }
}
