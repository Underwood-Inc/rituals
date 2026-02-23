package com.rituals.soul;

import java.util.ArrayList;
import java.util.List;

import com.rituals.RitualsMod;

import net.minecraft.component.DataComponentTypes;
import net.minecraft.component.type.LoreComponent;
import net.minecraft.component.type.NbtComponent;
import net.minecraft.item.ItemStack;
import net.minecraft.nbt.NbtCompound;
import net.minecraft.nbt.NbtElement;
import net.minecraft.text.Text;
import net.minecraft.text.TextColor;
import net.minecraft.util.Formatting;

/**
 * SoulEmbodimentManager - Helper utilities for soul-embodied items
 * 
 * Provides helper methods used by commands and the SoulXpTracker.
 * The datapack handles all core ritual logic (totem sync, level-up, etc.).
 * When the Java mod is present, SoulXpTracker handles XP tracking via events.
 * 
 * This class provides:
 * - Soul item detection (isSoulWeapon)
 * - Lore/tooltip rendering (updateLore)
 * - XP curve calculation (calculateXpForLevel)
 * - NBT helper utilities
 * 
 * NOTE: "Weapon" in method names is retained for backward compatibility,
 * but the system supports ANY item (tools, weapons, or otherwise).
 * 
 * IMPORTANT: The datapack works standalone without this mod!
 */
public class SoulEmbodimentManager {

    private static boolean initialized = false;

    /**
     * Initialize the soul embodiment helper system.
     * Called from RitualsMod.onInitialize().
     * 
     * NOTE: XP tracking is handled by SoulXpTracker, not here.
     * This class only provides utility/helper methods.
     */
    public static void initialize() {
        if (initialized) return;

        initialized = true;
        RitualsMod.LOGGER.info("[Soul Embodiment] Helper utilities initialized");
    }

    /**
     * Check if an item is a soul-embodied weapon
     */
    public static boolean isSoulWeapon(ItemStack stack) {
        if (stack.isEmpty()) return false;
        
        NbtComponent customData = stack.get(DataComponentTypes.CUSTOM_DATA);
        if (customData == null) return false;
        
        NbtCompound nbt = customData.copyNbt();
        // Check if soul_embodied exists and is true (byte 1)
        if (!nbt.contains("soul_embodied")) return false;
        
        NbtElement element = nbt.get("soul_embodied");
        if (element == null) return false;
        
        // Handle both boolean (stored as byte) and int formats (1.21.1+ API)
        byte type = element.getType();
        if (type == NbtElement.BYTE_TYPE) {
            return nbt.getByte("soul_embodied").orElse((byte) 0) == 1;
        } else if (type == NbtElement.INT_TYPE) {
            return nbt.getInt("soul_embodied").orElse(0) == 1;
        }
        return false;
    }

    /**
     * Get an integer from NBT safely (1.21.1+ API with Optional returns)
     */
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

    /**
     * Get a string from NBT safely (1.21.1+ API with Optional returns)
     */
    private static String getNbtString(NbtCompound nbt, String key, String defaultValue) {
        if (!nbt.contains(key)) return defaultValue;
        NbtElement element = nbt.get(key);
        if (element == null) return defaultValue;
        if (element.getType() == NbtElement.STRING_TYPE) {
            return nbt.getString(key).orElse(defaultValue);
        }
        return defaultValue;
    }

    /**
     * Get a boolean from NBT safely (1.21.1+ API with Optional returns)
     */
    private static boolean getNbtBool(NbtCompound nbt, String key) {
        if (!nbt.contains(key)) return false;
        NbtElement element = nbt.get(key);
        if (element == null) return false;
        if (element.getType() == NbtElement.BYTE_TYPE) {
            return nbt.getByte(key).orElse((byte) 0) == 1;
        }
        return false;
    }

    /**
     * Calculate XP required for a given level
     * Formula: base_xp × (level ^ 1.5) + (level × 50)
     */
    public static int calculateXpForLevel(int level) {
        return (int) (100 * Math.pow(level, 1.5) + level * 50);
    }

    /**
     * Refresh lore if the item has pending updates
     */
    private static void refreshLoreIfNeeded(ItemStack stack) {
        NbtComponent customData = stack.get(DataComponentTypes.CUSTOM_DATA);
        if (customData == null) return;
        
        NbtCompound nbt = customData.copyNbt();
        
        // Check if pending refresh flag is set (datapack sets this)
        if (getNbtBool(nbt, "soul_pending_lore_update")) {
            nbt.putBoolean("soul_pending_lore_update", false);
            stack.set(DataComponentTypes.CUSTOM_DATA, NbtComponent.of(nbt));
            updateLore(stack, nbt);
        }
    }

    // ── Color constants for rich tooltip rendering (compressy pattern) ──

    /** Bright green for filled XP bar segments */
    private static final TextColor BAR_FILLED_COLOR = parseColor("#55FF55", 0x55FF55);
    /** Dark gray for empty XP bar segments */
    private static final TextColor BAR_EMPTY_COLOR = parseColor("#3A3A3A", 0x3A3A3A);
    /** Percentage text color */
    private static final TextColor PERCENT_COLOR = parseColor("#AAFFAA", 0xAAFFAA);
    /** Header/footer separator color */
    private static final TextColor SEPARATOR_COLOR = parseColor("#5B2C8E", 0x5B2C8E);
    /** Soul name highlight */
    private static final TextColor SOUL_NAME_COLOR = parseColor("#FF55FF", 0xFF55FF);
    /** Stat label color */
    private static final TextColor LABEL_COLOR = parseColor("#AAAAAA", 0xAAAAAA);
    /** Ascension ready pulse color */
    private static final TextColor ASCEND_COLOR = parseColor("#FFD700", 0xFFD700);
    /** Muted info color */
    private static final TextColor MUTED_COLOR = parseColor("#666666", 0x666666);
    /** Bonus enchant color */
    private static final TextColor BONUS_COLOR = parseColor("#AA00FF", 0xAA00FF);

    /** Number of segments in the XP bar */
    private static final int BAR_SEGMENTS = 20;
    /** Character for filled bar segments */
    private static final String BAR_FILLED_CHAR = "█";
    /** Character for empty bar segments */
    private static final String BAR_EMPTY_CHAR = "░";

    /**
     * Parse a hex color string with a fallback RGB value.
     * Mirrors the compressy mod's TextColor.parse() pattern.
     */
    private static TextColor parseColor(String hex, int fallbackRgb) {
        return TextColor.parse(hex).result().orElse(TextColor.fromRgb(fallbackRgb));
    }

    /**
     * Update the item's lore to reflect current soul state.
     * 
     * MOD ENHANCEMENT - Rich tooltip with XP progress bar.
     * 
     * Follows the compressy mod's tooltip pattern:
     * - All lines use withItalic(false) to prevent default lore italic
     * - Separate Text components for filled/empty bar segments with distinct colors
     * - Hex colors via TextColor for richer visuals
     * - Decorative separators for visual structure
     */
    public static void updateLore(ItemStack stack, NbtCompound nbt) {
        List<Text> loreLines = new ArrayList<>();

        // ── Read soul data from NBT ──
        String name = getNbtString(nbt, "soul_name", "Soulbound");
        int level = getNbtInt(nbt, "soul_level", 1);
        int xp = getNbtInt(nbt, "soul_xp", 0);
        int levelCap = getNbtInt(nbt, "soul_level_cap", 15);
        int tier = getNbtInt(nbt, "soul_ascension_tier", 1);
        int bonusEnchants = getNbtInt(nbt, "soul_bonus_enchants", 0);
        boolean readyAscend = getNbtBool(nbt, "soul_ready_ascend");
        boolean fractured = getNbtBool(nbt, "soul_fractured");
        int xpTotal = getNbtInt(nbt, "soul_xp_total", 0);

        // ── XP calculations ──
        int xpForNext = calculateXpForLevel(level + 1);
        int percent = level >= levelCap ? 100 : (xp * 100 / Math.max(1, xpForNext));
        TextColor accentColor = getSoulAccentColor(level);

        // ── Top separator ──
        loreLines.add(styledLine("━━━━━━━━━━━━━━━━━━━━━━━━", SEPARATOR_COLOR));

        // ── Soul name ──
        loreLines.add(noItalic(
            Text.literal("✦ ").styled(s -> s.withColor(accentColor))
                .append(Text.literal("\"" + name + "\"").styled(s -> s.withColor(SOUL_NAME_COLOR).withBold(true).withItalic(false)))
        ));

        // ── Level / Tier ──
        if (readyAscend) {
            loreLines.add(noItalic(
                Text.literal("⚡ ").styled(s -> s.withColor(ASCEND_COLOR))
                    .append(Text.literal("Lv." + level + "/" + levelCap).styled(s -> s.withColor(Formatting.YELLOW).withItalic(false)))
                    .append(Text.literal(" READY TO ASCEND!").styled(s -> s.withColor(ASCEND_COLOR).withBold(true).withItalic(false)))
            ));
        } else {
            loreLines.add(noItalic(
                Text.literal("⬥ Level: ").styled(s -> s.withColor(LABEL_COLOR))
                    .append(Text.literal(level + "/" + levelCap).styled(s -> s.withColor(Formatting.YELLOW).withItalic(false)))
                    .append(Text.literal(" (Tier " + toRoman(tier) + ")").styled(s -> s.withColor(MUTED_COLOR).withItalic(false)))
            ));
        }

        // ── XP progress bar ──
        // Line 1: "XP: 79/382"
        loreLines.add(noItalic(
            Text.literal("⬥ XP: ").styled(s -> s.withColor(LABEL_COLOR))
                .append(Text.literal(String.format("%,d", xp) + "/" + String.format("%,d", xpForNext)).styled(s -> s.withColor(Formatting.GREEN).withItalic(false)))
        ));

        // Line 2: The visual bar — filled segments (green) + empty segments (dark) + percent
        int filledSegments = (percent * BAR_SEGMENTS) / 100;
        int emptySegments = BAR_SEGMENTS - filledSegments;
        String filledStr = BAR_FILLED_CHAR.repeat(Math.max(0, filledSegments));
        String emptyStr = BAR_EMPTY_CHAR.repeat(Math.max(0, emptySegments));

        loreLines.add(noItalic(
            Text.literal("  ").styled(s -> s.withItalic(false))
                .append(Text.literal(filledStr).styled(s -> s.withColor(BAR_FILLED_COLOR).withItalic(false)))
                .append(Text.literal(emptyStr).styled(s -> s.withColor(BAR_EMPTY_COLOR).withItalic(false)))
                .append(Text.literal(" " + percent + "%").styled(s -> s.withColor(PERCENT_COLOR).withItalic(false)))
        ));

        // ── Empty spacer ──
        loreLines.add(Text.empty());

        // ── Bonus enchants ──
        if (bonusEnchants > 0) {
            loreLines.add(noItalic(
                Text.literal("✧ Enchants: ").styled(s -> s.withColor(LABEL_COLOR))
                    .append(Text.literal("+" + bonusEnchants).styled(s -> s.withColor(BONUS_COLOR).withBold(true).withItalic(false)))
            ));
        }

        // ── Total XP ──
        loreLines.add(noItalic(
            Text.literal("⬥ Total XP: ").styled(s -> s.withColor(LABEL_COLOR))
                .append(Text.literal(String.format("%,d", xpTotal)).styled(s -> s.withColor(Formatting.GREEN).withItalic(false)))
        ));

        // ── Ascension progress ──
        int remaining = 18 - tier;
        loreLines.add(noItalic(
            Text.literal("⬥ Ascensions: ").styled(s -> s.withColor(LABEL_COLOR))
                .append(Text.literal(tier + "/18").styled(s -> s.withColor(Formatting.YELLOW).withItalic(false)))
                .append(Text.literal(" (" + remaining + " left)").styled(s -> s.withColor(MUTED_COLOR).withItalic(false)))
        ));

        // ── Fractured warning ──
        if (fractured) {
            loreLines.add(Text.empty());
            loreLines.add(noItalic(
                Text.literal("☠ FRACTURED").styled(s -> s.withColor(Formatting.DARK_RED).withBold(true))
            ));
        }

        // ── Bottom separator + soul marker ──
        loreLines.add(styledLine("━━━━━━━━━━━━━━━━━━━━━━━━", SEPARATOR_COLOR));
        if (level >= 100) {
            loreLines.add(noItalic(
                Text.literal("☆ OMEGA ☆").styled(s -> s.withColor(ASCEND_COLOR).withBold(true))
            ));
        } else {
            loreLines.add(noItalic(
                Text.literal("Soul Embodied").styled(s -> s.withColor(accentColor))
            ));
        }

        // ── Apply lore to item stack ──
        stack.set(DataComponentTypes.LORE, new LoreComponent(loreLines));
    }

    /**
     * Create a styled separator line with italic disabled.
     * Follows compressy's withItalic(false) pattern for lore lines.
     */
    private static Text styledLine(String text, TextColor color) {
        return Text.literal(text).styled(s -> s.withColor(color).withItalic(false));
    }

    /**
     * Wrap a Text in a non-italic style for lore display.
     * Minecraft renders item lore in italic by default; this prevents that.
     */
    private static Text noItalic(Text text) {
        return text.copy().styled(s -> s.withItalic(false));
    }

    /**
     * Get a soul-level-based accent color for visual progression.
     * Similar to compressy's getTierColor() — color shifts as the weapon grows.
     *
     * @param level the current soul level (1-100)
     * @return accent TextColor appropriate for the soul's maturity
     */
    private static TextColor getSoulAccentColor(int level) {
        if (level <= 15) {
            return parseColor("#55FFFF", 0x55FFFF);  // Cyan — Awakening
        } else if (level <= 30) {
            return parseColor("#55FF55", 0x55FF55);  // Green — Growth
        } else if (level <= 50) {
            return parseColor("#FFFF55", 0xFFFF55);  // Yellow — Maturity
        } else if (level <= 70) {
            return parseColor("#FFAA00", 0xFFAA00);  // Orange — Mastery
        } else if (level <= 90) {
            return parseColor("#FF55FF", 0xFF55FF);  // Magenta — Transcendence
        } else {
            return parseColor("#FFD700", 0xFFD700);  // Gold — Apotheosis
        }
    }

    /**
     * Convert number to Roman numerals (for tier display)
     */
    private static String toRoman(int num) {
        if (num <= 0 || num > 18) return String.valueOf(num);
        String[] romans = {"I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X",
                          "XI", "XII", "XIII", "XIV", "XV", "XVI", "XVII", "XVIII"};
        return romans[num - 1];
    }
}
