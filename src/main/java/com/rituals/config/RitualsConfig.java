package com.rituals.config;

import com.rituals.RitualsMod;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import net.fabricmc.loader.api.FabricLoader;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.Map;

/**
 * Configuration management for Rituals mod
 * Saves to config/rituals.json
 */
public class RitualsConfig {
    private static final Gson GSON = new GsonBuilder().setPrettyPrinting().create();
    private static final Path CONFIG_FILE = FabricLoader.getInstance().getConfigDir().resolve("rituals.json");
    
    // Ritual items configuration
    public static String growthItem = "minecraft:emerald";
    public static String strengthItem = "minecraft:diamond";
    public static String prosperityItem = "minecraft:netherite_block";
    public static String protectionItem = "minecraft:iron_ingot";
    public static String healingItem = "minecraft:nether_star";
    public static String sentryItem = "minecraft:arrow";
    public static String autoFarmingItem = "minecraft:diamond_hoe";
    public static String autoBreedingItem = "minecraft:wheat";
    
    private static boolean kiwiMode = false;
    private static boolean debugMode = false;
    private static boolean requireFireSacrifice = true;
    
    public static void load() {
        if (Files.exists(CONFIG_FILE)) {
            try (Reader reader = Files.newBufferedReader(CONFIG_FILE)) {
                ConfigData data = GSON.fromJson(reader, ConfigData.class);
                if (data != null) {
                    growthItem = data.ritualItems.getOrDefault("growth", growthItem);
                    strengthItem = data.ritualItems.getOrDefault("strength", strengthItem);
                    prosperityItem = data.ritualItems.getOrDefault("prosperity", prosperityItem);
                    protectionItem = data.ritualItems.getOrDefault("protection", protectionItem);
                    healingItem = data.ritualItems.getOrDefault("healing", healingItem);
                    sentryItem = data.ritualItems.getOrDefault("sentry", sentryItem);
                    autoFarmingItem = data.patternItems.getOrDefault("auto_farming", autoFarmingItem);
                    autoBreedingItem = data.patternItems.getOrDefault("auto_breeding", autoBreedingItem);
                    RitualsMod.LOGGER.info("Loaded config from {}", CONFIG_FILE);
                }
            } catch (Exception e) {
                RitualsMod.LOGGER.error("Failed to load config", e);
            }
        } else {
            save(); // Create default config
        }
    }
    
    public static void save() {
        try {
            Files.createDirectories(CONFIG_FILE.getParent());
            ConfigData data = new ConfigData();
            data.ritualItems.put("growth", growthItem);
            data.ritualItems.put("strength", strengthItem);
            data.ritualItems.put("prosperity", prosperityItem);
            data.ritualItems.put("protection", protectionItem);
            data.ritualItems.put("healing", healingItem);
            data.ritualItems.put("sentry", sentryItem);
            data.patternItems.put("auto_farming", autoFarmingItem);
            data.patternItems.put("auto_breeding", autoBreedingItem);
            
            try (Writer writer = Files.newBufferedWriter(CONFIG_FILE)) {
                GSON.toJson(data, writer);
                RitualsMod.LOGGER.info("Saved config to {}", CONFIG_FILE);
            }
        } catch (Exception e) {
            RitualsMod.LOGGER.error("Failed to save config", e);
        }
    }
    
    public static boolean isKiwiMode() {
        return kiwiMode;
    }
    
    public static void setKiwiMode(boolean enabled) {
        kiwiMode = enabled;
        if (enabled) {
            requireFireSacrifice = false;
        }
        RitualsMod.LOGGER.info("Kiwi Mode: {}", enabled);
    }
    
    public static boolean isDebugMode() {
        return debugMode;
    }
    
    public static void setDebugMode(boolean enabled) {
        debugMode = enabled;
        RitualsMod.LOGGER.info("Debug Mode: {}", enabled);
    }
    
    public static boolean requiresFireSacrifice() {
        return requireFireSacrifice;
    }
    
    public static void setRequireFireSacrifice(boolean required) {
        requireFireSacrifice = required;
        RitualsMod.LOGGER.info("Fire Sacrifice Required: {}", required);
    }
    
    public static void reload() {
        load();
    }
    
    private static class ConfigData {
        Map<String, String> ritualItems = new HashMap<>();
        Map<String, String> patternItems = new HashMap<>();
    }
}

