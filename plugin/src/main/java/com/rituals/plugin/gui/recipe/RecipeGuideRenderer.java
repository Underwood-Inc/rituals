package com.rituals.plugin.gui.recipe;

import com.rituals.plugin.RitualsPlugin;
import com.rituals.plugin.gui.Menus;
import com.rituals.plugin.recipe.RitualRecipeCatalog;
import com.shirecraft.bukkit.gui.guide.RecipeGuideChestRenderer;
import com.shirecraft.bukkit.gui.guide.ShapedRecipeGridSlots;
import org.bukkit.Material;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;

import java.util.List;
import java.util.function.Function;

/**
 * Rituals-specific ingredient factory; grid painting delegates to utils.
 */
public final class RecipeGuideRenderer {

    /** @deprecated use {@link ShapedRecipeGridSlots#SHAPED_GRID} */
    @Deprecated
    public static final int[] SHAPED_GRID = ShapedRecipeGridSlots.SHAPED_GRID;
    /** @deprecated use {@link ShapedRecipeGridSlots#SLOT_ARROW} */
    @Deprecated
    public static final int SLOT_ARROW = ShapedRecipeGridSlots.SLOT_ARROW;
    /** @deprecated use {@link ShapedRecipeGridSlots#SLOT_RESULT} */
    @Deprecated
    public static final int SLOT_RESULT = ShapedRecipeGridSlots.SLOT_RESULT;

    private RecipeGuideRenderer() {
    }

    public static void paintFrame(RitualsPlugin plugin, Inventory inventory) {
        RecipeGuideChestRenderer.paintFrame(inventory);
    }

    public static void paintShaped(
            RitualsPlugin plugin,
            Inventory inventory,
            RitualRecipeCatalog.ShapedRecipeSpec spec,
            ItemStack result
    ) {
        RecipeGuideChestRenderer.paintShaped(
                inventory,
                spec.shape(),
                spec.ingredients(),
                result,
                Menus.button(plugin, Material.ARROW, "&e»", List.of(), "noop", null),
                ingredientFactory(plugin));
    }

    private static Function<Material, ItemStack> ingredientFactory(RitualsPlugin plugin) {
        return material -> Menus.button(
                plugin,
                material,
                "&f" + RecipeGuideChestRenderer.formatMaterial(material),
                List.of(),
                "noop",
                null);
    }
}
