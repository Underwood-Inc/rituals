package com.rituals.plugin.guide;

import com.rituals.plugin.config.Messages;
import com.rituals.plugin.recipe.RitualRecipeCatalog;
import org.bukkit.Material;
import org.bukkit.command.CommandSender;

import java.util.Map;

/**
 * Chat fallback for datapack-only ritual recipes and gameplay tips.
 */
public final class RecipeChatGuide {

    private RecipeChatGuide() {
    }

    public static void sendHub(CommandSender sender) {
        Messages.send(sender, "&d—— Rituals Guide ——");
        Messages.send(sender, "&7Chest GUIs show crafting patterns. Datapack recipes also work in a table.");
        Messages.send(sender, "&b/rituals guide recipes &7— open recipe chest menu");
        Messages.send(sender, "&b/rituals guide totem <tier> &7— print one totem recipe in chat");
        Messages.send(sender, "&b/rituals guide scrying &7— print Scrying Glass recipe in chat");
        Messages.send(sender, "&b/rituals guide play &7— how to use totems & soul weapons");
        Messages.send(sender, "&8Tiers: wood, copper, iron, gold, diamond, netherite");
    }

    public static void sendPlayGuide(CommandSender sender) {
        Messages.send(sender, "&d—— How to Ritual ——");
        Messages.send(sender, "&71. Craft a totem (see &f/rituals guide&7).");
        Messages.send(sender, "&72. Place it, &fsneak + right-click&7 to activate.");
        Messages.send(sender, "&73. Toss items on the totem to run rituals.");
        Messages.send(sender, "&74. Soul weapons gain XP — use a &dScrying Glass&7 to sync.");
        Messages.send(sender, "&8Full details: guidebook from &f/rituals give guidebook");
    }

    public static void sendRecipe(CommandSender sender, RitualRecipeCatalog.ShapedRecipeSpec spec) {
        Messages.send(sender, "&d—— " + Messages.colorize(spec.title()) + " &7(&8datapack&7)");
        for (String row : spec.shape()) {
            Messages.send(sender, "&f  " + row.replace(' ', '·'));
        }
        Messages.send(sender, "&7Ingredients:");
        for (Map.Entry<Character, Material> entry : spec.ingredients().entrySet()) {
            Messages.send(sender, "&8  " + entry.getKey() + " &7→ &f" + formatMaterial(entry.getValue()));
        }
        Messages.send(sender, "&7Result: &f" + Messages.colorize(spec.resultName()));
        if (spec.datapackOnly()) {
            Messages.send(sender, "&8Craft in a vanilla table — recipe lives in the datapack.");
        }
    }

    public static void sendTotemTier(CommandSender sender, String tierId) {
        RitualRecipeCatalog.TotemTier tier = resolveTier(tierId);
        if (tier == null) {
            Messages.send(sender, "&cUnknown totem tier. Use: wood, copper, iron, gold, diamond, netherite");
            return;
        }
        sendRecipe(sender, RitualRecipeCatalog.totem(tier));
    }

    public static RitualRecipeCatalog.TotemTier resolveTier(String raw) {
        if (raw == null || raw.isBlank()) {
            return null;
        }
        String id = raw.toLowerCase().trim();
        for (RitualRecipeCatalog.TotemTier tier : RitualRecipeCatalog.totemTiers()) {
            if (tier.id().equals(id)) {
                return tier;
            }
        }
        return null;
    }

    private static String formatMaterial(org.bukkit.Material material) {
        String name = material.name().toLowerCase().replace('_', ' ');
        return name.substring(0, 1).toUpperCase() + name.substring(1);
    }
}
