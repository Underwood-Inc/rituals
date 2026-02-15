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
 * integration. The time-based soul XP settings and offhand rate multipliers
 * here are pushed to {@code rituals:config} storage and the
 * {@code rituals.config} scoreboard by {@link com.rituals.soul.SoulXpTracker},
 * overriding the datapack defaults.</p>
 *
 * <h3>Soul XP System</h3>
 * <p>The soul grows through observation and existence. Having a soul weapon
 * in the hotbar lets the soul passively accumulate XP. Offhand items act as
 * catalysts that modify the growth rate.</p>
 *
 * <h3>XP Rate Presets</h3>
 * <ul>
 *   <li><b>Easy</b> — 200 ticks (10 seconds) per cycle</li>
 *   <li><b>Medium</b> — 400 ticks (20 seconds) per cycle</li>
 *   <li><b>Hard</b> — 600 ticks (30 seconds) per cycle (default)</li>
 *   <li><b>Custom</b> — user-specified interval in ticks</li>
 * </ul>
 *
 * <p>If no TOML file exists, reasonable defaults are generated automatically.</p>
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

    // === PASSIVE SOUL XP ===
    /** Base XP gained per award cycle. */
    public int soulXpBaseRate = 1;

    /** XP rate preset (easy/medium/hard/custom). */
    public SoulXpRate soulXpRate = SoulXpRate.HARD;

    /** Custom tick interval, only used when {@link #soulXpRate} is CUSTOM. */
    public int soulXpCustomInterval = 600;

    /** Log a 1-per-second countdown to next XP award in chat (debug tool). */
    public boolean soulXpCountdown = false;

    // === OFFHAND RATE MODIFIERS ===
    // Key: namespaced item ID (e.g. "minecraft:soul_sand"), Value: rate percentage (100 = 1.0x)
    // These are pushed to the rituals.config scoreboard by SoulXpTracker
    public Map<String, Integer> offhandRates = new HashMap<>();

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

    /**
     * Returns the resolved tick interval based on the current rate preset.
     * For EASY/MEDIUM/HARD, returns the preset's fixed ticks.
     * For CUSTOM, returns {@link #soulXpCustomInterval}.
     *
     * @return tick interval between XP awards
     */
    public int getResolvedInterval() {
        if (soulXpRate == SoulXpRate.CUSTOM) {
            return soulXpCustomInterval;
        }
        return soulXpRate.ticks;
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

                // Soul XP passive settings
                INSTANCE.soulXpBaseRate = toml.getLong("soulXp.baseRate", 1L).intValue();
                INSTANCE.soulXpRate = SoulXpRate.fromString(toml.getString("soulXp.rate", "hard"));
                INSTANCE.soulXpCustomInterval = toml.getLong("soulXp.customInterval", 600L).intValue();
                INSTANCE.soulXpCountdown = toml.getBoolean("soulXp.countdown", false);

                // Offhand rate modifiers
                INSTANCE.offhandRates = parseMap(toml.getList("offhandRates.entries"));

                // If TOML had empty offhand list, populate with defaults
                if (INSTANCE.offhandRates.isEmpty()) {
                    populateDefaultOffhandRates(INSTANCE.offhandRates);
                }

                RitualsMod.LOGGER.info("Loaded config from {} (rate={})", CONFIG_PATH, INSTANCE.soulXpRate.name());
            } catch (Exception e) {
                RitualsMod.LOGGER.error("Failed to load config, using defaults", e);
                INSTANCE = new RitualsConfig();
                populateDefaultOffhandRates(INSTANCE.offhandRates);
            }
        } else {
            INSTANCE = new RitualsConfig();
            populateDefaultOffhandRates(INSTANCE.offhandRates);
            save();
            RitualsMod.LOGGER.info("Created default config at {}", CONFIG_PATH);
        }
    }

    /**
     * Get the offhand rate multiplier for a given item.
     *
     * @param itemId Registry ID (e.g. "minecraft:soul_sand")
     * @return rate percentage (100 = 1.0x), or 100 if not configured
     */
    public int getOffhandRate(String itemId) {
        return offhandRates.getOrDefault(itemId, 100);
    }

    // ========================================
    // DEFAULT OFFHAND RATES
    // ========================================
    // These match the datapack's offhand_rates.mcfunction defaults.
    // When the Java mod is present, SoulXpTracker pushes these to the
    // rituals.config scoreboard, overriding the datapack defaults.

    /**
     * Populates the default offhand rate multipliers.
     * Values are percentages: 100 = 1.0x, 150 = 1.5x, 200 = 2.0x
     *
     * @param map target map to populate
     */
    static void populateDefaultOffhandRates(Map<String, Integer> map) {
        // Soul-themed items
        map.put("minecraft:soul_sand", 150);
        map.put("minecraft:soul_soil", 150);

        // Mystical items
        map.put("minecraft:amethyst_shard", 175);
        map.put("minecraft:ender_pearl", 200);
        map.put("minecraft:ender_eye", 225);

        // High-value catalysts
        map.put("minecraft:experience_bottle", 250);
        map.put("minecraft:nether_star", 500);

        RitualsMod.LOGGER.info("Loaded {} default offhand rate modifiers", map.size());
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
            toml.append("# The soul gains XP passively while in your hotbar.\n");
            toml.append("# Offhand items act as catalysts that modify the growth rate.\n\n");

            toml.append("[general]\n");
            toml.append("debugMode = ").append(c.debugMode).append("\n");
            toml.append("kiwiMode = ").append(c.kiwiMode).append("\n");
            toml.append("requireFireSacrifice = ").append(c.requireFireSacrifice).append("\n\n");

            toml.append("[levelCurve]\n");
            toml.append("# Formula: XP_needed = (level * levelBase) + (level^2 * levelScaling)\n");
            toml.append("levelBase = ").append(c.levelBase).append("\n");
            toml.append("levelScaling = ").append(c.levelScaling).append("\n\n");

            toml.append("[soulXp]\n");
            toml.append("# The soul grows through observation and existence.\n");
            toml.append("# XP rate preset (case-insensitive):\n");
            toml.append("# trivial(10s) easy(30s) moderate(1m) standard(2m) hard(3m) tough(5m)\n");
            toml.append("# grueling(8m) brutal(10m) punishing(15m) extreme(20m) insane(30m)\n");
            toml.append("# nightmare(45m) impossible(60m) custom(set customInterval below)\n");
            toml.append("rate = \"").append(c.soulXpRate.name().toLowerCase()).append("\"\n");
            toml.append("# Base XP gained per award cycle\n");
            toml.append("baseRate = ").append(c.soulXpBaseRate).append("\n");
            toml.append("# Only used when rate = \"custom\". Ticks between XP awards (20 = 1 second).\n");
            toml.append("customInterval = ").append(c.soulXpCustomInterval).append("\n");
            toml.append("# Show a 1/second countdown in chat until next XP award (debug tool)\n");
            toml.append("countdown = ").append(c.soulXpCountdown).append("\n\n");

            toml.append("[offhandRates]\n");
            toml.append("# Holding certain items in your offhand influences the soul's growth rate.\n");
            toml.append("# Values are percentages: 100 = normal, 150 = 1.5x, 200 = 2x\n");
            toml.append("# Format: \"minecraft:item_id=rate_percent\"\n");
            toml.append("entries = ").append(formatMapList(c.offhandRates)).append("\n");

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
