package com.rituals.soul;

import java.util.ArrayList;
import java.util.List;

import com.rituals.RitualsMod;

import net.fabricmc.fabric.api.event.lifecycle.v1.ServerTickEvents;
import net.fabricmc.fabric.api.event.player.AttackEntityCallback;
import net.minecraft.component.DataComponentTypes;
import net.minecraft.component.type.LoreComponent;
import net.minecraft.component.type.NbtComponent;
import net.minecraft.item.ItemStack;
import net.minecraft.nbt.NbtCompound;
import net.minecraft.nbt.NbtElement;
import net.minecraft.server.network.ServerPlayerEntity;
import net.minecraft.sound.SoundEvents;
import net.minecraft.text.Text;
import net.minecraft.util.ActionResult;
import net.minecraft.util.Formatting;

/**
 * SoulWeaponManager - Enhances soul weapons with real-time updates
 * 
 * This class provides MOD-ONLY enhancements to the Soul Embodiment system.
 * The datapack handles all core logic; this adds:
 * - Real-time XP tracking (no need to sync on totem)
 * - Instant tooltip/lore updates
 * - Actual enchantment application on bonus rolls
 * 
 * IMPORTANT: The datapack works standalone without this mod!
 * This is purely an ENHANCEMENT layer.
 */
public class SoulWeaponManager {

    private static boolean initialized = false;

    /**
     * Initialize the soul weapon event handlers
     * Called from RitualsMod.onInitialize()
     */
    public static void initialize() {
        if (initialized) return;

        // Register entity attack callback for combat XP
        AttackEntityCallback.EVENT.register((player, world, hand, entity, hitResult) -> {
            if (!world.isClient() && player instanceof ServerPlayerEntity serverPlayer) {
                ItemStack held = serverPlayer.getMainHandStack();
                if (isSoulWeapon(held)) {
                    awardXp(serverPlayer, held, 2, "combat");
                }
            }
            return ActionResult.PASS;
        });

        // Optional: Tick event for periodic lore refresh (every 20 ticks = 1 second)
        ServerTickEvents.END_SERVER_TICK.register(server -> {
            if (server.getTicks() % 20 != 0) return;
            
            for (ServerPlayerEntity player : server.getPlayerManager().getPlayerList()) {
                ItemStack held = player.getMainHandStack();
                if (isSoulWeapon(held)) {
                    // Refresh lore if needed
                    refreshLoreIfNeeded(held);
                }
            }
        });

        initialized = true;
        RitualsMod.LOGGER.info("[Soul Embodiment] Real-time enhancement layer initialized");
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
     * Award XP to a soul weapon (MOD ENHANCEMENT - real-time)
     * This bypasses the datapack's totem-sync requirement
     */
    public static void awardXp(ServerPlayerEntity player, ItemStack stack, int amount, String source) {
        if (!isSoulWeapon(stack)) return;
        
        NbtComponent customData = stack.get(DataComponentTypes.CUSTOM_DATA);
        if (customData == null) return;
        
        NbtCompound nbt = customData.copyNbt();
        
        int level = getNbtInt(nbt, "soul_level", 1);
        int xp = getNbtInt(nbt, "soul_xp", 0);
        int levelCap = getNbtInt(nbt, "soul_level_cap", 15);
        boolean readyAscend = getNbtBool(nbt, "soul_ready_ascend");
        
        // Check if at level cap (can't gain more XP until ascension)
        if (level >= levelCap) {
            if (!readyAscend) {
                nbt.putBoolean("soul_ready_ascend", true);
                stack.set(DataComponentTypes.CUSTOM_DATA, NbtComponent.of(nbt));
                updateLore(stack, nbt);
                
                player.sendMessage(
                    Text.literal("✦ ").formatted(Formatting.DARK_PURPLE)
                        .append(Text.literal("Your soul weapon has reached its limit! Perform the ritual to ASCEND!")
                            .formatted(Formatting.LIGHT_PURPLE)),
                    true
                );
            }
            return;
        }
        
        // Add XP
        xp += amount;
        
        // Check for level up
        int xpForNextLevel = calculateXpForLevel(level + 1);
        if (xp >= xpForNextLevel && level < levelCap) {
            level++;
            xp -= xpForNextLevel;
            
            // Level up effects
            player.playSound(SoundEvents.ENTITY_PLAYER_LEVELUP, 1.0f, 1.0f);
            
            final int finalLevel = level;
            player.sendMessage(
                Text.literal("⚡ ").formatted(Formatting.GOLD)
                    .append(Text.literal("LEVEL UP! ").formatted(Formatting.YELLOW, Formatting.BOLD))
                    .append(Text.literal("Soul weapon reached level ").formatted(Formatting.GRAY))
                    .append(Text.literal(String.valueOf(finalLevel)).formatted(Formatting.GREEN, Formatting.BOLD))
                    .append(Text.literal("!").formatted(Formatting.GRAY)),
                false
            );
            
            // Check if now at cap
            if (level >= levelCap) {
                nbt.putBoolean("soul_ready_ascend", true);
                player.sendMessage(
                    Text.literal("✦ ").formatted(Formatting.DARK_PURPLE)
                        .append(Text.literal("ASCENSION READY").formatted(Formatting.LIGHT_PURPLE, Formatting.BOLD))
                        .append(Text.literal(" - Perform the Soul Embodiment ritual again!").formatted(Formatting.GRAY)),
                    false
                );
            }
        }
        
        // Update NBT
        nbt.putInt("soul_level", level);
        nbt.putInt("soul_xp", xp);
        int total = getNbtInt(nbt, "soul_xp_total", 0) + amount;
        nbt.putInt("soul_xp_total", total);
        
        // Track stats
        if (source.equals("combat")) {
            int kills = getNbtInt(nbt, "soul_kills", 0) + 1;
            nbt.putInt("soul_kills", kills);
        } else {
            int blocks = getNbtInt(nbt, "soul_blocks_broken", 0) + 1;
            nbt.putInt("soul_blocks_broken", blocks);
        }
        
        // Apply updated data and refresh lore
        stack.set(DataComponentTypes.CUSTOM_DATA, NbtComponent.of(nbt));
        updateLore(stack, nbt);
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

    /**
     * Update the item's lore to reflect current soul state
     * MOD ENHANCEMENT - real-time tooltip updates
     */
    public static void updateLore(ItemStack stack, NbtCompound nbt) {
        List<Text> loreLines = new ArrayList<>();
        
        String name = getNbtString(nbt, "soul_name", "Soulbound");
        int level = getNbtInt(nbt, "soul_level", 1);
        int xp = getNbtInt(nbt, "soul_xp", 0);
        int levelCap = getNbtInt(nbt, "soul_level_cap", 15);
        int tier = getNbtInt(nbt, "soul_ascension_tier", 1);
        int bonusEnchants = getNbtInt(nbt, "soul_bonus_enchants", 0);
        boolean readyAscend = getNbtBool(nbt, "soul_ready_ascend");
        String type = getNbtString(nbt, "soul_type", "generic");
        int kills = getNbtInt(nbt, "soul_kills", 0);
        int blocks = getNbtInt(nbt, "soul_blocks_broken", 0);
        
        // Soul name
        loreLines.add(Text.literal("✦ Soul: ").formatted(Formatting.DARK_PURPLE)
            .append(Text.literal("\"" + name + "\"").formatted(Formatting.WHITE, Formatting.BOLD)));
        
        // Level and tier
        if (readyAscend) {
            loreLines.add(Text.literal("⚡ LEVEL " + level + " - READY TO ASCEND!")
                .formatted(Formatting.GOLD, Formatting.BOLD));
        } else {
            loreLines.add(Text.literal("Level: ").formatted(Formatting.GRAY)
                .append(Text.literal(level + "/" + levelCap).formatted(Formatting.YELLOW))
                .append(Text.literal(" (Tier " + toRoman(tier) + ")").formatted(Formatting.DARK_GRAY)));
        }
        
        // XP bar
        int xpForNext = calculateXpForLevel(level + 1);
        int percent = level >= levelCap ? 100 : (xp * 100 / Math.max(1, xpForNext));
        String bar = generateXpBar(percent);
        loreLines.add(Text.literal("XP: ").formatted(Formatting.GRAY)
            .append(Text.literal(xp + "/" + xpForNext + " ").formatted(Formatting.GREEN))
            .append(Text.literal(bar).formatted(Formatting.DARK_GREEN)));
        
        // Bonus enchants if any
        if (bonusEnchants > 0) {
            loreLines.add(Text.literal("✧ Bonus Enchants: +" + bonusEnchants)
                .formatted(Formatting.DARK_PURPLE));
        }
        
        // Stats based on type
        if (type.equals("sword") || type.equals("axe")) {
            loreLines.add(Text.literal("Kills: " + kills).formatted(Formatting.DARK_GRAY));
        } else {
            loreLines.add(Text.literal("Blocks: " + blocks).formatted(Formatting.DARK_GRAY));
        }
        
        // Soul Embodied marker
        loreLines.add(Text.empty());
        if (level >= 100) {
            loreLines.add(Text.literal("☆ OMEGA ☆").formatted(Formatting.RED, Formatting.BOLD));
        } else {
            loreLines.add(Text.literal("Soul Embodied").formatted(Formatting.DARK_PURPLE));
        }
        
        // Apply lore
        stack.set(DataComponentTypes.LORE, new LoreComponent(loreLines));
    }

    /**
     * Generate a visual XP bar
     */
    private static String generateXpBar(int percent) {
        int filled = percent / 10;
        int empty = 10 - filled;
        return "▓".repeat(Math.max(0, filled)) + "░".repeat(Math.max(0, empty)) + " " + percent + "%";
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
