package com.rituals.plugin.admin;

import com.rituals.plugin.RitualsPlugin;
import com.rituals.plugin.config.ConfigMenu;
import com.rituals.plugin.config.Messages;
import com.rituals.plugin.gui.GuideHubMenu;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.inventory.InventoryClickEvent;
import org.bukkit.event.inventory.InventoryDragEvent;
import org.bukkit.inventory.ItemStack;

import java.util.UUID;

public final class AdminMenuListener implements Listener {

    private final RitualsPlugin plugin;

    public AdminMenuListener(RitualsPlugin plugin) {
        this.plugin = plugin;
    }

    @EventHandler
    public void onClick(InventoryClickEvent event) {
        if (!(event.getWhoClicked() instanceof Player player)) {
            return;
        }
        if (!(event.getInventory().getHolder() instanceof AdminMenus.AdminScreen)) {
            return;
        }
        event.setCancelled(true);

        if (!player.hasPermission("rituals.admin")) {
            Messages.send(player, plugin.getPluginConfig().noPermission());
            player.closeInventory();
            return;
        }

        ItemStack clicked = event.getCurrentItem();
        String action = AdminMenus.action(plugin, clicked);
        if (action == null) {
            return;
        }
        String payload = AdminMenus.payload(plugin, clicked);
        var holder = event.getInventory().getHolder();

        if (holder instanceof AdminHubMenu) {
            handleHub(player, action);
        } else if (holder instanceof PlayerGiveLookupMenu lookup) {
            handleGiveLookup(player, action, payload, lookup);
        } else if (holder instanceof PlayerGiveActionsMenu give) {
            handleGiveActions(player, action, payload, give);
        }
    }

    private void handleHub(Player player, String action) {
        switch (action) {
            case "open_config" -> ConfigMenu.open(plugin, player);
            case "open_guide" -> GuideHubMenu.open(plugin, player);
            case "open_give" -> PlayerGiveLookupMenu.open(plugin, player);
            case "close" -> player.closeInventory();
            default -> {
            }
        }
    }

    private void handleGiveLookup(Player player, String action, String payload, PlayerGiveLookupMenu menu) {
        switch (action) {
            case "back" -> AdminHubMenu.open(plugin, player);
            case "scope_online" -> PlayerGiveLookupMenu.open(plugin, player, 0, AdminPlayerHeads.LookupScope.ONLINE);
            case "scope_all" -> PlayerGiveLookupMenu.open(plugin, player, 0, AdminPlayerHeads.LookupScope.ALL);
            case "prev" -> PlayerGiveLookupMenu.open(plugin, player, Math.max(0, menu.page() - 1), menu.scope());
            case "next" -> PlayerGiveLookupMenu.open(plugin, player, menu.page() + 1, menu.scope());
            case "select_player" -> {
                if (payload == null) {
                    return;
                }
                UUID uuid;
                try {
                    uuid = UUID.fromString(payload);
                } catch (IllegalArgumentException ex) {
                    return;
                }
                PlayerGiveActionsMenu.open(plugin, player, uuid, menu.page(), menu.scope());
            }
            default -> {
            }
        }
    }

    private void handleGiveActions(Player player, String action, String payload, PlayerGiveActionsMenu menu) {
        Player target = AdminPlayerGive.requireOnline(plugin, player, menu.targetUuid());
        if (target == null) {
            return;
        }

        switch (action) {
            case "back", "back_lookup" -> PlayerGiveLookupMenu.open(plugin, player, menu.lookupPage(), menu.lookupScope());
            case "give_guidebook" -> {
                AdminPlayerGive.giveFunction(plugin, player, target, "give/guidebook", "guidebook");
                PlayerGiveActionsMenu.open(plugin, player, menu.targetUuid(), menu.lookupPage(), menu.lookupScope());
            }
            case "give_welcome" -> {
                AdminPlayerGive.giveFunction(plugin, player, target, "give/guidebook_welcome", "welcome guidebook");
                PlayerGiveActionsMenu.open(plugin, player, menu.targetUuid(), menu.lookupPage(), menu.lookupScope());
            }
            case "give_all" -> {
                AdminPlayerGive.giveFunction(plugin, player, target, "give/all", "totem set + guidebook");
                PlayerGiveActionsMenu.open(plugin, player, menu.targetUuid(), menu.lookupPage(), menu.lookupScope());
            }
            case "give_totem" -> {
                if (payload == null) {
                    return;
                }
                AdminPlayerGive.giveFunction(plugin, player, target, "give/totem_" + payload, payload + " totem");
                PlayerGiveActionsMenu.open(plugin, player, menu.targetUuid(), menu.lookupPage(), menu.lookupScope());
            }
            default -> {
            }
        }
    }

    @EventHandler
    public void onDrag(InventoryDragEvent event) {
        if (event.getInventory().getHolder() instanceof AdminMenus.AdminScreen) {
            event.setCancelled(true);
        }
    }
}
