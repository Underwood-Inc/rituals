package com.rituals.plugin.gui;

import com.rituals.plugin.RitualsPlugin;
import com.rituals.plugin.gui.recipe.RecipeGuideRenderer;
import com.rituals.plugin.recipe.RitualRecipeCatalog;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.ItemMeta;

import java.util.List;

public final class ShapedRecipeGuideMenu implements Menus.RitualsScreen {

    private final Inventory inventory;
    private final String recipeId;

    private ShapedRecipeGuideMenu(RitualsPlugin plugin, RitualRecipeCatalog.ShapedRecipeSpec spec) {
        this.recipeId = spec.id();
        this.inventory = Bukkit.createInventory(this, 54, Menus.title("&8Recipe: " + spec.title()));
        build(plugin, spec);
    }

    public static void open(RitualsPlugin plugin, Player player, RitualRecipeCatalog.ShapedRecipeSpec spec) {
        player.openInventory(new ShapedRecipeGuideMenu(plugin, spec).getInventory());
    }

    public String recipeId() {
        return recipeId;
    }

    private void build(RitualsPlugin plugin, RitualRecipeCatalog.ShapedRecipeSpec spec) {
        RecipeGuideRenderer.paintFrame(plugin, inventory);

        ItemStack result = new ItemStack(spec.resultIcon());
        ItemMeta meta = result.getItemMeta();
        if (meta != null) {
            meta.setDisplayName(com.rituals.plugin.config.Messages.colorize(spec.resultName()));
            result.setItemMeta(meta);
        }

        inventory.setItem(Menus.SLOT_HEADER, Menus.button(
                plugin,
                Material.CRAFTING_TABLE,
                spec.title(),
                List.of(
                        " ",
                        "&7Shaped crafting table recipe.",
                        "&8Lives in the Rituals datapack.",
                        " ",
                        "&7Craft exactly as shown."
                ),
                "noop",
                null
        ));

        RecipeGuideRenderer.paintShaped(plugin, inventory, spec, result);

        inventory.setItem(40, Menus.button(
                plugin,
                Material.BOOK,
                "&7Chat copy",
                List.of(" ", "&7Print this recipe in chat.", " ", "&eClick » Send to chat"),
                "chat_recipe",
                spec.id()
        ));

        inventory.setItem(48, Menus.button(
                plugin,
                Material.ARROW,
                "&eAll recipes",
                List.of(),
                "back_guide",
                null
        ));
        inventory.setItem(Menus.SLOT_BACK, Menus.button(
                plugin,
                Material.ARROW,
                "&eBack to hub",
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
