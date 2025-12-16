package com.rituals.commands;

import com.mojang.brigadier.Command;
import com.mojang.brigadier.context.CommandContext;

import net.minecraft.server.command.ServerCommandSource;
import net.minecraft.text.Text;
import net.minecraft.util.Formatting;

public class HelpCommand {
    
    public static int showHelp(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();

        source.sendFeedback(() -> Text.literal(""), false);
        source.sendFeedback(() -> Text.literal("====================================================")
                .formatted(Formatting.DARK_PURPLE), false);
        source.sendFeedback(() -> Text.literal("          Rituals - Command Guide")
                .formatted(Formatting.LIGHT_PURPLE).formatted(Formatting.BOLD), false);
        source.sendFeedback(() -> Text.literal("====================================================")
                .formatted(Formatting.DARK_PURPLE), false);
        source.sendFeedback(() -> Text.literal(""), false);
        
        // Basic Commands
        source.sendFeedback(() -> Text.literal("  Basic Commands:").formatted(Formatting.YELLOW).formatted(Formatting.BOLD), false);
        source.sendFeedback(() -> Text.literal("  * /rituals help").formatted(Formatting.GREEN)
                .append(Text.literal(" - Show this help menu").formatted(Formatting.GRAY)), false);
        source.sendFeedback(() -> Text.literal("  * /rituals guidebook").formatted(Formatting.GREEN)
                .append(Text.literal(" - Get detailed guidebook").formatted(Formatting.GRAY)), false);
        source.sendFeedback(() -> Text.literal("  * /rituals get").formatted(Formatting.GREEN)
                .append(Text.literal(" - Get items help").formatted(Formatting.GRAY)), false);
        
        source.sendFeedback(() -> Text.literal(""), false);
        
        // Give Commands
        source.sendFeedback(() -> Text.literal("  Item Commands:").formatted(Formatting.YELLOW).formatted(Formatting.BOLD), false);
        source.sendFeedback(() -> Text.literal("  * /rituals give all").formatted(Formatting.AQUA)
                .append(Text.literal(" - Get all totems + guidebook").formatted(Formatting.GRAY)), false);
        source.sendFeedback(() -> Text.literal("  * /rituals give guidebook").formatted(Formatting.AQUA)
                .append(Text.literal(" - Get another guidebook").formatted(Formatting.GRAY)), false);
        source.sendFeedback(() -> Text.literal("  * /rituals give totem_<tier>").formatted(Formatting.AQUA)
                .append(Text.literal(" - Get specific totem").formatted(Formatting.GRAY)), false);
        source.sendFeedback(() -> Text.literal("    Tiers: basic, copper, iron, gold, advanced, netherite")
                .formatted(Formatting.DARK_GRAY), false);
        
        source.sendFeedback(() -> Text.literal(""), false);
        
        // Soul Embodiment Commands
        source.sendFeedback(() -> Text.literal("  Soul Embodiment:").formatted(Formatting.LIGHT_PURPLE).formatted(Formatting.BOLD), false);
        source.sendFeedback(() -> Text.literal("  * /rituals soul info").formatted(Formatting.LIGHT_PURPLE)
                .append(Text.literal(" - View soul weapon stats").formatted(Formatting.GRAY)), false);
        source.sendFeedback(() -> Text.literal("  * /rituals soul rename <name>").formatted(Formatting.LIGHT_PURPLE)
                .append(Text.literal(" - Rename your soul weapon").formatted(Formatting.GRAY)), false);
        
        source.sendFeedback(() -> Text.literal(""), false);
        
        // Config & Progress
        source.sendFeedback(() -> Text.literal("  Config & Progress:").formatted(Formatting.YELLOW).formatted(Formatting.BOLD), false);
        source.sendFeedback(() -> Text.literal("  * /rituals badges check_status").formatted(Formatting.GOLD)
                .append(Text.literal(" - View ritual progress").formatted(Formatting.GRAY)), false);
        source.sendFeedback(() -> Text.literal("  * /rituals config reload").formatted(Formatting.GOLD)
                .append(Text.literal(" - Reload configuration").formatted(Formatting.GRAY)), false);
        
        source.sendFeedback(() -> Text.literal(""), false);
        
        // Admin Commands (only show if they have permission)
        var perms = source.getPermissions();
        boolean isAdmin = perms instanceof net.minecraft.command.permission.LeveledPermissionPredicate lpp 
            && lpp.getLevel().compareTo(net.minecraft.command.permission.LeveledPermissionPredicate.GAMEMASTERS.getLevel()) >= 0;
        if (isAdmin) {
            source.sendFeedback(() -> Text.literal("  Admin Commands:").formatted(Formatting.RED).formatted(Formatting.BOLD)
                    .append(Text.literal(" (Requires OP)").formatted(Formatting.DARK_RED)), false);
            source.sendFeedback(() -> Text.literal("  * /rituals admin enable_kiwi_mode").formatted(Formatting.GREEN)
                    .append(Text.literal(" - Easy mode (no fire required)").formatted(Formatting.GRAY)), false);
            source.sendFeedback(() -> Text.literal("  * /rituals admin disable_kiwi_mode").formatted(Formatting.GREEN)
                    .append(Text.literal(" - Disable easy mode").formatted(Formatting.GRAY)), false);
            source.sendFeedback(() -> Text.literal("  * /rituals admin enable_debug_mode").formatted(Formatting.AQUA)
                    .append(Text.literal(" - Show debug messages").formatted(Formatting.GRAY)), false);
            source.sendFeedback(() -> Text.literal("  * /rituals admin disable_debug_mode").formatted(Formatting.AQUA)
                    .append(Text.literal(" - Hide debug messages").formatted(Formatting.GRAY)), false);
            source.sendFeedback(() -> Text.literal("  * /rituals admin debug_status").formatted(Formatting.AQUA)
                    .append(Text.literal(" - View system status").formatted(Formatting.GRAY)), false);
            source.sendFeedback(() -> Text.literal("  * /rituals admin list_totems").formatted(Formatting.LIGHT_PURPLE)
                    .append(Text.literal(" - List active totems").formatted(Formatting.GRAY)), false);
            source.sendFeedback(() -> Text.literal("  * /rituals admin reset_all").formatted(Formatting.RED)
                    .append(Text.literal(" - Reset all rituals").formatted(Formatting.GRAY)), false);
            source.sendFeedback(() -> Text.literal("  * /rituals admin unlock_all_recipes").formatted(Formatting.LIGHT_PURPLE)
                    .append(Text.literal(" - Unlock all totem recipes").formatted(Formatting.GRAY)), false);
            source.sendFeedback(() -> Text.literal(""), false);
        }
        
        // Quick Tips
        source.sendFeedback(() -> Text.literal("  Quick Tips:").formatted(Formatting.YELLOW).formatted(Formatting.BOLD), false);
        source.sendFeedback(() -> Text.literal("    - Press L to open the Advancement Guide").formatted(Formatting.GRAY), false);
        source.sendFeedback(() -> Text.literal("    - Use tab completion to explore commands").formatted(Formatting.GRAY), false);
        source.sendFeedback(() -> Text.literal("    - Check /rituals badges check_status for progress").formatted(Formatting.GRAY), false);
        
        source.sendFeedback(() -> Text.literal(""), false);
        source.sendFeedback(() -> Text.literal("====================================================")
                .formatted(Formatting.DARK_PURPLE), false);

        return Command.SINGLE_SUCCESS;
    }
}

