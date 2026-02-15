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

import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Cloth Config-based config screen for Rituals.
 * Only loaded if Cloth Config is available.
 *
 * <p>Soul XP is now time-based and passive. The soul grows through
 * observation and existence while in the player's hotbar. Offhand
 * items act as catalysts that modify the growth rate.</p>
 *
 * <p>XP rate presets (Easy/Medium/Hard/Custom) control how frequently
 * XP is awarded. Custom mode allows fine-grained tick interval control.</p>
 *
 * <p>Offhand rate entries are shown as individual integer fields,
 * one per item. This makes Cloth Config's built-in search bar
 * functional. Users can only CHANGE rate values, not add or remove
 * catalyst items -- that requires datapack changes.</p>
 */
public class RitualsClothConfigScreen {

    /**
     * Create the config screen.
     * This method is called via reflection/try-catch to handle missing Cloth Config.
     */
    public static Screen create(Screen parent) {
        RitualsConfig config = RitualsConfig.get();

        // Capture default offhand rates for setDefaultValue() on each entry
        Map<String, Integer> defaultOffhandRates = new HashMap<>();
        RitualsConfig.populateDefaultOffhandRates(defaultOffhandRates);

        ConfigBuilder builder = ConfigBuilder.create()
                .setParentScreen(parent)
                .setTitle(Text.literal("Rituals Configuration"));

        builder.setSavingRunnable(() -> {
            RitualsConfig.save();
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

        // === SOUL XP CATEGORY ===
        // Time-based passive XP accrual settings with rate presets.
        ConfigCategory soulXp = builder.getOrCreateCategory(Text.literal("Soul XP"));

        // Dynamic description showing current rate in human-readable form
        int resolvedInterval = config.getResolvedInterval();
        String timeStr = SoulXpRate.formatTicks(resolvedInterval);
        // Calculate time-to-max for display
        long cyclesToMax = 57683L / Math.max(1, config.soulXpBaseRate);
        long secondsToMax = cyclesToMax * (resolvedInterval / 20);
        long hoursToMax = secondsToMax / 3600;

        soulXp.addEntry(entryBuilder.startTextDescription(
                Text.literal("§7The soul grows through observation and existence.\n"
                        + "§7Keep a soul weapon in your hotbar to passively gain XP.\n"
                        + "§7Offhand catalysts multiply the rate (Nether Star = 5x).\n"
                        + "\n"
                        + "§fCurrent rate: §a" + config.soulXpBaseRate + " XP every " + timeStr
                        + " §7(" + config.soulXpRate.name() + ")\n"
                        + "§fTime to max level (Lv 100): §e~" + hoursToMax + " hours §7(no catalyst)"))
                .build());

        // Rate preset selector (enum dropdown)
        soulXp.addEntry(entryBuilder.startEnumSelector(
                Text.literal("XP Rate"),
                SoulXpRate.class,
                config.soulXpRate)
                .setDefaultValue(SoulXpRate.HARD)
                .setTooltip(Text.literal("13 presets from 10s to 60m. Default: Hard (3m).\nSet to Custom to use your own tick interval."))
                .setSaveConsumer(val -> config.soulXpRate = val)
                .build());

        // Base rate
        soulXp.addEntry(entryBuilder.startIntField(
                Text.literal("Base Rate"),
                config.soulXpBaseRate)
                .setDefaultValue(1)
                .setMin(1)
                .setMax(100)
                .setTooltip(Text.literal("Base XP gained per award cycle (1-100)."))
                .setSaveConsumer(val -> config.soulXpBaseRate = val)
                .build());

        // Custom interval (only meaningful when rate = CUSTOM)
        soulXp.addEntry(entryBuilder.startIntField(
                Text.literal("Custom Interval (ticks)"),
                config.soulXpCustomInterval)
                .setDefaultValue(600)
                .setMin(20)
                .setMax(72000)
                .setTooltip(Text.literal("Only used when XP Rate is set to Custom.\n"
                        + "Ticks between XP awards. 20 = 1 second, 1200 = 1 minute.\n"
                        + "Current: " + SoulXpRate.formatTicks(config.soulXpCustomInterval)))
                .setSaveConsumer(val -> config.soulXpCustomInterval = val)
                .build());

        // XP countdown debug toggle
        soulXp.addEntry(entryBuilder.startBooleanToggle(
                Text.literal("XP Countdown Log"),
                config.soulXpCountdown)
                .setDefaultValue(false)
                .setTooltip(Text.literal("Show a 1/second countdown in chat until next XP award.\nUseful for debugging whether passive XP is working."))
                .setSaveConsumer(val -> config.soulXpCountdown = val)
                .build());

        // === OFFHAND RATES CATEGORY ===
        // Each catalyst item gets its own integer field.
        ConfigCategory offhandRates = builder.getOrCreateCategory(Text.literal("Offhand Catalysts"));

        offhandRates.addEntry(entryBuilder.startTextDescription(
                Text.literal("§7Holding certain items in your offhand influences\n"
                        + "§7the soul's growth rate. Values are percentages:\n"
                        + "§7100 = normal, 150 = 1.5x, 200 = 2x, 500 = 5x"))
                .build());

        for (Map.Entry<String, Integer> entry : config.offhandRates.entrySet().stream()
                .sorted(Map.Entry.comparingByKey())
                .collect(Collectors.toList())) {
            String itemId = entry.getKey();
            int currentValue = entry.getValue();
            int defaultValue = defaultOffhandRates.getOrDefault(itemId, 100);

            offhandRates.addEntry(entryBuilder.startIntField(
                    Text.literal(itemId),
                    currentValue)
                    .setDefaultValue(defaultValue)
                    .setMin(100)
                    .setMax(10000)
                    .setTooltip(Text.literal("Rate modifier for " + itemId.replace("minecraft:", "") + " (%)"))
                    .setSaveConsumer(val -> config.offhandRates.put(itemId, val))
                    .build());
        }

        return builder.build();
    }
}
