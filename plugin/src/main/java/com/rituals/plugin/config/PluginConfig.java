package com.rituals.plugin.config;

import com.rituals.plugin.RitualsPlugin;

public final class PluginConfig {

    private final RitualsPlugin plugin;

    private boolean autoInstallDatapack;
    private String datapackFolderName;
    private boolean vaultIntegrationEnabled;
    private boolean placeholderIntegrationEnabled;
    private double giveTotemSetCost;
    private double soulRenameCost;
    private String messagePrefix;
    private String messageNoPermission;
    private String messageVaultMissing;
    private String messageVaultCharged;
    private String messageVaultInsufficient;

    public PluginConfig(RitualsPlugin plugin) {
        this.plugin = plugin;
    }

    public void reload() {
        var config = plugin.getConfig();
        autoInstallDatapack = config.getBoolean("datapack.auto-install", true);
        datapackFolderName = config.getString("datapack.zip-file", "rituals.zip");

        vaultIntegrationEnabled = config.getBoolean("integrations.vault-enabled", false);
        placeholderIntegrationEnabled = config.getBoolean("integrations.placeholderapi-enabled", true);

        giveTotemSetCost = config.getDouble("economy.give-totem-set-cost", 0.0);
        soulRenameCost = config.getDouble("economy.soul-rename-cost", 0.0);

        messagePrefix = config.getString("messages.prefix", "&5[Rituals]&r ");
        messageNoPermission = config.getString("messages.no-permission", "&cYou do not have permission.");
        messageVaultMissing = config.getString("messages.vault-missing", "&eVault is not installed — economy features are disabled.");
        messageVaultCharged = config.getString("messages.vault-charged", "&aCharged &6{amount}&a.");
        messageVaultInsufficient = config.getString("messages.vault-insufficient",
                "&cInsufficient funds (need &6{amount}&c).");
    }

    public boolean isAutoInstallDatapack() {
        return autoInstallDatapack;
    }

    public String getDatapackFolderName() {
        return datapackFolderName;
    }

    public boolean isVaultIntegrationEnabled() {
        return vaultIntegrationEnabled;
    }

    public boolean isPlaceholderIntegrationEnabled() {
        return placeholderIntegrationEnabled;
    }

    public double getGiveTotemSetCost() {
        return giveTotemSetCost;
    }

    public double getSoulRenameCost() {
        return soulRenameCost;
    }

    public String prefix(String body) {
        return Messages.join(messagePrefix, body);
    }

    public String noPermission() {
        return prefix(messageNoPermission);
    }

    public String vaultMissing() {
        return prefix(messageVaultMissing);
    }

    public String vaultCharged(double amount) {
        return prefix(messageVaultCharged.replace("{amount}", formatMoney(amount)));
    }

    public String vaultInsufficient(double amount) {
        return prefix(messageVaultInsufficient.replace("{amount}", formatMoney(amount)));
    }

    private static String formatMoney(double amount) {
        if (amount == Math.rint(amount)) {
            return String.valueOf((long) amount);
        }
        return String.format("%.2f", amount);
    }
}
