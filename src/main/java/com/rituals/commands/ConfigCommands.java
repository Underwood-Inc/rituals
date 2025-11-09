package com.rituals.commands;

import com.mojang.brigadier.Command;
import com.mojang.brigadier.arguments.StringArgumentType;
import com.mojang.brigadier.builder.LiteralArgumentBuilder;
import com.mojang.brigadier.builder.RequiredArgumentBuilder;
import com.mojang.brigadier.context.CommandContext;
import com.mojang.brigadier.suggestion.SuggestionProvider;
import net.minecraft.server.command.CommandManager;
import net.minecraft.server.command.ServerCommandSource;
import net.minecraft.text.Text;
import net.minecraft.util.Formatting;

/**
 * Configuration commands for ritual items and settings
 */
public class ConfigCommands {
    
    private static final SuggestionProvider<ServerCommandSource> RITUAL_TYPE_SUGGESTIONS = (context, builder) -> {
        String[] types = {"growth", "strength", "prosperity", "protection", "healing", "sentry"};
        for (String type : types) {
            if (type.startsWith(builder.getRemaining().toLowerCase())) {
                builder.suggest(type);
            }
        }
        return builder.buildFuture();
    };
    
    private static final SuggestionProvider<ServerCommandSource> PATTERN_TYPE_SUGGESTIONS = (context, builder) -> {
        String[] types = {"auto_farming", "auto_breeding"};
        for (String type : types) {
            if (type.startsWith(builder.getRemaining().toLowerCase())) {
                builder.suggest(type);
            }
        }
        return builder.buildFuture();
    };
    
    private static final SuggestionProvider<ServerCommandSource> TIER_SUGGESTIONS = (context, builder) -> {
        String[] tiers = {"tier1", "tier2", "tier3", "tier4", "tier5", "tier6"};
        for (String tier : tiers) {
            if (tier.startsWith(builder.getRemaining().toLowerCase())) {
                builder.suggest(tier);
            }
        }
        return builder.buildFuture();
    };

    /**
     * Registers all config subcommands
     */
    public static LiteralArgumentBuilder<ServerCommandSource> registerConfigCommands() {
        LiteralArgumentBuilder<ServerCommandSource> config = CommandManager.literal("config");
        
        // /rituals config ritual <subcommand>
        LiteralArgumentBuilder<ServerCommandSource> ritual = CommandManager.literal("ritual");
        
        // /rituals config ritual list
        ritual.then(CommandManager.literal("list")
                .executes(ConfigCommands::listRituals));
        
        // /rituals config ritual set_item <ritual_type> <item_id>
        ritual.then(CommandManager.literal("set_item")
                .then(RequiredArgumentBuilder.<ServerCommandSource, String>argument("ritual_type", StringArgumentType.string())
                        .suggests(RITUAL_TYPE_SUGGESTIONS)
                        .then(RequiredArgumentBuilder.<ServerCommandSource, String>argument("item_id", StringArgumentType.string())
                                .executes(ConfigCommands::setRitualItem))));
        
        // /rituals config ritual enable <ritual_type>
        ritual.then(CommandManager.literal("enable")
                .then(RequiredArgumentBuilder.<ServerCommandSource, String>argument("ritual_type", StringArgumentType.string())
                        .suggests(RITUAL_TYPE_SUGGESTIONS)
                        .executes(ConfigCommands::enableRitual)));
        
        // /rituals config ritual disable <ritual_type>
        ritual.then(CommandManager.literal("disable")
                .then(RequiredArgumentBuilder.<ServerCommandSource, String>argument("ritual_type", StringArgumentType.string())
                        .suggests(RITUAL_TYPE_SUGGESTIONS)
                        .executes(ConfigCommands::disableRitual)));
        
        config.then(ritual);
        
        // /rituals config pattern <subcommand>
        LiteralArgumentBuilder<ServerCommandSource> pattern = CommandManager.literal("pattern");
        
        // /rituals config pattern list
        pattern.then(CommandManager.literal("list")
                .executes(ConfigCommands::listPatterns));
        
        // /rituals config pattern set_central <pattern_name> <item_id>
        pattern.then(CommandManager.literal("set_central")
                .then(RequiredArgumentBuilder.<ServerCommandSource, String>argument("pattern_name", StringArgumentType.string())
                        .suggests(PATTERN_TYPE_SUGGESTIONS)
                        .then(RequiredArgumentBuilder.<ServerCommandSource, String>argument("item_id", StringArgumentType.string())
                                .executes(ConfigCommands::setPatternCentral))));
        
        // /rituals config pattern set_supplementary <pattern_name> <position> <item_id>
        pattern.then(CommandManager.literal("set_supplementary")
                .then(RequiredArgumentBuilder.<ServerCommandSource, String>argument("pattern_name", StringArgumentType.string())
                        .suggests(PATTERN_TYPE_SUGGESTIONS)
                        .then(RequiredArgumentBuilder.<ServerCommandSource, String>argument("position", StringArgumentType.string())
                                .then(RequiredArgumentBuilder.<ServerCommandSource, String>argument("item_id", StringArgumentType.string())
                                        .executes(ConfigCommands::setPatternSupplementary)))));
        
        config.then(pattern);
        
        // /rituals config catalyst <subcommand>
        LiteralArgumentBuilder<ServerCommandSource> catalyst = CommandManager.literal("catalyst");
        
        // /rituals config catalyst list
        catalyst.then(CommandManager.literal("list")
                .executes(ConfigCommands::listCatalysts));
        
        // /rituals config catalyst set <tier> <item_id> <quantity>
        catalyst.then(CommandManager.literal("set")
                .then(RequiredArgumentBuilder.<ServerCommandSource, String>argument("tier", StringArgumentType.string())
                        .suggests(TIER_SUGGESTIONS)
                        .then(RequiredArgumentBuilder.<ServerCommandSource, String>argument("item_id", StringArgumentType.string())
                                .then(RequiredArgumentBuilder.<ServerCommandSource, Integer>argument("quantity", com.mojang.brigadier.arguments.IntegerArgumentType.integer(1, 64))
                                        .executes(ConfigCommands::setCatalyst)))));
        
        config.then(catalyst);
        
        // /rituals config reload
        config.then(CommandManager.literal("reload")
                .executes(ConfigCommands::reloadConfig));
        
        return config;
    }
    
    private static int listRituals(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        source.sendFeedback(() -> Text.literal("=== Single-Totem Rituals ===").formatted(Formatting.GOLD), false);
        source.sendFeedback(() -> Text.literal("Use /data get storage rituals:registry single_rituals to view all").formatted(Formatting.GRAY), false);
        source.sendFeedback(() -> Text.literal("Use /rituals config ritual set_item <type> <item_id> to change items").formatted(Formatting.GRAY), false);
        return Command.SINGLE_SUCCESS;
    }
    
    private static int setRitualItem(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        String ritualType = StringArgumentType.getString(ctx, "ritual_type");
        String itemId = StringArgumentType.getString(ctx, "item_id");
        
        // Execute datapack command to modify storage
        String command = String.format("data modify storage rituals:registry single_rituals[{id:\"%s\"}].item set value \"%s\"", ritualType, itemId);
        source.getServer().getCommandManager().executeWithPrefix(source, command);
        
        source.sendFeedback(() -> Text.literal("[Rituals] ").formatted(Formatting.GOLD).formatted(Formatting.BOLD)
                .append(Text.literal("Set " + ritualType + " ritual item to " + itemId).formatted(Formatting.GREEN)), false);
        
        return Command.SINGLE_SUCCESS;
    }
    
    private static int enableRitual(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        String ritualType = StringArgumentType.getString(ctx, "ritual_type");
        
        String command = String.format("data modify storage rituals:registry single_rituals[{id:\"%s\"}].enabled set value 1b", ritualType);
        source.getServer().getCommandManager().executeWithPrefix(source, command);
        
        source.sendFeedback(() -> Text.literal("[Rituals] ").formatted(Formatting.GOLD).formatted(Formatting.BOLD)
                .append(Text.literal("Enabled " + ritualType + " ritual").formatted(Formatting.GREEN)), false);
        
        return Command.SINGLE_SUCCESS;
    }
    
    private static int disableRitual(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        String ritualType = StringArgumentType.getString(ctx, "ritual_type");
        
        String command = String.format("data modify storage rituals:registry single_rituals[{id:\"%s\"}].enabled set value 0b", ritualType);
        source.getServer().getCommandManager().executeWithPrefix(source, command);
        
        source.sendFeedback(() -> Text.literal("[Rituals] ").formatted(Formatting.GOLD).formatted(Formatting.BOLD)
                .append(Text.literal("Disabled " + ritualType + " ritual").formatted(Formatting.YELLOW)), false);
        
        return Command.SINGLE_SUCCESS;
    }
    
    private static int listPatterns(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        source.sendFeedback(() -> Text.literal("=== Pattern Rituals ===").formatted(Formatting.GOLD), false);
        source.sendFeedback(() -> Text.literal("Use /data get storage rituals:registry pattern_rituals to view all").formatted(Formatting.GRAY), false);
        return Command.SINGLE_SUCCESS;
    }
    
    private static int setPatternCentral(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        String patternName = StringArgumentType.getString(ctx, "pattern_name");
        String itemId = StringArgumentType.getString(ctx, "item_id");
        
        String command = String.format("data modify storage rituals:registry pattern_rituals[{id:\"%s\"}].central_item set value \"%s\"", patternName, itemId);
        source.getServer().getCommandManager().executeWithPrefix(source, command);
        
        source.sendFeedback(() -> Text.literal("[Rituals] ").formatted(Formatting.GOLD).formatted(Formatting.BOLD)
                .append(Text.literal("Set " + patternName + " central item to " + itemId).formatted(Formatting.GREEN)), false);
        
        return Command.SINGLE_SUCCESS;
    }
    
    private static int setPatternSupplementary(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        String patternName = StringArgumentType.getString(ctx, "pattern_name");
        String position = StringArgumentType.getString(ctx, "position");
        String itemId = StringArgumentType.getString(ctx, "item_id");
        
        String command = String.format("data modify storage rituals:registry pattern_rituals[{id:\"%s\"}].supplementary_items.%s set value \"%s\"", patternName, position, itemId);
        source.getServer().getCommandManager().executeWithPrefix(source, command);
        
        source.sendFeedback(() -> Text.literal("[Rituals] ").formatted(Formatting.GOLD).formatted(Formatting.BOLD)
                .append(Text.literal("Set " + patternName + " " + position + " item to " + itemId).formatted(Formatting.GREEN)), false);
        
        return Command.SINGLE_SUCCESS;
    }
    
    private static int listCatalysts(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        source.sendFeedback(() -> Text.literal("=== Fire Sacrifice Catalysts ===").formatted(Formatting.GOLD), false);
        source.sendFeedback(() -> Text.literal("Use /data get storage rituals:registry catalysts to view all").formatted(Formatting.GRAY), false);
        return Command.SINGLE_SUCCESS;
    }
    
    private static int setCatalyst(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        String tier = StringArgumentType.getString(ctx, "tier");
        String itemId = StringArgumentType.getString(ctx, "item_id");
        int quantity = com.mojang.brigadier.arguments.IntegerArgumentType.getInteger(ctx, "quantity");
        
        String command = String.format("data modify storage rituals:registry catalysts.%s.item set value \"%s\"", tier, itemId);
        source.getServer().getCommandManager().executeWithPrefix(source, command);
        
        String command2 = String.format("data modify storage rituals:registry catalysts.%s.quantity set value %d", tier, quantity);
        source.getServer().getCommandManager().executeWithPrefix(source, command2);
        
        source.sendFeedback(() -> Text.literal("[Rituals] ").formatted(Formatting.GOLD).formatted(Formatting.BOLD)
                .append(Text.literal("Set " + tier + " catalyst to " + quantity + "x " + itemId).formatted(Formatting.GREEN)), false);
        
        return Command.SINGLE_SUCCESS;
    }
    
    private static int reloadConfig(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        com.rituals.config.RitualsConfig.reload();
        source.sendFeedback(() -> Text.literal("[Rituals] ").formatted(Formatting.GOLD).formatted(Formatting.BOLD)
                .append(Text.literal("Configuration reloaded!").formatted(Formatting.GREEN)), false);
        return Command.SINGLE_SUCCESS;
    }
}

