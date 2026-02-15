package com.rituals.soul;

import com.rituals.RitualsMod;
import com.rituals.config.RitualsConfig;
import com.rituals.config.SoulXpRate;

import net.fabricmc.fabric.api.event.lifecycle.v1.ServerLifecycleEvents;
import net.minecraft.server.MinecraftServer;

import java.util.HashMap;
import java.util.Map;

/**
 * Soul XP Config Pusher.
 *
 * <p>Pushes TOML config values to the datapack's {@code rituals:config} storage
 * and {@code rituals.config} scoreboard, overriding the datapack defaults.
 * This allows ModMenu edits to take effect seamlessly.</p>
 *
 * <h3>What this class pushes:</h3>
 * <ol>
 *   <li>{@code soul_xp_base_rate} and {@code soul_xp_interval} (resolved from
 *       the rate preset) to {@code rituals:config} storage.</li>
 *   <li>{@code soul_level_base} and {@code soul_level_scaling} to
 *       {@code rituals:config} storage (level curve).</li>
 *   <li>Offhand rate multipliers ({@code #offhand_<item>}) to the
 *       {@code rituals.config} scoreboard.</li>
 * </ol>
 *
 * <p>The datapack defines defaults in {@code config/soul_xp/load.mcfunction}
 * and {@code config/soul_xp/offhand_rates.mcfunction}. This class overwrites
 * those same keys from TOML on server start and after every {@code /reload}.</p>
 */
public final class SoulXpTracker {

    private SoulXpTracker() {}

    /**
     * Registers lifecycle events to push config values on server start.
     * Call from {@link RitualsMod#onInitialize()}.
     */
    public static void initialize() {
        // Push TOML values after server starts (overrides datapack defaults)
        ServerLifecycleEvents.SERVER_STARTED.register(SoulXpTracker::pushAllToScoreboards);

        // Re-push after every /reload so datapack defaults don't overwrite TOML values
        ServerLifecycleEvents.END_DATA_PACK_RELOAD.register((server, resourceManager, success) -> {
            if (success) {
                pushAllToScoreboards(server);
                RitualsMod.LOGGER.info("[Soul Embodiment] Re-pushed config values after /reload");
            }
        });

        RitualsMod.LOGGER.info("[Soul Embodiment] Config pusher registered (time-based passive XP)");
    }

    /**
     * Re-push config values after a config reload (e.g. from ModMenu save).
     * Only logs values that actually changed from the previous state.
     *
     * @param server the running server instance
     */
    public static void repushConfig(MinecraftServer server) {
        // Snapshot old values before reload
        RitualsConfig oldConfig = RitualsConfig.get();
        Map<String, Integer> oldRates = new HashMap<>(oldConfig.offhandRates);
        int oldBaseRate = oldConfig.soulXpBaseRate;
        int oldResolvedInterval = oldConfig.getResolvedInterval();
        SoulXpRate oldPreset = oldConfig.soulXpRate;
        int oldLevelBase = oldConfig.levelBase;
        int oldLevelScaling = oldConfig.levelScaling;

        // Push all values (ensures everything is in sync)
        pushAllToScoreboards(server);

        // Log only what changed
        RitualsConfig newConfig = RitualsConfig.get();
        int changed = 0;

        if (newConfig.soulXpBaseRate != oldBaseRate) {
            RitualsMod.LOGGER.info("[Soul XP] baseRate : {} -> {}", oldBaseRate, newConfig.soulXpBaseRate);
            changed++;
        }
        if (newConfig.soulXpRate != oldPreset || newConfig.getResolvedInterval() != oldResolvedInterval) {
            RitualsMod.LOGGER.info("[Soul XP] rate : {}/{} -> {}/{}",
                    oldPreset.name(), SoulXpRate.formatTicks(oldResolvedInterval),
                    newConfig.soulXpRate.name(), SoulXpRate.formatTicks(newConfig.getResolvedInterval()));
            changed++;
        }
        if (newConfig.levelBase != oldLevelBase) {
            RitualsMod.LOGGER.info("[Soul XP] levelBase : {} -> {}", oldLevelBase, newConfig.levelBase);
            changed++;
        }
        if (newConfig.levelScaling != oldLevelScaling) {
            RitualsMod.LOGGER.info("[Soul XP] levelScaling : {} -> {}", oldLevelScaling, newConfig.levelScaling);
            changed++;
        }
        for (Map.Entry<String, Integer> entry : newConfig.offhandRates.entrySet()) {
            int oldVal = oldRates.getOrDefault(entry.getKey(), 100);
            if (oldVal != entry.getValue()) {
                RitualsMod.LOGGER.info("[Soul XP] {} : {} -> {}",
                        entry.getKey(), oldVal, entry.getValue());
                changed++;
            }
        }

        if (changed == 0) {
            RitualsMod.LOGGER.info("[Soul Embodiment] Config re-pushed (no values changed)");
        } else {
            RitualsMod.LOGGER.info("[Soul Embodiment] Config re-pushed ({} values updated)", changed);
        }
    }

    /**
     * Pushes ALL config values to storage and scoreboards.
     * Used on server start and after every /reload.
     *
     * @param server the server instance
     */
    private static void pushAllToScoreboards(MinecraftServer server) {
        RitualsConfig config = RitualsConfig.get();
        int resolvedInterval = config.getResolvedInterval();

        runCommand(server, "scoreboard objectives add rituals.config dummy");

        // === PASSIVE XP SETTINGS (storage) ===
        runCommand(server,
                "data modify storage rituals:config soul_xp_base_rate set value " + config.soulXpBaseRate);
        runCommand(server,
                "data modify storage rituals:config soul_xp_interval set value " + resolvedInterval);

        // === LEVEL CURVE (storage) ===
        runCommand(server,
                "data modify storage rituals:config soul_level_base set value " + config.levelBase);
        runCommand(server,
                "data modify storage rituals:config soul_level_scaling set value " + config.levelScaling);

        // === XP COUNTDOWN DEBUG FLAG (scoreboard) ===
        runCommand(server,
                "scoreboard players set #xp_countdown rituals.config " + (config.soulXpCountdown ? 1 : 0));

        // === OFFHAND RATE MODIFIERS (scoreboard) ===
        int offhandCount = 0;
        for (Map.Entry<String, Integer> entry : config.offhandRates.entrySet()) {
            String scoreboardName = toOffhandScoreboardName(entry.getKey());
            runCommand(server,
                    "scoreboard players set " + scoreboardName + " rituals.config " + entry.getValue());
            offhandCount++;
        }

        RitualsMod.LOGGER.info(
                "[Soul Embodiment] Pushed passive XP config (rate={}/{}, baseRate={}) + {} offhand rates",
                config.soulXpRate.name(), SoulXpRate.formatTicks(resolvedInterval),
                config.soulXpBaseRate, offhandCount);
    }

    /**
     * Converts a namespaced item ID to the offhand scoreboard constant name.
     * Example: "minecraft:soul_sand" -> "#offhand_soul_sand"
     * Example: "mymod:cool_gem" -> "#offhand_cool_gem"
     *
     * @param itemId the namespaced item ID
     * @return the scoreboard constant name
     */
    private static String toOffhandScoreboardName(String itemId) {
        String name = itemId;
        // Strip namespace prefix
        int colonIdx = name.indexOf(':');
        if (colonIdx >= 0) {
            name = name.substring(colonIdx + 1);
        }
        return "#offhand_" + name;
    }

    /**
     * Executes a command on the server silently.
     * Uses dispatcher.execute() matching the pattern in AdminCommands
     * that is proven to work for config pushes.
     *
     * @param server  the server instance
     * @param command the command string (without leading slash)
     */
    private static void runCommand(MinecraftServer server, String command) {
        try {
            server.getCommandManager().getDispatcher()
                    .execute(command, server.getCommandSource());
        } catch (Exception e) {
            RitualsMod.LOGGER.error("[Soul XP] Failed to execute: {}", command, e);
        }
    }
}
