package com.rituals.plugin.gui;

import com.rituals.plugin.RitualsPlugin;
import com.rituals.plugin.recipe.RitualRecipeCatalog;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.ItemMeta;

import java.util.List;

public final class GuideHubMenu implements Menus.RitualsScreen {

    private final Inventory inventory;

    private GuideHubMenu(RitualsPlugin plugin) {
        this.inventory = Bukkit.createInventory(this, 54, Menus.title("&8Rituals Crafting Guide"));
        build(plugin);
    }

    public static void open(RitualsPlugin plugin, Player player) {
        player.openInventory(new GuideHubMenu(plugin).getInventory());
    }

    private void build(RitualsPlugin plugin) {
        inventory.setItem(Menus.SLOT_HEADER, Menus.button(
                plugin,
                Material.WRITABLE_BOOK,
                "&d&lRituals Crafting Guide",
                List.of(
                        " ",
                        "&7Visual recipes for totems & tools.",
                        "&7Crafting happens in the datapack.",
                        " ",
                        "&8Pick a recipe below."
                ),
                "noop",
                null
        ));

        inventory.setItem(20, Menus.button(
                plugin,
                Material.SPYGLASS,
                "&dScrying Glass",
                List.of(" ", "&7Soul weapon sync tool.", " ", "&eClick » View"),
                "guide_recipe",
                "scrying_glass"
        ));

        int slot = 28;
        for (RitualRecipeCatalog.TotemTier tier : RitualRecipeCatalog.totemTiers()) {
            if (slot > 34) {
                break;
            }
            inventory.setItem(slot++, Menus.button(
                    plugin,
                    tier.icon(),
                    tier.title(),
                    List.of(" ", "&7Totem tier " + tier.tier() + ".", " ", "&eClick » View"),
                    "guide_totem",
                    tier.id()
            ));
        }

        inventory.setItem(40, Menus.button(
                plugin,
                Material.BOOK,
                "&7Datapack-only rituals",
                List.of(
                        " ",
                        "&7Some rituals have no crafting",
                        "&7recipe — use chat guide:",
                        "&b/rituals guide play"
                ),
                "chat_play",
                null
        ));

        inventory.setItem(Menus.SLOT_BACK, Menus.button(
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
