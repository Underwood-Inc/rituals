package com.rituals.plugin.gui.recipe;

import com.rituals.plugin.RitualsPlugin;
import com.rituals.plugin.gui.Menus;
import com.rituals.plugin.recipe.RitualRecipeCatalog;
import org.bukkit.Material;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;

import java.util.List;
import java.util.Map;

public final class RecipeGuideRenderer {

    public static final int[] SHAPED_GRID = {10, 11, 12, 19, 20, 21, 28, 29, 30};
    public static final int SLOT_ARROW = 23;
    public static final int SLOT_RESULT = 24;

    private RecipeGuideRenderer() {
    }

    public static void paintFrame(RitualsPlugin plugin, Inventory inventory) {
    }

    public static void paintShaped(
            RitualsPlugin plugin,
            Inventory inventory,
            RitualRecipeCatalog.ShapedRecipeSpec spec,
            ItemStack result
    ) {
        clearWorkArea(inventory);
        String[] shape = spec.shape();
        Map<Character, Material> ingredients = spec.ingredients();
        for (int row = 0; row < shape.length; row++) {
            String line = shape[row];
            for (int col = 0; col < line.length(); col++) {
                char symbol = line.charAt(col);
                if (symbol == ' ') {
                    continue;
                }
                Material material = ingredients.get(symbol);
                if (material == null) {
                    continue;
                }
                int slot = SHAPED_GRID[row * 3 + col];
                inventory.setItem(slot, ingredient(plugin, material));
            }
        }
        inventory.setItem(SLOT_ARROW, Menus.button(plugin, Material.ARROW, "&e»", List.of(), "noop", null));
        inventory.setItem(SLOT_RESULT, result.clone());
    }

    private static void clearWorkArea(Inventory inventory) {
        for (int slot : SHAPED_GRID) {
            inventory.setItem(slot, null);
        }
        inventory.setItem(SLOT_ARROW, null);
        inventory.setItem(SLOT_RESULT, null);
    }

    private static ItemStack ingredient(RitualsPlugin plugin, Material material) {
        return Menus.button(plugin, material, "&f" + formatMaterial(material), List.of(), "noop", null);
    }

    private static String formatMaterial(Material material) {
        String raw = material.name().toLowerCase().replace('_', ' ');
        return raw.substring(0, 1).toUpperCase() + raw.substring(1);
    }
}
