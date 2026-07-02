package com.rituals.plugin.admin;

import com.rituals.plugin.RitualsPlugin;
import com.rituals.plugin.config.Messages;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.inventory.Inventory;

import java.util.List;

public final class AdminHubMenu implements AdminMenus.AdminScreen {

    private final Inventory inventory;

    private AdminHubMenu(RitualsPlugin plugin) {
        this.inventory = Bukkit.createInventory(this, 54, Messages.colorize("&5Rituals &8— &7Admin"));
        build(plugin);
    }

    public static void open(RitualsPlugin plugin, Player player) {
        player.openInventory(new AdminHubMenu(plugin).getInventory());
    }

    private void build(RitualsPlugin plugin) {
        inventory.setItem(AdminMenus.SLOT_HEADER, AdminMenus.button(
                plugin,
                Material.NETHER_STAR,
                "&d&lRituals Admin",
                List.of(
                        " ",
                        "&7Plugin QoL — datapack unchanged.",
                        "&7Config, guides, and player grants."
                ),
                "noop",
                null
        ));

        inventory.setItem(AdminMenus.ROW2_LEFT, AdminMenus.button(
                plugin,
                Material.COMPARATOR,
                "&5Config",
                List.of(" ", "&7Kiwi mode, fire sacrifice, soul XP.", " ", "&eClick » Open"),
                "open_config",
                null
        ));
        inventory.setItem(AdminMenus.ROW2_CENTER, AdminMenus.button(
                plugin,
                Material.WRITABLE_BOOK,
                "&dCrafting Guide",
                List.of(" ", "&7Chest GUI for totem recipes.", " ", "&eClick » Open"),
                "open_guide",
                null
        ));
        inventory.setItem(AdminMenus.ROW2_RIGHT, AdminMenus.button(
                plugin,
                Material.CHEST,
                "&aGive Items",
                List.of(" ", "&7Player lookup — grant totems.", " ", "&eClick » Open"),
                "open_give",
                null
        ));

        inventory.setItem(AdminMenus.SLOT_BACK, AdminMenus.button(
                plugin,
                Material.BARRIER,
                "&cClose",
                List.of(),
                "close",
                null
        ));
    }

    @Override
    public Inventory getInventory() {
        return inventory;
    }
}
