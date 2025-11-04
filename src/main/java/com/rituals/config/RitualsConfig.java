package com.rituals.config;

import com.rituals.RitualsMod;

/**
 * Configuration management for Rituals mod
 */
public class RitualsConfig {
    private static boolean kiwiMode = false;
    private static boolean debugMode = false;
    private static boolean requireFireSacrifice = true;
    
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
        // Reload config from storage if needed
        RitualsMod.LOGGER.info("Config reloaded");
    }
}

