package com.rituals.plugin.gui;

import com.rituals.plugin.RitualsPlugin;
import com.rituals.plugin.config.Messages;
import com.rituals.plugin.guide.RecipeChatGuide;
import com.rituals.plugin.recipe.RitualRecipeCatalog;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.inventory.InventoryClickEvent;
import org.bukkit.event.inventory.InventoryDragEvent;
import org.bukkit.inventory.ItemStack;

public final class GuideMenuListener implements Listener {

    private final RitualsPlugin plugin;

    public GuideMenuListener(RitualsPlugin plugin) {
        this.plugin = plugin;
    }

    @EventHandler
    public void onClick(InventoryClickEvent event) {
        if (!(event.getWhoClicked() instanceof Player player)) {
            return;
        }
        if (!(event.getInventory().getHolder() instanceof Menus.RitualsScreen)) {
            return;
        }
        event.setCancelled(true);

        if (!player.hasPermission("rituals.use")) {
            Messages.send(player, plugin.getPluginConfig().noPermission());
            player.closeInventory();
            return;
        }

        ItemStack clicked = event.getCurrentItem();
        String action = Menus.action(plugin, clicked);
        if (action == null) {
            return;
        }
        String payload = Menus.payload(plugin, clicked);
        var holder = event.getInventory().getHolder();

        if (holder instanceof GuideHubMenu) {
            handleHub(player, action, payload);
        } else if (holder instanceof ShapedRecipeGuideMenu) {
            handleRecipe(player, action, payload);
        }
    }

    private void handleHub(Player player, String action, String payload) {
        switch (action) {
            case "close" -> player.closeInventory();
            case "guide_recipe" -> {
                if ("scrying_glass".equals(payload)) {
                    ShapedRecipeGuideMenu.open(plugin, player, RitualRecipeCatalog.scryingGlass());
                }
            }
            case "guide_totem" -> {
                RitualRecipeCatalog.TotemTier tier = RecipeChatGuide.resolveTier(payload);
                if (tier != null) {
                    ShapedRecipeGuideMenu.open(plugin, player, RitualRecipeCatalog.totem(tier));
                }
            }
            case "chat_play" -> {
                player.closeInventory();
                RecipeChatGuide.sendPlayGuide(player);
            }
            default -> {
            }
        }
    }

    private void handleRecipe(Player player, String action, String payload) {
        switch (action) {
            case "close", "back_guide" -> GuideHubMenu.open(plugin, player);
            case "chat_recipe" -> {
                RitualRecipeCatalog.ShapedRecipeSpec spec = findSpec(payload);
                if (spec != null) {
                    RecipeChatGuide.sendRecipe(player, spec);
                }
            }
            default -> {
            }
        }
    }

    private static RitualRecipeCatalog.ShapedRecipeSpec findSpec(String id) {
        if (id == null) {
            return null;
        }
        for (RitualRecipeCatalog.ShapedRecipeSpec spec : RitualRecipeCatalog.allGuiRecipes()) {
            if (spec.id().equals(id)) {
                return spec;
            }
        }
        return null;
    }

    @EventHandler
    public void onDrag(InventoryDragEvent event) {
        if (event.getInventory().getHolder() instanceof Menus.RitualsScreen) {
            event.setCancelled(true);
        }
    }
}
