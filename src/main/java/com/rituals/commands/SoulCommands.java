package com.rituals.commands;

import com.mojang.brigadier.Command;
import com.mojang.brigadier.arguments.StringArgumentType;
import com.mojang.brigadier.context.CommandContext;
import com.rituals.soul.SoulEmbodimentManager;
import net.minecraft.component.DataComponentTypes;
import net.minecraft.component.type.NbtComponent;
import net.minecraft.item.ItemStack;
import net.minecraft.nbt.NbtCompound;
import net.minecraft.nbt.NbtElement;
import net.minecraft.server.command.ServerCommandSource;
import net.minecraft.server.network.ServerPlayerEntity;
import net.minecraft.text.Text;
import net.minecraft.util.Formatting;

/**
 * Soul Embodiment commands for the Fabric mod
 */
public class SoulCommands {

    /**
     * /rituals soul info - Display detailed info about held soul-embodied item
     */
    public static int showInfo(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        try {
            ServerPlayerEntity player = source.getPlayerOrThrow();
            ItemStack held = player.getMainHandStack();
            
            if (!SoulEmbodimentManager.isSoulWeapon(held)) {
                source.sendError(Text.literal("You must hold a soul-embodied item to use this command!"));
                return 0;
            }
            
            // Get NBT data
            NbtComponent customData = held.get(DataComponentTypes.CUSTOM_DATA);
            if (customData == null) {
                source.sendError(Text.literal("Could not read soul data!"));
                return 0;
            }
            
            NbtCompound nbt = customData.copyNbt();
            
            String name = getNbtString(nbt, "soul_name", "Unknown");
            int level = getNbtInt(nbt, "soul_level", 1);
            int xp = getNbtInt(nbt, "soul_xp", 0);
            int xpTotal = getNbtInt(nbt, "soul_xp_total", 0);
            int cap = getNbtInt(nbt, "soul_level_cap", 15);
            int tier = getNbtInt(nbt, "soul_ascension_tier", 1);
            int bonuses = getNbtInt(nbt, "soul_bonus_enchants", 0);
            String type = getNbtString(nbt, "soul_type", "generic");
            boolean readyAscend = getNbtBool(nbt, "soul_ready_ascend");
            
            int xpForNext = SoulEmbodimentManager.calculateXpForLevel(level + 1);
            int percent = level >= cap ? 100 : (xp * 100 / Math.max(1, xpForNext));
            
            // Display header
            source.sendFeedback(() -> Text.literal(""), false);
            source.sendFeedback(() -> Text.literal("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
                .formatted(Formatting.DARK_PURPLE), false);
            source.sendFeedback(() -> Text.literal("  ✦ SOUL WEAPON INFO ✦")
                .formatted(Formatting.LIGHT_PURPLE, Formatting.BOLD), false);
            source.sendFeedback(() -> Text.literal("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
                .formatted(Formatting.DARK_PURPLE), false);
            
            // Soul name
            final String finalName = name;
            source.sendFeedback(() -> Text.literal("  Name: ").formatted(Formatting.GRAY)
                .append(Text.literal("\"" + finalName + "\"").formatted(Formatting.WHITE, Formatting.BOLD)), false);
            
            // Type
            final String finalType = type.substring(0, 1).toUpperCase() + type.substring(1);
            source.sendFeedback(() -> Text.literal("  Type: ").formatted(Formatting.GRAY)
                .append(Text.literal(finalType).formatted(Formatting.AQUA)), false);
            
            // Level and tier
            final int fLevel = level;
            final int fCap = cap;
            final int fTier = tier;
            if (readyAscend) {
                source.sendFeedback(() -> Text.literal("  Level: ").formatted(Formatting.GRAY)
                    .append(Text.literal(fLevel + "/" + fCap + " ").formatted(Formatting.YELLOW))
                    .append(Text.literal("⚡ READY TO ASCEND!").formatted(Formatting.GOLD, Formatting.BOLD)), false);
            } else {
                source.sendFeedback(() -> Text.literal("  Level: ").formatted(Formatting.GRAY)
                    .append(Text.literal(fLevel + "/" + fCap).formatted(Formatting.YELLOW))
                    .append(Text.literal(" (Tier " + toRoman(fTier) + ")").formatted(Formatting.DARK_GRAY)), false);
            }
            
            // XP bar
            final int fXp = xp;
            final int fXpNext = xpForNext;
            final int fPercent = percent;
            String bar = generateBar(percent);
            source.sendFeedback(() -> Text.literal("  XP: ").formatted(Formatting.GRAY)
                .append(Text.literal(fXp + "/" + fXpNext + " ").formatted(Formatting.GREEN))
                .append(Text.literal(bar + " " + fPercent + "%").formatted(Formatting.DARK_GREEN)), false);
            
            // Total XP
            final int fXpTotal = xpTotal;
            source.sendFeedback(() -> Text.literal("  Total XP: ").formatted(Formatting.GRAY)
                .append(Text.literal(String.format("%,d", fXpTotal)).formatted(Formatting.GREEN)), false);
            
            // Bonus enchants
            final int fBonuses = bonuses;
            source.sendFeedback(() -> Text.literal("  Bonus Enchants: ").formatted(Formatting.GRAY)
                .append(Text.literal("+" + fBonuses).formatted(fBonuses > 0 ? Formatting.LIGHT_PURPLE : Formatting.DARK_GRAY)), false);
            
            // Ascension progress
            int ascensionsRemaining = 18 - tier;
            final int fRemaining = ascensionsRemaining;
            source.sendFeedback(() -> Text.literal("  Ascensions: ").formatted(Formatting.GRAY)
                .append(Text.literal(fTier + "/18").formatted(Formatting.YELLOW))
                .append(Text.literal(" (" + fRemaining + " remaining)").formatted(Formatting.DARK_GRAY)), false);
            
            source.sendFeedback(() -> Text.literal("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
                .formatted(Formatting.DARK_PURPLE), false);
            
            return Command.SINGLE_SUCCESS;
        } catch (Exception e) {
            source.sendError(Text.literal("This command must be run by a player holding a soul-embodied item!"));
            return 0;
        }
    }

    /**
     * /rituals soul rename <name> - Rename your soul-embodied item
     */
    public static int rename(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        try {
            ServerPlayerEntity player = source.getPlayerOrThrow();
            ItemStack held = player.getMainHandStack();
            
            if (!SoulEmbodimentManager.isSoulWeapon(held)) {
                source.sendError(Text.literal("You must hold a soul-embodied item to rename it!"));
                return 0;
            }
            
            String newName = StringArgumentType.getString(ctx, "name");
            
            // Validate name length
            if (newName.length() < 2 || newName.length() > 24) {
                source.sendError(Text.literal("Soul name must be 2-24 characters!"));
                return 0;
            }
            
            // Get existing NBT and update name
            NbtComponent customData = held.get(DataComponentTypes.CUSTOM_DATA);
            if (customData == null) {
                source.sendError(Text.literal("Could not read soul data!"));
                return 0;
            }
            
            NbtCompound nbt = customData.copyNbt();
            String oldName = getNbtString(nbt, "soul_name", "Unknown");
            nbt.putString("soul_name", newName);
            held.set(DataComponentTypes.CUSTOM_DATA, NbtComponent.of(nbt));
            
            // Refresh lore
            SoulEmbodimentManager.updateLore(held, nbt);
            
            source.sendFeedback(() -> Text.literal("✦ ").formatted(Formatting.DARK_PURPLE)
                .append(Text.literal("Soul renamed from ").formatted(Formatting.GRAY))
                .append(Text.literal("\"" + oldName + "\"").formatted(Formatting.WHITE))
                .append(Text.literal(" to ").formatted(Formatting.GRAY))
                .append(Text.literal("\"" + newName + "\"").formatted(Formatting.WHITE, Formatting.BOLD))
                .append(Text.literal("!").formatted(Formatting.GRAY)), false);
            
            return Command.SINGLE_SUCCESS;
        } catch (Exception e) {
            source.sendError(Text.literal("Usage: /rituals soul rename <name>"));
            return 0;
        }
    }

    // Helper methods
    private static int getNbtInt(NbtCompound nbt, String key, int defaultValue) {
        if (!nbt.contains(key)) return defaultValue;
        NbtElement element = nbt.get(key);
        if (element == null) return defaultValue;
        if (element.getType() == NbtElement.INT_TYPE) {
            return nbt.getInt(key).orElse(defaultValue);
        } else if (element.getType() == NbtElement.BYTE_TYPE) {
            return nbt.getByte(key).orElse((byte) defaultValue);
        }
        return defaultValue;
    }

    private static String getNbtString(NbtCompound nbt, String key, String defaultValue) {
        if (!nbt.contains(key)) return defaultValue;
        NbtElement element = nbt.get(key);
        if (element == null) return defaultValue;
        if (element.getType() == NbtElement.STRING_TYPE) {
            return nbt.getString(key).orElse(defaultValue);
        }
        return defaultValue;
    }

    private static boolean getNbtBool(NbtCompound nbt, String key) {
        if (!nbt.contains(key)) return false;
        NbtElement element = nbt.get(key);
        if (element == null) return false;
        if (element.getType() == NbtElement.BYTE_TYPE) {
            return nbt.getByte(key).orElse((byte) 0) == 1;
        }
        return false;
    }

    private static String generateBar(int percent) {
        int filled = percent / 10;
        int empty = 10 - filled;
        return "▓".repeat(Math.max(0, filled)) + "░".repeat(Math.max(0, empty));
    }

    private static String toRoman(int num) {
        if (num <= 0 || num > 18) return String.valueOf(num);
        String[] romans = {"I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X",
                          "XI", "XII", "XIII", "XIV", "XV", "XVI", "XVII", "XVIII"};
        return romans[num - 1];
    }
}

