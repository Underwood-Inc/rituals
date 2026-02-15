package com.rituals.config;

import com.rituals.RitualsMod;
import com.rituals.soul.SoulXpTracker;
import me.shedaniel.clothconfig2.api.ConfigBuilder;
import me.shedaniel.clothconfig2.api.ConfigCategory;
import me.shedaniel.clothconfig2.api.ConfigEntryBuilder;
import net.minecraft.client.MinecraftClient;
import net.minecraft.client.gui.screen.Screen;
import net.minecraft.server.MinecraftServer;
import net.minecraft.text.Text;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Cloth Config-based config screen for Rituals.
 * Only loaded if Cloth Config is available.
 */
public class RitualsClothConfigScreen {
    
    private static List<String> mapToList(Map<String, Integer> map) {
        return map.entrySet().stream()
                .map(e -> e.getKey() + "=" + e.getValue())
                .sorted()
                .collect(Collectors.toList());
    }
    
    /**
     * Create the config screen.
     * This method is called via reflection/try-catch to handle missing Cloth Config.
     */
    public static Screen create(Screen parent) {
        RitualsConfig config = RitualsConfig.get();
        
        ConfigBuilder builder = ConfigBuilder.create()
                .setParentScreen(parent)
                .setTitle(Text.literal("Rituals Configuration"));
        
        builder.setSavingRunnable(() -> {
            RitualsConfig.save();
            // Push updated values to datapack scoreboards immediately
            // (singleplayer: integrated server available; dedicated: null, requires /rituals config reload)
            MinecraftServer server = MinecraftClient.getInstance().getServer();
            if (server != null) {
                SoulXpTracker.repushConfig(server);
                RitualsMod.LOGGER.info("Config saved from ModMenu — values pushed to scoreboards immediately");
            } else {
                RitualsMod.LOGGER.info("Config saved from ModMenu — run /rituals config reload on the server to apply");
            }
        });
        
        ConfigEntryBuilder entryBuilder = builder.entryBuilder();
        
        // === GENERAL CATEGORY ===
        ConfigCategory general = builder.getOrCreateCategory(Text.literal("General"));
        
        general.addEntry(entryBuilder.startBooleanToggle(
                Text.literal("Debug Mode"),
                config.debugMode)
                .setDefaultValue(false)
                .setTooltip(Text.literal("Enable debug output for troubleshooting."))
                .setSaveConsumer(val -> config.debugMode = val)
                .build());
        
        general.addEntry(entryBuilder.startBooleanToggle(
                Text.literal("Kiwi Mode"),
                config.kiwiMode)
                .setDefaultValue(false)
                .setTooltip(Text.literal("Skip fire sacrifice requirement for rituals."))
                .setSaveConsumer(val -> config.kiwiMode = val)
                .build());
        
        // === LEVEL CURVE CATEGORY ===
        ConfigCategory levelCurve = builder.getOrCreateCategory(Text.literal("Level Curve"));
        
        levelCurve.addEntry(entryBuilder.startIntSlider(
                Text.literal("Level Base"),
                config.levelBase,
                50,
                500)
                .setDefaultValue(100)
                .setTooltip(Text.literal("Base XP required for leveling (50-500)."))
                .setSaveConsumer(val -> config.levelBase = val)
                .build());
        
        levelCurve.addEntry(entryBuilder.startIntSlider(
                Text.literal("Level Scaling"),
                config.levelScaling,
                10,
                100)
                .setDefaultValue(25)
                .setTooltip(Text.literal("XP scaling per level (10-100)."))
                .setSaveConsumer(val -> config.levelScaling = val)
                .build());
        
        // === BLOCK XP CATEGORY ===
        ConfigCategory blockXp = builder.getOrCreateCategory(Text.literal("Block XP"));
        
        blockXp.addEntry(entryBuilder.startStrList(
                Text.literal("Block XP Values"),
                mapToList(config.blockXpValues))
                .setDefaultValue(new ArrayList<>())
                .setTooltip(Text.literal("XP granted per block mined. Format: minecraft:stone=1"))
                .setInsertButtonEnabled(true)
                .setDeleteButtonEnabled(true)
                .setSaveConsumer(val -> {
                    config.blockXpValues.clear();
                    for (String entry : val) {
                        String[] parts = entry.split("=", 2);
                        if (parts.length == 2) {
                            try {
                                config.blockXpValues.put(parts[0].trim(), Integer.parseInt(parts[1].trim()));
                            } catch (NumberFormatException ignored) {}
                        }
                    }
                })
                .build());
        
        // === KILL XP CATEGORY ===
        ConfigCategory killXp = builder.getOrCreateCategory(Text.literal("Kill XP"));
        
        killXp.addEntry(entryBuilder.startStrList(
                Text.literal("Kill XP Values"),
                mapToList(config.killXpValues))
                .setDefaultValue(new ArrayList<>())
                .setTooltip(Text.literal("XP granted per mob kill. Format: minecraft:zombie=5"))
                .setInsertButtonEnabled(true)
                .setDeleteButtonEnabled(true)
                .setSaveConsumer(val -> {
                    config.killXpValues.clear();
                    for (String entry : val) {
                        String[] parts = entry.split("=", 2);
                        if (parts.length == 2) {
                            try {
                                config.killXpValues.put(parts[0].trim(), Integer.parseInt(parts[1].trim()));
                            } catch (NumberFormatException ignored) {}
                        }
                    }
                })
                .build());
        
        return builder.build();
    }
}
