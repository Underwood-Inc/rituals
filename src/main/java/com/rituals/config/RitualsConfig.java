package com.rituals.config;

import com.rituals.RitualsMod;
import com.moandjiezana.toml.Toml;
import net.fabricmc.loader.api.FabricLoader;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Configuration management for Rituals mod.
 *
 * <p>Supports TOML config file at {@code config/rituals.toml} and ModMenu
 * integration. The block/kill XP maps here are the SAME enumerated lists
 * that the datapack defines via scoreboard constants. When the Java mod
 * loads, {@link com.rituals.soul.SoulXpTracker} pushes these values to
 * the {@code rituals.config} scoreboard, overriding the datapack defaults.</p>
 *
 * <p>If no TOML file exists, defaults matching the datapack's enumerated
 * lists are generated automatically.</p>
 */
public class RitualsConfig {

    private static final Path CONFIG_PATH = FabricLoader.getInstance()
            .getConfigDir().resolve("rituals.toml");

    private static RitualsConfig INSTANCE;

    // === GENERAL ===
    public boolean debugMode = false;
    public boolean kiwiMode = false;
    public boolean requireFireSacrifice = true;

    // === LEVEL CURVE ===
    public int levelBase = 100;
    public int levelScaling = 25;

    // === ENUMERATED XP LISTS ===
    // Key: namespaced ID (e.g. "minecraft:stone"), Value: XP per action
    // These are pushed to the rituals.config scoreboard by SoulXpTracker
    public Map<String, Integer> blockXpValues = new HashMap<>();
    public Map<String, Integer> killXpValues = new HashMap<>();

    // === STATIC API (backward compatibility) ===
    
    public static boolean isKiwiMode() {
        return get().kiwiMode;
    }
    
    public static void setKiwiMode(boolean enabled) {
        get().kiwiMode = enabled;
        if (enabled) {
            get().requireFireSacrifice = false;
        }
        RitualsMod.LOGGER.info("Kiwi Mode: {}", enabled);
    }
    
    public static boolean isDebugMode() {
        return get().debugMode;
    }
    
    public static void setDebugMode(boolean enabled) {
        get().debugMode = enabled;
        RitualsMod.LOGGER.info("Debug Mode: {}", enabled);
    }
    
    public static boolean requiresFireSacrifice() {
        return get().requireFireSacrifice;
    }
    
    public static void setRequireFireSacrifice(boolean required) {
        get().requireFireSacrifice = required;
        RitualsMod.LOGGER.info("Fire Sacrifice Required: {}", required);
    }

    public static RitualsConfig get() {
        if (INSTANCE == null) {
            load();
        }
        return INSTANCE;
    }
    
    public static void reload() {
        INSTANCE = null;
        load();
        RitualsMod.LOGGER.info("Config reloaded");
    }

    public static void load() {
        if (Files.exists(CONFIG_PATH)) {
            try {
                Toml toml = new Toml().read(CONFIG_PATH.toFile());
                INSTANCE = new RitualsConfig();

                INSTANCE.debugMode = toml.getBoolean("general.debugMode", false);
                INSTANCE.kiwiMode = toml.getBoolean("general.kiwiMode", false);
                INSTANCE.requireFireSacrifice = toml.getBoolean("general.requireFireSacrifice", true);
                INSTANCE.levelBase = toml.getLong("levelCurve.levelBase", 100L).intValue();
                INSTANCE.levelScaling = toml.getLong("levelCurve.levelScaling", 25L).intValue();

                INSTANCE.blockXpValues = parseMap(toml.getList("blockXp.entries"));
                INSTANCE.killXpValues = parseMap(toml.getList("killXp.entries"));

                // If TOML had empty lists, populate with defaults
                if (INSTANCE.blockXpValues.isEmpty()) {
                    populateDefaultBlockXp(INSTANCE.blockXpValues);
                }
                if (INSTANCE.killXpValues.isEmpty()) {
                    populateDefaultKillXp(INSTANCE.killXpValues);
                }

                RitualsMod.LOGGER.info("Loaded config from {}", CONFIG_PATH);
            } catch (Exception e) {
                RitualsMod.LOGGER.error("Failed to load config, using defaults", e);
                INSTANCE = new RitualsConfig();
                populateDefaultBlockXp(INSTANCE.blockXpValues);
                populateDefaultKillXp(INSTANCE.killXpValues);
            }
        } else {
            INSTANCE = new RitualsConfig();
            populateDefaultBlockXp(INSTANCE.blockXpValues);
            populateDefaultKillXp(INSTANCE.killXpValues);
            save();
            RitualsMod.LOGGER.info("Created default config at {}", CONFIG_PATH);
        }
    }

    /**
     * XP awarded for breaking a block with a soul weapon.
     *
     * @param blockId Registry ID (e.g. "minecraft:stone")
     * @return XP amount, or 0 if not in the enumerated list
     */
    public int getBlockXpValue(String blockId) {
        return blockXpValues.getOrDefault(blockId, 0);
    }

    /**
     * XP awarded for killing an entity with a soul weapon.
     *
     * @param entityId Registry ID (e.g. "minecraft:zombie")
     * @return XP amount, or 0 if not in the enumerated list
     */
    public int getKillXpValue(String entityId) {
        return killXpValues.getOrDefault(entityId, 0);
    }

    // ========================================
    // DEFAULT ENUMERATED LISTS
    // ========================================
    // These match the datapack's config/soul_xp/*.mcfunction files exactly.
    // When the Java mod is present, SoulXpTracker pushes these to the
    // rituals.config scoreboard, overriding the datapack defaults.

    /**
     * Populates the default block XP values matching the datapack's
     * enumerated lists in config/soul_xp/pickaxe_blocks.mcfunction,
     * shovel_blocks.mcfunction, axe_blocks.mcfunction, hoe_blocks.mcfunction.
     */
    private static void populateDefaultBlockXp(Map<String, Integer> map) {
        // === PICKAXE: STONE TYPES (1 XP) ===
        map.put("minecraft:stone", 1);
        map.put("minecraft:cobblestone", 1);
        map.put("minecraft:mossy_cobblestone", 1);
        map.put("minecraft:smooth_stone", 1);
        map.put("minecraft:stone_bricks", 1);
        map.put("minecraft:mossy_stone_bricks", 1);
        map.put("minecraft:cracked_stone_bricks", 1);
        map.put("minecraft:chiseled_stone_bricks", 1);

        // === DEEPSLATE (1 XP) ===
        map.put("minecraft:deepslate", 1);
        map.put("minecraft:cobbled_deepslate", 1);
        map.put("minecraft:polished_deepslate", 1);
        map.put("minecraft:deepslate_bricks", 1);
        map.put("minecraft:cracked_deepslate_bricks", 1);
        map.put("minecraft:deepslate_tiles", 1);
        map.put("minecraft:cracked_deepslate_tiles", 1);
        map.put("minecraft:chiseled_deepslate", 1);
        map.put("minecraft:reinforced_deepslate", 5);

        // === GRANITE/DIORITE/ANDESITE (1 XP) ===
        map.put("minecraft:granite", 1);
        map.put("minecraft:polished_granite", 1);
        map.put("minecraft:diorite", 1);
        map.put("minecraft:polished_diorite", 1);
        map.put("minecraft:andesite", 1);
        map.put("minecraft:polished_andesite", 1);

        // === TUFF (1 XP) ===
        map.put("minecraft:tuff", 1);
        map.put("minecraft:polished_tuff", 1);
        map.put("minecraft:tuff_bricks", 1);
        map.put("minecraft:chiseled_tuff", 1);
        map.put("minecraft:chiseled_tuff_bricks", 1);

        // === SANDSTONE (1 XP) ===
        map.put("minecraft:sandstone", 1);
        map.put("minecraft:chiseled_sandstone", 1);
        map.put("minecraft:cut_sandstone", 1);
        map.put("minecraft:smooth_sandstone", 1);
        map.put("minecraft:red_sandstone", 1);
        map.put("minecraft:chiseled_red_sandstone", 1);
        map.put("minecraft:cut_red_sandstone", 1);
        map.put("minecraft:smooth_red_sandstone", 1);

        // === NETHER BLOCKS (1 XP) ===
        map.put("minecraft:netherrack", 1);
        map.put("minecraft:nether_bricks", 1);
        map.put("minecraft:cracked_nether_bricks", 1);
        map.put("minecraft:chiseled_nether_bricks", 1);
        map.put("minecraft:red_nether_bricks", 1);
        map.put("minecraft:basalt", 1);
        map.put("minecraft:smooth_basalt", 1);
        map.put("minecraft:polished_basalt", 1);
        map.put("minecraft:blackstone", 1);
        map.put("minecraft:polished_blackstone", 1);
        map.put("minecraft:polished_blackstone_bricks", 1);
        map.put("minecraft:cracked_polished_blackstone_bricks", 1);
        map.put("minecraft:chiseled_polished_blackstone", 1);
        map.put("minecraft:magma_block", 1);

        // === PRISMARINE (2 XP) ===
        map.put("minecraft:prismarine", 2);
        map.put("minecraft:prismarine_bricks", 2);
        map.put("minecraft:dark_prismarine", 2);
        map.put("minecraft:sea_lantern", 2);

        // === END BLOCKS (2 XP) ===
        map.put("minecraft:end_stone", 2);
        map.put("minecraft:end_stone_bricks", 2);
        map.put("minecraft:purpur_block", 2);
        map.put("minecraft:purpur_pillar", 2);

        // === QUARTZ (2 XP) ===
        map.put("minecraft:quartz_block", 2);
        map.put("minecraft:chiseled_quartz_block", 2);
        map.put("minecraft:quartz_bricks", 2);
        map.put("minecraft:quartz_pillar", 2);
        map.put("minecraft:smooth_quartz", 2);

        // === COPPER BLOCKS (2 XP) ===
        map.put("minecraft:copper_block", 2);
        map.put("minecraft:exposed_copper", 2);
        map.put("minecraft:weathered_copper", 2);
        map.put("minecraft:oxidized_copper", 2);
        map.put("minecraft:cut_copper", 2);
        map.put("minecraft:exposed_cut_copper", 2);
        map.put("minecraft:weathered_cut_copper", 2);
        map.put("minecraft:oxidized_cut_copper", 2);
        map.put("minecraft:raw_copper_block", 2);
        map.put("minecraft:lightning_rod", 2);

        // === ORES - COMMON (2 XP) ===
        map.put("minecraft:coal_ore", 2);
        map.put("minecraft:deepslate_coal_ore", 2);
        map.put("minecraft:copper_ore", 2);
        map.put("minecraft:deepslate_copper_ore", 2);

        // === ORES - UNCOMMON (3 XP) ===
        map.put("minecraft:iron_ore", 3);
        map.put("minecraft:deepslate_iron_ore", 3);
        map.put("minecraft:raw_iron_block", 3);
        map.put("minecraft:redstone_ore", 3);
        map.put("minecraft:deepslate_redstone_ore", 3);
        map.put("minecraft:nether_quartz_ore", 3);

        // === ORES - RARE (4 XP) ===
        map.put("minecraft:gold_ore", 4);
        map.put("minecraft:deepslate_gold_ore", 4);
        map.put("minecraft:nether_gold_ore", 4);
        map.put("minecraft:raw_gold_block", 4);
        map.put("minecraft:lapis_ore", 4);
        map.put("minecraft:deepslate_lapis_ore", 4);

        // === ORES - PRECIOUS (10 XP) ===
        map.put("minecraft:diamond_ore", 10);
        map.put("minecraft:deepslate_diamond_ore", 10);
        map.put("minecraft:emerald_ore", 12);
        map.put("minecraft:deepslate_emerald_ore", 12);

        // === ORES - LEGENDARY (25 XP) ===
        map.put("minecraft:ancient_debris", 25);

        // === METAL BLOCKS ===
        map.put("minecraft:iron_block", 3);
        map.put("minecraft:gold_block", 4);
        map.put("minecraft:diamond_block", 10);
        map.put("minecraft:emerald_block", 12);
        map.put("minecraft:netherite_block", 25);
        map.put("minecraft:lapis_block", 4);
        map.put("minecraft:redstone_block", 3);
        map.put("minecraft:coal_block", 2);
        map.put("minecraft:amethyst_block", 3);
        map.put("minecraft:budding_amethyst", 5);

        // === OBSIDIAN (3 XP) ===
        map.put("minecraft:obsidian", 3);
        map.put("minecraft:crying_obsidian", 3);

        // === GLOWSTONE (2 XP) ===
        map.put("minecraft:glowstone", 2);
        map.put("minecraft:gilded_blackstone", 3);

        // === UTILITY BLOCKS ===
        map.put("minecraft:furnace", 2);
        map.put("minecraft:blast_furnace", 2);
        map.put("minecraft:smoker", 2);
        map.put("minecraft:stonecutter", 2);
        map.put("minecraft:grindstone", 2);
        map.put("minecraft:brewing_stand", 3);
        map.put("minecraft:cauldron", 2);
        map.put("minecraft:hopper", 3);
        map.put("minecraft:dispenser", 2);
        map.put("minecraft:dropper", 2);
        map.put("minecraft:observer", 2);
        map.put("minecraft:piston", 2);
        map.put("minecraft:sticky_piston", 2);
        map.put("minecraft:lodestone", 5);
        map.put("minecraft:respawn_anchor", 5);
        map.put("minecraft:enchanting_table", 5);
        map.put("minecraft:anvil", 3);
        map.put("minecraft:chipped_anvil", 3);
        map.put("minecraft:damaged_anvil", 3);
        map.put("minecraft:bell", 5);
        map.put("minecraft:conduit", 10);
        map.put("minecraft:beacon", 15);
        map.put("minecraft:ender_chest", 5);

        // === SPAWNER/SPECIAL ===
        map.put("minecraft:spawner", 10);
        map.put("minecraft:trial_spawner", 15);
        map.put("minecraft:vault", 20);
        map.put("minecraft:crafter", 3);
        map.put("minecraft:end_portal_frame", 50);

        // === SHOVEL BLOCKS (1 XP) ===
        map.put("minecraft:dirt", 1);
        map.put("minecraft:grass_block", 1);
        map.put("minecraft:sand", 1);
        map.put("minecraft:red_sand", 1);
        map.put("minecraft:gravel", 1);
        map.put("minecraft:clay", 1);
        map.put("minecraft:mud", 1);
        map.put("minecraft:packed_mud", 1);
        map.put("minecraft:soul_sand", 1);
        map.put("minecraft:soul_soil", 1);
        map.put("minecraft:mycelium", 1);
        map.put("minecraft:podzol", 1);
        map.put("minecraft:coarse_dirt", 1);
        map.put("minecraft:rooted_dirt", 1);
        map.put("minecraft:farmland", 1);
        map.put("minecraft:dirt_path", 1);
        map.put("minecraft:snow_block", 1);
        map.put("minecraft:snow", 1);
        map.put("minecraft:powder_snow", 1);
        map.put("minecraft:suspicious_sand", 2);
        map.put("minecraft:suspicious_gravel", 2);
        map.put("minecraft:concrete_powder", 1);

        // === AXE BLOCKS (1 XP) ===
        map.put("minecraft:oak_log", 1);
        map.put("minecraft:spruce_log", 1);
        map.put("minecraft:birch_log", 1);
        map.put("minecraft:jungle_log", 1);
        map.put("minecraft:acacia_log", 1);
        map.put("minecraft:dark_oak_log", 1);
        map.put("minecraft:mangrove_log", 1);
        map.put("minecraft:cherry_log", 1);
        map.put("minecraft:pale_oak_log", 1);
        map.put("minecraft:crimson_stem", 1);
        map.put("minecraft:warped_stem", 1);
        map.put("minecraft:bamboo_block", 1);
        map.put("minecraft:pumpkin", 1);
        map.put("minecraft:carved_pumpkin", 1);
        map.put("minecraft:melon", 1);
        map.put("minecraft:bookshelf", 2);
        map.put("minecraft:chiseled_bookshelf", 2);
        map.put("minecraft:chest", 1);
        map.put("minecraft:barrel", 1);
        map.put("minecraft:crafting_table", 1);
        map.put("minecraft:cartography_table", 1);
        map.put("minecraft:fletching_table", 1);
        map.put("minecraft:smithing_table", 1);
        map.put("minecraft:loom", 1);
        map.put("minecraft:composter", 1);
        map.put("minecraft:lectern", 2);
        map.put("minecraft:beehive", 2);
        map.put("minecraft:bee_nest", 2);
        map.put("minecraft:note_block", 1);
        map.put("minecraft:jukebox", 2);

        // === HOE BLOCKS ===
        map.put("minecraft:hay_block", 1);
        map.put("minecraft:dried_kelp_block", 1);
        map.put("minecraft:target", 1);
        map.put("minecraft:shroomlight", 2);
        map.put("minecraft:nether_wart_block", 1);
        map.put("minecraft:warped_wart_block", 1);
        map.put("minecraft:moss_block", 1);
        map.put("minecraft:sculk", 2);
        map.put("minecraft:sculk_catalyst", 5);
        map.put("minecraft:sculk_sensor", 3);
        map.put("minecraft:calibrated_sculk_sensor", 5);
        map.put("minecraft:sculk_shrieker", 5);
        map.put("minecraft:sculk_vein", 1);
        map.put("minecraft:sponge", 2);
        map.put("minecraft:wet_sponge", 2);
    }

    /**
     * Populates the default kill XP values matching the datapack's
     * enumerated list in config/soul_xp/kill_values.mcfunction.
     */
    private static void populateDefaultKillXp(Map<String, Integer> map) {
        // === COMMON OVERWORLD HOSTILES ===
        map.put("minecraft:zombie", 5);
        map.put("minecraft:skeleton", 5);
        map.put("minecraft:spider", 5);
        map.put("minecraft:creeper", 8);
        map.put("minecraft:witch", 8);
        map.put("minecraft:slime", 3);
        map.put("minecraft:phantom", 8);
        map.put("minecraft:drowned", 5);
        map.put("minecraft:husk", 5);
        map.put("minecraft:stray", 5);
        map.put("minecraft:cave_spider", 5);
        map.put("minecraft:silverfish", 2);
        map.put("minecraft:zombie_villager", 5);
        map.put("minecraft:enderman", 10);

        // === NETHER HOSTILES ===
        map.put("minecraft:blaze", 10);
        map.put("minecraft:ghast", 15);
        map.put("minecraft:magma_cube", 5);
        map.put("minecraft:piglin", 8);
        map.put("minecraft:piglin_brute", 15);
        map.put("minecraft:zombified_piglin", 5);
        map.put("minecraft:hoglin", 10);
        map.put("minecraft:zoglin", 10);
        map.put("minecraft:wither_skeleton", 15);
        map.put("minecraft:strider", 3);

        // === END MOBS ===
        map.put("minecraft:endermite", 5);
        map.put("minecraft:shulker", 15);

        // === DEEP DARK ===
        map.put("minecraft:warden", 50);

        // === ILLAGERS ===
        map.put("minecraft:pillager", 8);
        map.put("minecraft:vindicator", 10);
        map.put("minecraft:evoker", 15);
        map.put("minecraft:ravager", 20);
        map.put("minecraft:vex", 5);
        map.put("minecraft:illusioner", 15);

        // === GUARDIANS ===
        map.put("minecraft:guardian", 10);
        map.put("minecraft:elder_guardian", 25);

        // === BOSSES ===
        map.put("minecraft:wither", 200);
        map.put("minecraft:ender_dragon", 500);

        // === TRIAL CHAMBER ===
        map.put("minecraft:breeze", 10);
        map.put("minecraft:bogged", 8);

        // === PALE GARDEN ===
        map.put("minecraft:creaking", 10);

        // === PASSIVE MOBS ===
        map.put("minecraft:pig", 1);
        map.put("minecraft:cow", 1);
        map.put("minecraft:sheep", 1);
        map.put("minecraft:chicken", 1);
        map.put("minecraft:rabbit", 1);
        map.put("minecraft:wolf", 3);
        map.put("minecraft:fox", 2);
        map.put("minecraft:bee", 2);
        map.put("minecraft:goat", 2);
        map.put("minecraft:frog", 1);
        map.put("minecraft:camel", 2);
        map.put("minecraft:sniffer", 2);
        map.put("minecraft:armadillo", 1);
    }

    // ========================================
    // PERSISTENCE (TOML)
    // ========================================

    private static Map<String, Integer> parseMap(List<Object> list) {
        Map<String, Integer> map = new HashMap<>();
        if (list != null) {
            for (Object item : list) {
                if (item != null) {
                    String s = item.toString();
                    String[] parts = s.split("=", 2);
                    if (parts.length == 2) {
                        try {
                            map.put(parts[0].trim(), Integer.parseInt(parts[1].trim()));
                        } catch (NumberFormatException ignored) {}
                    }
                }
            }
        }
        return map;
    }

    public static void save() {
        try {
            Files.createDirectories(CONFIG_PATH.getParent());
            RitualsConfig c = INSTANCE != null ? INSTANCE : new RitualsConfig();

            StringBuilder toml = new StringBuilder();
            toml.append("# ========================================\n");
            toml.append("# Rituals Configuration\n");
            toml.append("# ========================================\n");
            toml.append("# Edit this file or use ModMenu in-game.\n");
            toml.append("# Block/Kill XP entries are the ENUMERATED LISTS.\n");
            toml.append("# Format: \"namespace:id=xp_value\"\n");
            toml.append("# Blocks/mobs NOT in these lists give 0 Soul XP.\n");
            toml.append("# Add modded entries here for custom mod support!\n\n");

            toml.append("[general]\n");
            toml.append("debugMode = ").append(c.debugMode).append("\n");
            toml.append("kiwiMode = ").append(c.kiwiMode).append("\n");
            toml.append("requireFireSacrifice = ").append(c.requireFireSacrifice).append("\n\n");

            toml.append("[levelCurve]\n");
            toml.append("# Formula: XP_needed = (level * levelBase) + (level^2 * levelScaling)\n");
            toml.append("levelBase = ").append(c.levelBase).append("\n");
            toml.append("levelScaling = ").append(c.levelScaling).append("\n\n");

            toml.append("[blockXp]\n");
            toml.append("# XP granted when mining blocks with a soul weapon.\n");
            toml.append("# Format: \"minecraft:stone=1\" means stone gives 1 XP.\n");
            toml.append("# Add modded blocks: \"mymod:cool_ore=5\"\n");
            toml.append("entries = ").append(formatMapList(c.blockXpValues)).append("\n\n");

            toml.append("[killXp]\n");
            toml.append("# XP granted when killing mobs with a soul weapon.\n");
            toml.append("# Format: \"minecraft:zombie=5\" means zombie gives 5 XP.\n");
            toml.append("# Add modded mobs: \"mymod:custom_boss=100\"\n");
            toml.append("entries = ").append(formatMapList(c.killXpValues)).append("\n");

            Files.writeString(CONFIG_PATH, toml.toString());
            RitualsMod.LOGGER.info("Saved config to {}", CONFIG_PATH);
        } catch (IOException e) {
            RitualsMod.LOGGER.error("Failed to save config", e);
        }
    }

    private static String formatMapList(Map<String, Integer> map) {
        if (map == null || map.isEmpty()) {
            return "[]";
        }
        List<String> entries = new ArrayList<>();
        for (Map.Entry<String, Integer> e : map.entrySet()) {
            entries.add("\"" + e.getKey() + "=" + e.getValue() + "\"");
        }
        entries.sort(String::compareTo);

        // Multi-line format for readability
        StringBuilder sb = new StringBuilder("[\n");
        for (int i = 0; i < entries.size(); i++) {
            sb.append("    ").append(entries.get(i));
            if (i < entries.size() - 1) {
                sb.append(",");
            }
            sb.append("\n");
        }
        sb.append("]");
        return sb.toString();
    }
}
