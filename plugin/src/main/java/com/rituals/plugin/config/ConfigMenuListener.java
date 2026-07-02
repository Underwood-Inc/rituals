package com.rituals.plugin.config;

import com.rituals.plugin.RitualsPlugin;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.inventory.InventoryClickEvent;
import org.bukkit.event.inventory.InventoryDragEvent;

public final class ConfigMenuListener implements Listener {

    private final RitualsPlugin plugin;

    public ConfigMenuListener(RitualsPlugin plugin) {
        this.plugin = plugin;
    }

    @EventHandler
    public void onClick(InventoryClickEvent event) {
        if (!(event.getWhoClicked() instanceof Player player)) {
            return;
        }
        if (!(event.getInventory().getHolder() instanceof ConfigMenu)) {
            return;
        }
        event.setCancelled(true);
        if (!player.hasPermission("rituals.config")) {
            Messages.send(player, plugin.getPluginConfig().noPermission());
            player.closeInventory();
            return;
        }

        ConfigMenu.Action action = ConfigMenu.actionOf(plugin, event.getCurrentItem());
        if (action == null) {
            return;
        }

        var bridge = plugin.getDatapackBridge();
        switch (action) {
            case KIWI_ON -> bridge.enableKiwiMode();
            case KIWI_OFF -> bridge.disableKiwiMode();
            case FIRE_ON -> bridge.setRequireFireSacrifice(true);
            case FIRE_OFF -> bridge.setRequireFireSacrifice(false);
            case XP_EASY -> bridge.setSoulXpPreset("easy");
            case XP_HARD -> bridge.setSoulXpPreset("hard");
            case RELOAD -> plugin.reloadAll();
            case CLOSE -> player.closeInventory();
        }

        if (action != ConfigMenu.Action.CLOSE) {
            Messages.send(player, plugin.getPluginConfig().prefix("&aApplied: " + action.name()));
        }
    }

    @EventHandler
    public void onDrag(InventoryDragEvent event) {
        if (event.getInventory().getHolder() instanceof ConfigMenu) {
            event.setCancelled(true);
        }
    }
}
