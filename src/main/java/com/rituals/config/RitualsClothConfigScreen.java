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
 * <p>Block and Kill XP entries are shown as individual integer fields,
 * one per block/mob. This makes Cloth Config's built-in search bar
 * functional (it filters entries by name, so searching "diamond" will
 * find "minecraft:diamond_ore"). Users can only CHANGE values, not
 * add or remove entries -- that requires datapack changes.</p>
 */
public class RitualsClothConfigScreen {

    /**
     * Create the config screen.
     * This method is called via reflection/try-catch to handle missing Cloth Config.
     */
    public static Screen create(Screen parent) {
        RitualsConfig config = RitualsConfig.get();

        // Capture default maps for setDefaultValue() on each entry
        Map<String, Integer> defaultBlockXp = new HashMap<>();
        RitualsConfig.populateDefaultBlockXp(defaultBlockXp);
        Map<String, Integer> defaultKillXp = new HashMap<>();
        RitualsConfig.populateDefaultKillXp(defaultKillXp);

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

        // === BLOCK XP CATEGORY ===
        // Each block gets its own integer field. Search bar works on entry names.
        // Users can change values but NOT add/remove blocks (requires datapack changes).
        ConfigCategory blockXp = builder.getOrCreateCategory(Text.literal("Block XP"));

        blockXp.addEntry(entryBuilder.startTextDescription(
                Text.literal("§7XP granted per block mined with a soul weapon.\n"
                        + "§7Use the search bar above to find specific blocks.\n"
                        + "§7Adding new blocks requires datapack changes."))
                .build());

        for (Map.Entry<String, Integer> entry : config.blockXpValues.entrySet().stream()
                .sorted(Map.Entry.comparingByKey())
                .collect(Collectors.toList())) {
            String blockId = entry.getKey();
            int currentValue = entry.getValue();
            int defaultValue = defaultBlockXp.getOrDefault(blockId, 0);

            blockXp.addEntry(entryBuilder.startIntField(
                    Text.literal(blockId),
                    currentValue)
                    .setDefaultValue(defaultValue)
                    .setMin(0)
                    .setMax(1000)
                    .setTooltip(Text.literal("XP per " + blockId.replace("minecraft:", "") + " mined"))
                    .setSaveConsumer(val -> config.blockXpValues.put(blockId, val))
                    .build());
        }

        // === KILL XP CATEGORY ===
        // Same approach: one integer field per mob.
        ConfigCategory killXp = builder.getOrCreateCategory(Text.literal("Kill XP"));

        killXp.addEntry(entryBuilder.startTextDescription(
                Text.literal("§7XP granted per mob killed with a soul weapon.\n"
                        + "§7Use the search bar above to find specific mobs.\n"
                        + "§7Adding new mobs requires datapack changes."))
                .build());

        for (Map.Entry<String, Integer> entry : config.killXpValues.entrySet().stream()
                .sorted(Map.Entry.comparingByKey())
                .collect(Collectors.toList())) {
            String mobId = entry.getKey();
            int currentValue = entry.getValue();
            int defaultValue = defaultKillXp.getOrDefault(mobId, 0);

            killXp.addEntry(entryBuilder.startIntField(
                    Text.literal(mobId),
                    currentValue)
                    .setDefaultValue(defaultValue)
                    .setMin(0)
                    .setMax(10000)
                    .setTooltip(Text.literal("XP per " + mobId.replace("minecraft:", "") + " killed"))
                    .setSaveConsumer(val -> config.killXpValues.put(mobId, val))
                    .build());
        }

        return builder.build();
    }
}
