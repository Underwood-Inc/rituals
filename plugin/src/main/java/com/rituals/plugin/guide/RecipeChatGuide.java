package com.rituals.plugin.guide;

import com.rituals.plugin.RitualsPlugin;
import com.rituals.plugin.recipe.RitualRecipeCatalog;
import com.shirecraft.bukkit.chat.ChatSections;
import com.shirecraft.bukkit.chat.CommandClickSupport;
import com.shirecraft.bukkit.chat.CommandFeedback;
import com.shirecraft.bukkit.chat.LegacyColors;
import com.shirecraft.bukkit.text.RecipeAsciiRenderer;
import com.shirecraft.bukkit.text.RecipeChatText;
import net.kyori.adventure.audience.Audience;
import net.kyori.adventure.text.Component;
import org.bukkit.Material;
import org.bukkit.command.CommandSender;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Chat fallback for datapack-only ritual recipes and gameplay tips.
 */
public final class RecipeChatGuide {

  private RecipeChatGuide() {
  }

  public static void sendHub(CommandSender sender) {
    var plugin = RitualsPlugin.getInstance();
    for (Component line : ChatSections.blockComponents("Rituals Guide", List.of(
        CommandClickSupport.embedInGrayText(
            "Chest GUIs show crafting patterns. Datapack recipes also work in a table.", plugin),
        ChatSections.bulletComponent("/rituals guide recipes", "open recipe chest menu", plugin),
        ChatSections.bulletComponent("/rituals guide totem <tier>", "print one totem recipe in chat", plugin),
        ChatSections.bulletComponent("/rituals guide scrying", "print Scrying Glass recipe in chat", plugin),
        ChatSections.bulletComponent("/rituals guide play", "how to use totems & soul weapons", plugin),
        CommandClickSupport.embedInGrayText(
            "Tiers: wood, copper, iron, gold, diamond, netherite", plugin)
    ))) {
      CommandFeedback.send(sender, line);
    }
  }

  public static void sendPlayGuide(CommandSender sender) {
    var plugin = RitualsPlugin.getInstance();
    for (Component line : ChatSections.blockComponents("How to Ritual", List.of(
        bodyWithCommands("&71. Craft a totem (see &f/rituals guide&7).", plugin),
        CommandClickSupport.embedInGrayText(
            "2. Place it, sneak + right-click to activate.", plugin),
        CommandClickSupport.embedInGrayText(
            "3. Toss items on the totem to run rituals.", plugin),
        CommandClickSupport.embedInGrayText(
            "4. Soul weapons gain XP - use a Scrying Glass to sync.", plugin),
        bodyWithCommands("&8Full details: guidebook from &f/rituals give guidebook", plugin)
    ))) {
      CommandFeedback.send(sender, line);
    }
  }

  public static void sendRecipe(CommandSender sender, RitualRecipeCatalog.ShapedRecipeSpec spec) {
    CommandFeedback.send(sender, ChatSections.header(LegacyColors.colorize(spec.title()) + " &7(&8datapack&7)"));
    Map<Character, String> keyLabels = new LinkedHashMap<>();
    for (Map.Entry<Character, Material> entry : spec.ingredients().entrySet()) {
      keyLabels.put(entry.getKey(), formatMaterial(entry.getValue()));
    }
    List<String> pattern = List.of(spec.shape());
    for (String row : pattern) {
      String rendered = RecipeAsciiRenderer.renderPatternRow(row, keyLabels);
      sendRecipeLine(sender, "  " + rendered);
    }
    CommandFeedback.send(sender, "&7Ingredients:");
    for (Map.Entry<Character, Material> entry : spec.ingredients().entrySet()) {
      CommandFeedback.send(sender, "&8  " + entry.getKey() + " &7→ &f" + formatMaterial(entry.getValue()));
    }
    CommandFeedback.send(sender, "&7Result: &f" + LegacyColors.colorize(spec.resultName()));
    if (spec.datapackOnly()) {
      CommandFeedback.send(sender, "&8Craft in a vanilla table — recipe lives in the datapack.");
    }
  }

  public static void sendTotemTier(CommandSender sender, String tierId) {
    RitualRecipeCatalog.TotemTier tier = resolveTier(tierId);
    if (tier == null) {
      CommandFeedback.send(sender, "&cUnknown totem tier. Use: wood, copper, iron, gold, diamond, netherite");
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

  private static Component bodyWithCommands(String legacyLine, RitualsPlugin plugin) {
    String plain = LegacyColors.colorize(legacyLine);
    return CommandClickSupport.embedInGrayText(stripLegacyColors(plain), plugin);
  }

  private static String stripLegacyColors(String input) {
    return org.bukkit.ChatColor.stripColor(input);
  }

  private static void sendRecipeLine(CommandSender sender, String line) {
    if (sender instanceof Audience audience) {
      audience.sendMessage(RecipeChatText.line(line));
      return;
    }
    CommandFeedback.send(sender, "&7" + line);
  }

  private static String formatMaterial(org.bukkit.Material material) {
    String name = material.name().toLowerCase().replace('_', ' ');
    return name.substring(0, 1).toUpperCase() + name.substring(1);
  }
}
