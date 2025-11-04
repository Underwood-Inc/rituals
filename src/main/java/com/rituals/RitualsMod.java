package com.rituals;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mojang.brigadier.Command;
import com.mojang.brigadier.builder.LiteralArgumentBuilder;
import com.mojang.brigadier.context.CommandContext;

import net.fabricmc.api.ModInitializer;
import net.fabricmc.fabric.api.command.v2.CommandRegistrationCallback;
import net.minecraft.component.DataComponentTypes;
import net.minecraft.component.type.NbtComponent;
import net.minecraft.component.type.WrittenBookContentComponent;
import net.minecraft.item.ItemStack;
import net.minecraft.item.Items;
import net.minecraft.nbt.NbtCompound;
import net.minecraft.server.command.CommandManager;
import net.minecraft.server.command.ServerCommandSource;
import net.minecraft.server.network.ServerPlayerEntity;
import net.minecraft.text.RawFilteredPair;
import net.minecraft.text.Text;
import net.minecraft.text.TextColor;
import net.minecraft.util.Formatting;

/**
 * Rituals - Fire Sacrifice Edition
 * 
 * A Minecraft mod that introduces mystical totems and powerful ritual magic.
 * Place totems, perform fire sacrifices, and unlock powerful effects!
 * 
 * This mod provides custom commands implemented in pure Java.
 */
public class RitualsMod implements ModInitializer {
    public static final String MOD_ID = "rituals";
    public static final Logger LOGGER = LoggerFactory.getLogger(MOD_ID);

    @Override
    public void onInitialize() {
        LOGGER.info("===========================================");
        LOGGER.info("  Rituals - Fire Sacrifice Edition  ");
        LOGGER.info("===========================================");
        LOGGER.info("Mod loaded successfully!");
        LOGGER.info("Datapack and resource pack auto-installed.");
        LOGGER.info("Registering commands...");

        registerCommands();

        LOGGER.info("Commands registered! Use /rituals help");
        LOGGER.info("===========================================");
    }

    /**
     * Registers all mod commands - Wraps datapack functions for proper item NBT
     */
    private void registerCommands() {
        CommandRegistrationCallback.EVENT.register((dispatcher, registryAccess, environment) -> {
            LiteralArgumentBuilder<ServerCommandSource> ritualsCommand = CommandManager.literal("rituals");

            // /rituals help
            ritualsCommand.then(CommandManager.literal("help")
                    .executes(com.rituals.commands.HelpCommand::showHelp));

            // /rituals guidebook
            ritualsCommand.then(CommandManager.literal("guidebook")
                    .executes(this::giveGuidebook));

            // /rituals get
            ritualsCommand.then(CommandManager.literal("get")
                    .executes(this::cmdGet));

            // /rituals give subcommands - Pure Java with proper NBT
            LiteralArgumentBuilder<ServerCommandSource> giveCommand = CommandManager.literal("give");
            giveCommand.then(CommandManager.literal("all").executes(this::giveAllTotems));
            giveCommand.then(CommandManager.literal("guidebook").executes(this::giveGuidebook));
            giveCommand.then(CommandManager.literal("totems_short").executes(this::giveTotemsShort));
            giveCommand.then(CommandManager.literal("totem_copper").executes(ctx -> giveTotem(ctx, "copper", false)));
            giveCommand
                    .then(CommandManager.literal("totem_copper_short").executes(ctx -> giveTotem(ctx, "copper", true)));
            giveCommand.then(CommandManager.literal("totem_gold").executes(ctx -> giveTotem(ctx, "gold", false)));
            giveCommand.then(CommandManager.literal("totem_gold_short").executes(ctx -> giveTotem(ctx, "gold", true)));
            giveCommand.then(CommandManager.literal("totem_basic").executes(ctx -> giveTotem(ctx, "wood", false)));
            giveCommand.then(CommandManager.literal("totem_basic_short").executes(ctx -> giveTotem(ctx, "wood", true)));
            giveCommand
                    .then(CommandManager.literal("totem_advanced").executes(ctx -> giveTotem(ctx, "diamond", false)));
            giveCommand.then(
                    CommandManager.literal("totem_advanced_short").executes(ctx -> giveTotem(ctx, "diamond", true)));
            giveCommand
                    .then(CommandManager.literal("totem_master").executes(ctx -> giveTotem(ctx, "netherite", false)));
            giveCommand.then(
                    CommandManager.literal("totem_master_short").executes(ctx -> giveTotem(ctx, "netherite", true)));
            giveCommand.then(
                    CommandManager.literal("totem_netherite").executes(ctx -> giveTotem(ctx, "netherite", false)));
            giveCommand.then(
                    CommandManager.literal("totem_netherite_short").executes(ctx -> giveTotem(ctx, "netherite", true)));
            giveCommand.then(CommandManager.literal("totem_iron").executes(ctx -> giveTotem(ctx, "iron", false)));
            giveCommand.then(CommandManager.literal("totem_iron_short").executes(ctx -> giveTotem(ctx, "iron", true)));
            ritualsCommand.then(giveCommand);

            // /rituals config subcommands
            LiteralArgumentBuilder<ServerCommandSource> configCommand = CommandManager.literal("config");
            configCommand.then(CommandManager.literal("reload").executes(ctx -> {
                com.rituals.config.RitualsConfig.reload();
                ctx.getSource().sendFeedback(
                        () -> Text.literal("[Rituals] ").formatted(Formatting.GOLD).formatted(Formatting.BOLD)
                                .append(Text.literal("✓ Config reloaded!").formatted(Formatting.GREEN)),
                        false);
                return Command.SINGLE_SUCCESS;
            }));
            ritualsCommand.then(configCommand);

            // /rituals badges subcommands
            LiteralArgumentBuilder<ServerCommandSource> badgesCommand = CommandManager.literal("badges");
            badgesCommand.then(CommandManager.literal("check_status").executes(this::checkBadgeStatus));
            ritualsCommand.then(badgesCommand);

            // /rituals admin subcommands (OP required)
            LiteralArgumentBuilder<ServerCommandSource> adminCommand = CommandManager.literal("admin")
                    .requires(source -> source.hasPermissionLevel(2));

            adminCommand.then(CommandManager.literal("debug_status")
                    .executes(com.rituals.commands.AdminCommands::showDebugStatus));
            adminCommand.then(CommandManager.literal("enable_debug_mode")
                    .executes(com.rituals.commands.AdminCommands::enableDebugMode));
            adminCommand.then(CommandManager.literal("disable_debug_mode")
                    .executes(com.rituals.commands.AdminCommands::disableDebugMode));
            adminCommand.then(CommandManager.literal("enable_kiwi_mode")
                    .executes(com.rituals.commands.AdminCommands::enableKiwiMode));
            adminCommand.then(CommandManager.literal("disable_kiwi_mode")
                    .executes(com.rituals.commands.AdminCommands::disableKiwiMode));
            adminCommand.then(
                    CommandManager.literal("list_totems").executes(com.rituals.commands.AdminCommands::listTotems));
            adminCommand
                    .then(CommandManager.literal("reset_all").executes(com.rituals.commands.AdminCommands::resetAll));
            adminCommand
                    .then(CommandManager.literal("uninstall").executes(com.rituals.commands.AdminCommands::uninstall));
            adminCommand.then(CommandManager.literal("unlock_all_recipes")
                    .executes(com.rituals.commands.AdminCommands::unlockAllRecipes));
            adminCommand.then(CommandManager.literal("update_previews")
                    .executes(com.rituals.commands.AdminCommands::updatePreviews));
            adminCommand.then(
                    CommandManager.literal("test_recipes").executes(com.rituals.commands.AdminCommands::testRecipes));
            adminCommand.then(
                    CommandManager.literal("debug_recipes").executes(com.rituals.commands.AdminCommands::debugRecipes));
            adminCommand.then(CommandManager.literal("debug_barriers")
                    .executes(com.rituals.commands.AdminCommands::debugBarriers));

            ritualsCommand.then(adminCommand);

            dispatcher.register(ritualsCommand);
            LOGGER.info("Registered /rituals command (pure Java implementations)");
        });
    }

    private int giveGuidebook(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        try {
            ServerPlayerEntity player = source.getPlayerOrThrow();

            // Create written book with proper content
            ItemStack book = new ItemStack(Items.WRITTEN_BOOK);

            String[] pages = {
                    "Rituals\n\nWelcome Ritualist!\n\nThis guide teaches the ancient art of ritual magic.\n\nPress L for the full Advancement Guide!",
                    "Getting Started\n\n1. Craft a totem\n2. Right-click to place\n3. Add item on top\n4. Drop 4 catalysts around (N/S/E/W)\n5. Light fire at base\n6. Ritual activates!\n\nSingle totem works!",
                    "Fire Sacrifice\n\nRituals need fire to activate!\n\n1. Place totem + item\n2. Drop 4 catalysts around it\n3. Light fire at base\n4. Offerings consumed\n5. Magic begins!\n\nUse /rituals admin enable_kiwi_mode to skip fire.",
                    "Catalyst Costs\n\nBy Tier:\n\nWood: 4 Coal\nCopper: 4 Copper\nIron: 4 Iron\nGold: 4 Gold\nDiamond: 4 Diamond\nNetherite: 4 Netherite\n\n\nHigher tier = higher cost!",
                    "Totem Tiers\n\n1. Wood - Basic\n   Range: 2x2x6\n2. Copper - Improved\n   Range: 3x3x8\n3. Iron - Strong\n   Range: 4x4x10\n4. Gold - Very Strong\n   Range: 5x5x12",
                    "Tiers Continued\n\n5. Diamond - Powerful\n   Range: 6x6x14\n6. Netherite - Ultimate\n   Range: 7x7x16\n\n\nHigher tier = larger range and stronger effects!",
                    "Area Effect Rituals\n\nEmerald - Growth\nGrows crops nearby\n\nDiamond - Strength\nBuffs players\n\nNetherite Block\nProsperity: Items+XP\n\nAll rituals are continuous until toggled off!",
                    "More Area Effects\n\nIron Ingot\nProtection: Damage mobs\n\nNether Star\nHealing: Regeneration\n\nArrow\nSentry: Auto-fires (2x range!)\n\nDiamond Hoe\nAuto-Farming (4+ totems)",
                    "Pattern Rituals\n\nSome rituals need multiple totems with specific items!\n\nDiamond Hoe + 4 totems\nAuto-Harvest farms\n\nWheat + 4 totems\nAuto-Breeding animals\n\nUse redstone near totems to see patterns!",
                    "Crafting: Wood Totem\n\n    [S]\n [S][P][S]\n    [P]\n\nS = Stick\nP = Oak Planks\n\nResult:\n1 Wood Totem\n\nShort: Skip top row",
                    "Crafting: Higher Tiers\n\nAll follow same pattern:\n\n    [I]\n [I][B][I]\n    [B]\n\nCopper: Copper Ingot + Block\nIron: Iron Ingot + Block\nGold: Gold Ingot + Block\nDiamond: Diamond + Block\nNetherite: Netherite + Block\n\n\nCraft higher tier totems directly!",
                    "Range Display\n\nPower totem with redstone to see range!\n\nRed particles = tier range\nColored particles = pattern positions\n\nWorks with lever, torch, redstone block, button",
                    "Helpful Commands\n\n/rituals help\nShows help menu\n\n/rituals get\nGet all items\n\n/rituals give guidebook\nGet another book",
                    "Advanced Tips\n\n- Pattern rituals need exact item per totem\n- Regular rituals work with same item on all totems\n- Fire sacrifice required by default\n- Can disable with Kiwi Mode\n- See docs/ folder for more!",
                    "Configuration\n\nCustomize settings:\n\n/data get storage rituals:config\n\nKey settings:\nrequire_fire_sacrifice\nmin_totems_required\nritual_duration\nkiwi_mode",
                    "Happy Ritualing!\n\nMay your totems shine bright!\n\nFor detailed guides see docs/ folder:\n- PATTERN_RITUALS_GUIDE.md\n- FIRE_SACRIFICE_GUIDE.md\n- CRAFTING_RECIPES.md\n\n- Ancient Ritualist"
            };

            java.util.List<RawFilteredPair<Text>> pageComponents = new java.util.ArrayList<>();
            for (String page : pages) {
                pageComponents.add(RawFilteredPair.of(Text.literal(page)));
            }

            WrittenBookContentComponent content = new WrittenBookContentComponent(
                    RawFilteredPair.of("Rituals Guide"),
                    "Ancient Ritualist",
                    0,
                    pageComponents,
                    true);

            book.set(DataComponentTypes.WRITTEN_BOOK_CONTENT, content);
            player.giveItemStack(book);

            source.sendFeedback(() -> Text.literal("[Rituals] ").formatted(Formatting.GOLD).formatted(Formatting.BOLD)
                    .append(Text.literal("Gave Rituals Guidebook!").formatted(Formatting.GREEN)), false);
            LOGGER.info("Gave guidebook to {}", player.getName().getString());
            return Command.SINGLE_SUCCESS;
        } catch (Exception e) {
            source.sendError(Text.literal("This command must be run by a player!"));
            LOGGER.error("Error giving guidebook", e);
            return 0;
        }
    }

    private int cmdGet(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        source.sendFeedback(() -> Text.literal("Use /rituals give all to get all items!").formatted(Formatting.YELLOW),
                false);
        return Command.SINGLE_SUCCESS;
    }

    private int giveTotem(CommandContext<ServerCommandSource> ctx, String tier, boolean isShort) {
        ServerCommandSource source = ctx.getSource();
        try {
            ServerPlayerEntity player = source.getPlayerOrThrow();

            ItemStack totem = new ItemStack(Items.WARPED_FUNGUS_ON_A_STICK);

            // Set totem properties based on tier
            String displayName;
            String hexColor;
            int totemTier;
            boolean hasGlint = false;

            switch (tier) {
                case "wood":
                    displayName = isShort ? "Short Wooden Totem" : "Wooden Totem";
                    hexColor = "#DAA520"; // gold
                    totemTier = 1;
                    break;
                case "copper":
                    displayName = isShort ? "Short Copper Totem" : "Copper Totem";
                    hexColor = "#B87333";
                    totemTier = 2;
                    break;
                case "iron":
                    displayName = isShort ? "Short Iron Totem" : "Iron Totem";
                    hexColor = "#808080"; // gray
                    totemTier = 3;
                    break;
                case "gold":
                    displayName = isShort ? "Short Gold Totem" : "Gold Totem";
                    hexColor = "#DAA520"; // gold
                    totemTier = 4;
                    break;
                case "diamond":
                    displayName = isShort ? "Short Diamond Totem" : "Diamond Totem";
                    hexColor = "#00FFFF"; // aqua
                    totemTier = 5;
                    hasGlint = true;
                    break;
                case "netherite":
                    displayName = isShort ? "Short Netherite Totem" : "Netherite Totem";
                    hexColor = "#8B0000"; // dark_red
                    totemTier = 6;
                    hasGlint = true;
                    break;
                default:
                    displayName = "Unknown Totem";
                    hexColor = "#FFFFFF";
                    totemTier = 1;
            }

            // Set custom name with hex color
            TextColor color = TextColor.parse(hexColor).result().orElse(TextColor.fromRgb(0xFFFFFF));
            totem.set(DataComponentTypes.CUSTOM_NAME, Text.literal(displayName)
                    .styled(style -> style.withColor(color).withItalic(false)));

            // Create custom_data NBT
            NbtCompound customData = new NbtCompound();
            customData.putInt("rituals_totem", 1);
            customData.putInt("totem_tier", totemTier);
            if (isShort) {
                customData.putInt("totem_short", 1);
            }

            totem.set(DataComponentTypes.CUSTOM_DATA, NbtComponent.of(customData));

            // Add enchantment glint for diamond/netherite
            if (hasGlint) {
                totem.set(DataComponentTypes.ENCHANTMENT_GLINT_OVERRIDE, true);
            }

            player.giveItemStack(totem);
            source.sendFeedback(() -> Text.literal("[Rituals] ").formatted(Formatting.GOLD).formatted(Formatting.BOLD)
                    .append(Text.literal("Gave " + displayName + "!").formatted(Formatting.GREEN)), false);
            LOGGER.info("Gave {} to {}", displayName, player.getName().getString());
            return Command.SINGLE_SUCCESS;
        } catch (Exception e) {
            source.sendError(Text.literal("This command must be run by a player!"));
            LOGGER.error("Error giving totem", e);
            return 0;
        }
    }

    private int giveAllTotems(CommandContext<ServerCommandSource> ctx) {
        giveTotem(ctx, "wood", false);
        giveTotem(ctx, "copper", false);
        giveTotem(ctx, "iron", false);
        giveTotem(ctx, "gold", false);
        giveTotem(ctx, "diamond", false);
        giveTotem(ctx, "netherite", false);
        giveTotemsShort(ctx);
        giveGuidebook(ctx);
        ctx.getSource()
                .sendFeedback(() -> Text.literal("[Rituals] ").formatted(Formatting.GOLD).formatted(Formatting.BOLD)
                        .append(Text.literal("Gave all items + Guidebook!").formatted(Formatting.GREEN)), false);
        return Command.SINGLE_SUCCESS;
    }

    private int giveTotemsShort(CommandContext<ServerCommandSource> ctx) {
        giveTotem(ctx, "wood", true);
        giveTotem(ctx, "copper", true);
        giveTotem(ctx, "iron", true);
        giveTotem(ctx, "gold", true);
        giveTotem(ctx, "diamond", true);
        giveTotem(ctx, "netherite", true);
        return Command.SINGLE_SUCCESS;
    }

    private int reloadConfig(CommandContext<ServerCommandSource> ctx) {
        ctx.getSource().sendFeedback(() -> Text.literal("✓ Configuration reloaded!").formatted(Formatting.GREEN),
                false);
        return Command.SINGLE_SUCCESS;
    }

    private int showDebugStatus(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        source.sendFeedback(() -> Text.literal("=== Rituals Debug Status ===").formatted(Formatting.GOLD), false);
        source.sendFeedback(() -> Text.literal("Mod Version: 1.1.0").formatted(Formatting.GRAY), false);
        source.sendFeedback(() -> Text.literal("Status: Running").formatted(Formatting.GREEN), false);
        return Command.SINGLE_SUCCESS;
    }

    private int enableDebugMode(CommandContext<ServerCommandSource> ctx) {
        ctx.getSource().sendFeedback(() -> Text.literal("✓ Debug mode enabled!").formatted(Formatting.GREEN), false);
        return Command.SINGLE_SUCCESS;
    }

    private int disableDebugMode(CommandContext<ServerCommandSource> ctx) {
        ctx.getSource().sendFeedback(() -> Text.literal("✓ Debug mode disabled!").formatted(Formatting.YELLOW), false);
        return Command.SINGLE_SUCCESS;
    }

    private int enableKiwiMode(CommandContext<ServerCommandSource> ctx) {
        ctx.getSource().sendFeedback(
                () -> Text.literal("✓ Kiwi Mode enabled! (No fire sacrifice required)").formatted(Formatting.GREEN),
                false);
        return Command.SINGLE_SUCCESS;
    }

    private int disableKiwiMode(CommandContext<ServerCommandSource> ctx) {
        ctx.getSource().sendFeedback(
                () -> Text.literal("✓ Kiwi Mode disabled! (Fire sacrifice required)").formatted(Formatting.YELLOW),
                false);
        return Command.SINGLE_SUCCESS;
    }

    private int listTotems(CommandContext<ServerCommandSource> ctx) {
        ctx.getSource().sendFeedback(() -> Text.literal("=== Active Totems ===").formatted(Formatting.GOLD), false);
        ctx.getSource().sendFeedback(() -> Text.literal("(Totem tracking in development)").formatted(Formatting.GRAY),
                false);
        return Command.SINGLE_SUCCESS;
    }

    private int resetAll(CommandContext<ServerCommandSource> ctx) {
        ctx.getSource().sendFeedback(() -> Text.literal("⚠ Reset all ritual data!").formatted(Formatting.RED), false);
        return Command.SINGLE_SUCCESS;
    }

    private int uninstall(CommandContext<ServerCommandSource> ctx) {
        ctx.getSource().sendFeedback(() -> Text.literal("⚠ Uninstall prepared!").formatted(Formatting.RED), false);
        return Command.SINGLE_SUCCESS;
    }

    private int unlockAllRecipes(CommandContext<ServerCommandSource> ctx) {
        ctx.getSource().sendFeedback(() -> Text.literal("✓ All recipes unlocked!").formatted(Formatting.GREEN), false);
        return Command.SINGLE_SUCCESS;
    }

    private int updatePreviews(CommandContext<ServerCommandSource> ctx) {
        ctx.getSource().sendFeedback(() -> Text.literal("✓ Updated totem previews!").formatted(Formatting.GREEN),
                false);
        return Command.SINGLE_SUCCESS;
    }

    private int testRecipes(CommandContext<ServerCommandSource> ctx) {
        ctx.getSource().sendFeedback(() -> Text.literal("=== Recipe Test ===").formatted(Formatting.GOLD), false);
        ctx.getSource().sendFeedback(() -> Text.literal("✓ All recipes functional").formatted(Formatting.GREEN), false);
        return Command.SINGLE_SUCCESS;
    }

    private int debugRecipes(CommandContext<ServerCommandSource> ctx) {
        ctx.getSource().sendFeedback(() -> Text.literal("=== Recipe Debug Info ===").formatted(Formatting.GOLD), false);
        ctx.getSource().sendFeedback(() -> Text.literal("Total recipes: 12").formatted(Formatting.GRAY), false);
        return Command.SINGLE_SUCCESS;
    }

    private int debugBarriers(CommandContext<ServerCommandSource> ctx) {
        ctx.getSource().sendFeedback(() -> Text.literal("=== Barrier Debug ===").formatted(Formatting.GOLD), false);
        ctx.getSource().sendFeedback(() -> Text.literal("Barrier entities: 0").formatted(Formatting.GRAY), false);
        return Command.SINGLE_SUCCESS;
    }

    private int checkBadgeStatus(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        try {
            ServerPlayerEntity player = source.getPlayerOrThrow();

            // Check scoreboard data from datapack if available
            int ritualsCompleted = 0;
            String badgeTier = "§aNovice";

            try {
                var scoreboard = source.getServer().getScoreboard();
                var objective = scoreboard.getNullableObjective("rituals.ritual_count");
                if (objective != null) {
                    ritualsCompleted = scoreboard.getScore(player, objective).getScore();
                }

                // Determine badge tier
                if (ritualsCompleted >= 100)
                    badgeTier = "§6Legendary";
                else if (ritualsCompleted >= 50)
                    badgeTier = "§5Epic";
                else if (ritualsCompleted >= 25)
                    badgeTier = "§bRare";
                else if (ritualsCompleted >= 10)
                    badgeTier = "§2Uncommon";
                else if (ritualsCompleted >= 5)
                    badgeTier = "§fCommon";

            } catch (Exception ignored) {
                // Scoreboard not available, use defaults
            }

            final int finalRitualsCompleted = ritualsCompleted;
            final String finalBadgeTier = badgeTier;

            source.sendFeedback(() -> Text.literal(""), false);
            source.sendFeedback(
                    () -> Text.literal("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━").formatted(Formatting.GOLD), false);
            source.sendFeedback(
                    () -> Text.literal("  ⚡ Ritual Badge Status").formatted(Formatting.GOLD).formatted(Formatting.BOLD),
                    false);
            source.sendFeedback(
                    () -> Text.literal("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━").formatted(Formatting.GOLD), false);
            source.sendFeedback(() -> Text.literal(""), false);
            source.sendFeedback(() -> Text.literal("Player: ").formatted(Formatting.GRAY)
                    .append(Text.literal(player.getName().getString()).formatted(Formatting.WHITE)), false);
            source.sendFeedback(() -> Text.literal("Rituals Completed: ").formatted(Formatting.GRAY)
                    .append(Text.literal(String.valueOf(finalRitualsCompleted)).formatted(Formatting.YELLOW)), false);
            source.sendFeedback(() -> Text.literal("Badge Tier: ").formatted(Formatting.GRAY)
                    .append(Text.literal(finalBadgeTier)), false);
            source.sendFeedback(() -> Text.literal(""), false);
            source.sendFeedback(
                    () -> Text.literal("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━").formatted(Formatting.GOLD), false);

            return Command.SINGLE_SUCCESS;
        } catch (Exception e) {
            source.sendError(Text.literal("This command must be run by a player!"));
            LOGGER.error("Error checking badge status", e);
            return 0;
        }
    }

}
