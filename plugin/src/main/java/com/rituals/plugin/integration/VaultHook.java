package com.rituals.plugin.integration;

import com.shirecraft.bukkit.chat.CommandFeedback;
import com.shirecraft.bukkit.chat.LegacyColors;

import com.rituals.plugin.RitualsPlugin;
import net.milkbowl.vault.economy.Economy;
import org.bukkit.Bukkit;
import org.bukkit.entity.Player;
import org.bukkit.plugin.RegisteredServiceProvider;

/**
 * Optional Vault economy — never required for core gameplay.
 */
public final class VaultHook {

    private final RitualsPlugin plugin;
    private Economy economy;
    private boolean enabled;

    public VaultHook(RitualsPlugin plugin) {
        this.plugin = plugin;
    }

    public void tryHook() {
        enabled = false;
        economy = null;

        if (!plugin.getPluginConfig().isVaultIntegrationEnabled()) {
            return;
        }
        if (Bukkit.getPluginManager().getPlugin("Vault") == null) {
            return;
        }
        RegisteredServiceProvider<Economy> rsp =
                Bukkit.getServicesManager().getRegistration(Economy.class);
        if (rsp == null) {
            plugin.getLogger().warning("Vault is installed but no Economy provider was found.");
            return;
        }
        economy = rsp.getProvider();
        enabled = true;
    }

    public boolean isEnabled() {
        return enabled && economy != null;
    }

    /**
     * @return true if charge succeeded or economy is disabled / cost is zero
     */
    public boolean charge(Player player, double amount) {
        if (amount <= 0) {
            return true;
        }
        if (!isEnabled()) {
            CommandFeedback.send(player, plugin.getPluginConfig().vaultMissing());
            return false;
        }
        if (!economy.has(player, amount)) {
            CommandFeedback.send(player, plugin.getPluginConfig().vaultInsufficient(amount));
            return false;
        }
        economy.withdrawPlayer(player, amount);
        CommandFeedback.send(player, plugin.getPluginConfig().vaultCharged(amount));
        return true;
    }
}
