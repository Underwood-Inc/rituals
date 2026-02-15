package com.rituals.config;

import com.rituals.RitualsMod;
import com.moandjiezana.toml.Toml;
import net.fabricmc.loader.api.FabricLoader;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
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
    // Defaults are parsed directly from the datapack's .mcfunction config files
    // bundled in the JAR at /data/rituals/function/config/soul_xp/*.
    // This ensures Java defaults always match the datapack exactly --
    // single source of truth, zero drift.
    //
    // When the Java mod is present, SoulXpTracker pushes these to the
    // rituals.config scoreboard, overriding the datapack defaults.

    /** Datapack config files that define block XP values. */
    private static final String[] BLOCK_XP_RESOURCES = {
            "/data/rituals/function/config/soul_xp/pickaxe_blocks.mcfunction",
            "/data/rituals/function/config/soul_xp/shovel_blocks.mcfunction",
            "/data/rituals/function/config/soul_xp/axe_blocks.mcfunction",
            "/data/rituals/function/config/soul_xp/hoe_blocks.mcfunction"
    };

    /** Datapack config file that defines kill XP values. */
    private static final String KILL_XP_RESOURCE =
            "/data/rituals/function/config/soul_xp/kill_values.mcfunction";

    /**
     * Populates the default block XP values by parsing the datapack's
     * config/soul_xp/*.mcfunction files from the JAR resources.
     *
     * <p>Each line like {@code scoreboard players set #xp_stone rituals.config 1}
     * becomes {@code minecraft:stone -> 1} in the map.</p>
     */
    static void populateDefaultBlockXp(Map<String, Integer> map) {
        for (String resource : BLOCK_XP_RESOURCES) {
            parseDatapackConfig(resource, "xp_", map);
        }
        if (map.isEmpty()) {
            RitualsMod.LOGGER.warn("No block XP defaults parsed from datapack resources!");
        } else {
            RitualsMod.LOGGER.info("Parsed {} block XP defaults from datapack resources", map.size());
        }
    }

    /**
     * Populates the default kill XP values by parsing the datapack's
     * config/soul_xp/kill_values.mcfunction from the JAR resources.
     *
     * <p>Each line like {@code scoreboard players set #kxp_zombie rituals.config 5}
     * becomes {@code minecraft:zombie -> 5} in the map.</p>
     */
    static void populateDefaultKillXp(Map<String, Integer> map) {
        parseDatapackConfig(KILL_XP_RESOURCE, "kxp_", map);
        if (map.isEmpty()) {
            RitualsMod.LOGGER.warn("No kill XP defaults parsed from datapack resources!");
        } else {
            RitualsMod.LOGGER.info("Parsed {} kill XP defaults from datapack resources", map.size());
        }
    }

    /**
     * Parses a datapack .mcfunction config file from JAR resources.
     *
     * <p>Looks for lines matching:
     * {@code scoreboard players set #<prefix><name> rituals.config <value>}
     * and converts them to {@code minecraft:<name> -> <value>} entries.</p>
     *
     * @param resourcePath path to the .mcfunction file in the JAR
     * @param prefix       score name prefix ("xp_" for blocks, "kxp_" for kills)
     * @param map          target map to populate
     */
    private static void parseDatapackConfig(String resourcePath, String prefix, Map<String, Integer> map) {
        try (InputStream is = RitualsConfig.class.getResourceAsStream(resourcePath)) {
            if (is == null) {
                RitualsMod.LOGGER.warn("Datapack config resource not found: {}", resourcePath);
                return;
            }
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(is))) {
                String line;
                String expectedStart = "scoreboard players set #" + prefix;
                while ((line = reader.readLine()) != null) {
                    line = line.trim();
                    if (!line.startsWith(expectedStart)) {
                        continue;
                    }
                    // Format: scoreboard players set #xp_stone rituals.config 1
                    //         [0]        [1]     [2] [3]      [4]             [5]
                    String[] parts = line.split("\\s+");
                    if (parts.length < 6) {
                        continue;
                    }
                    // parts[3] = "#xp_stone" -> strip "#" and prefix -> "stone"
                    String scoreName = parts[3].substring(1); // remove #
                    if (!scoreName.startsWith(prefix)) {
                        continue;
                    }
                    String blockName = scoreName.substring(prefix.length());
                    String id = "minecraft:" + blockName;
                    try {
                        int value = Integer.parseInt(parts[5]);
                        map.put(id, value);
                    } catch (NumberFormatException ignored) {
                        // Skip malformed lines
                    }
                }
            }
        } catch (IOException e) {
            RitualsMod.LOGGER.error("Failed to parse datapack config: {}", resourcePath, e);
        }
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
            toml.append("# NOTE: Adding new entries here only changes the config value.\n");
            toml.append("# New blocks/mobs also need datapack scoreboard + tracking changes.\n\n");

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
            toml.append("# Only change values for existing entries. New blocks need datapack updates.\n");
            toml.append("entries = ").append(formatMapList(c.blockXpValues)).append("\n\n");

            toml.append("[killXp]\n");
            toml.append("# XP granted when killing mobs with a soul weapon.\n");
            toml.append("# Format: \"minecraft:zombie=5\" means zombie gives 5 XP.\n");
            toml.append("# Only change values for existing entries. New mobs need datapack updates.\n");
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
