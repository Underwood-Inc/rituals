package com.rituals.plugin.item;

import com.rituals.plugin.config.Messages;
import com.rituals.plugin.recipe.RitualRecipeCatalog;
import org.bukkit.Material;
import org.bukkit.NamespacedKey;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.ItemMeta;

import java.util.Locale;
import java.util.Optional;

/** Totem inventory icons via {@code rituals:totem_<tier>} item models (resource pack). */
public final class TotemItemStacks {

    private TotemItemStacks() {
    }

    public static NamespacedKey itemModel(String tierId, boolean shortVariant) {
        String suffix = shortVariant ? "_short" : "";
        return new NamespacedKey("rituals", "totem_" + tierId + suffix);
    }

    public static ItemStack hubIcon(RitualRecipeCatalog.TotemTier tier) {
        ItemStack stack = new ItemStack(Material.WARPED_FUNGUS_ON_A_STICK);
        ItemMeta meta = stack.getItemMeta();
        if (meta == null) {
            return stack;
        }
        meta.setItemModel(itemModel(tier.id(), false));
        meta.setDisplayName(Messages.colorize(tier.title()));
        stack.setItemMeta(meta);
        return stack;
    }

    public static ItemStack recipeResult(RitualRecipeCatalog.ShapedRecipeSpec spec) {
        ItemStack stack = new ItemStack(spec.resultIcon());
        ItemMeta meta = stack.getItemMeta();
        if (meta == null) {
            return stack;
        }
        meta.setDisplayName(Messages.colorize(spec.resultName()));
        parseTotemRecipe(spec.id()).ifPresent(model ->
                meta.setItemModel(itemModel(model.tierId(), model.shortVariant())));
        stack.setItemMeta(meta);
        return stack;
    }

    public static Optional<TotemModel> parseTotemRecipe(String recipeId) {
        if (recipeId == null || !recipeId.startsWith("totem_base_")) {
            return Optional.empty();
        }
        String rest = recipeId.substring("totem_base_".length()).toLowerCase(Locale.ROOT);
        boolean shortVariant = rest.endsWith("_short");
        String tierId = shortVariant ? rest.substring(0, rest.length() - "_short".length()) : rest;
        if (tierId.isEmpty()) {
            return Optional.empty();
        }
        return Optional.of(new TotemModel(tierId, shortVariant));
    }

    public record TotemModel(String tierId, boolean shortVariant) {
    }
}
