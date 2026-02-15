package com.rituals.soul;

import com.rituals.RitualsMod;
import com.rituals.config.RitualsConfig;

import net.fabricmc.fabric.api.event.lifecycle.v1.ServerLifecycleEvents;
import net.minecraft.server.MinecraftServer;

import java.util.HashMap;
import java.util.Map;

/**
 * Soul XP Config Pusher.
 *
 * <p>This class does NOT track XP itself. The datapack handles ALL tracking
 * via {@code minecraft.mined:*} and {@code minecraft.killed:*} scoreboards
 * combined with the enumerated block/kill XP config lists.</p>
 *
 * <p>What this class DOES:</p>
 * <ol>
 *   <li>On server start, reads the TOML config (block XP map, kill XP map).</li>
 *   <li>Pushes those values to the SAME {@code rituals.config} scoreboard
 *       constants that the datapack's enumerated lists use.</li>
 *   <li>This means ModMenu edits override the datapack defaults seamlessly.</li>
 * </ol>
 *
 * <p>The datapack's tracking functions ({@code soul/track_blocks/*.mcfunction}
 * and {@code soul/track_kills/*.mcfunction}) read from these scoreboard
 * constants at runtime. By pushing config values here, the Java mod
 * extends/overrides those constants without changing the tracking method.</p>
 */
public final class SoulXpTracker {

    private SoulXpTracker() {}

    /**
     * Registers lifecycle events to push config values on server start.
     * Call from {@link RitualsMod#onInitialize()}.
     */
    public static void initialize() {
        // Push TOML values after server starts (overrides datapack defaults)
        ServerLifecycleEvents.SERVER_STARTED.register(SoulXpTracker::pushConfigToScoreboards);

        // Re-push after every /reload so datapack defaults don't overwrite TOML values
        ServerLifecycleEvents.END_DATA_PACK_RELOAD.register((server, resourceManager, success) -> {
            if (success) {
                pushAllToScoreboards(server);
                RitualsMod.LOGGER.info("[Soul Embodiment] Re-pushed config values after /reload");
            }
        });

        RitualsMod.LOGGER.info("[Soul Embodiment] Config pusher registered (datapack handles tracking)");
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
        Map<String, Integer> oldBlocks = new HashMap<>(oldConfig.blockXpValues);
        Map<String, Integer> oldKills = new HashMap<>(oldConfig.killXpValues);
        int oldLevelBase = oldConfig.levelBase;
        int oldLevelScaling = oldConfig.levelScaling;

        // Push all values to scoreboards (ensures everything is in sync)
        pushAllToScoreboards(server);

        // Log only what changed
        RitualsConfig newConfig = RitualsConfig.get();
        int changed = 0;

        for (Map.Entry<String, Integer> entry : newConfig.blockXpValues.entrySet()) {
            int oldVal = oldBlocks.getOrDefault(entry.getKey(), 0);
            if (oldVal != entry.getValue()) {
                RitualsMod.LOGGER.info("[Soul XP] {} : {} -> {}",
                        entry.getKey(), oldVal, entry.getValue());
                changed++;
            }
        }
        for (Map.Entry<String, Integer> entry : newConfig.killXpValues.entrySet()) {
            int oldVal = oldKills.getOrDefault(entry.getKey(), 0);
            if (oldVal != entry.getValue()) {
                RitualsMod.LOGGER.info("[Soul XP] {} : {} -> {}",
                        entry.getKey(), oldVal, entry.getValue());
                changed++;
            }
        }
        if (newConfig.levelBase != oldLevelBase) {
            RitualsMod.LOGGER.info("[Soul XP] levelBase : {} -> {}", oldLevelBase, newConfig.levelBase);
            changed++;
        }
        if (newConfig.levelScaling != oldLevelScaling) {
            RitualsMod.LOGGER.info("[Soul XP] levelScaling : {} -> {}", oldLevelScaling, newConfig.levelScaling);
            changed++;
        }

        if (changed == 0) {
            RitualsMod.LOGGER.info("[Soul Embodiment] Config re-pushed (no values changed)");
        } else {
            RitualsMod.LOGGER.info("[Soul Embodiment] Config re-pushed ({} values updated)", changed);
        }
    }

    /**
     * Pushes ALL config values to the {@code rituals.config} scoreboard.
     * Used on server start and as the underlying push for repushConfig.
     *
     * @param server the server instance
     */
    private static void pushAllToScoreboards(MinecraftServer server) {
        RitualsConfig config = RitualsConfig.get();

        runCommand(server, "scoreboard objectives add rituals.config dummy");

        int blockCount = 0;
        int killCount = 0;

        for (Map.Entry<String, Integer> entry : config.blockXpValues.entrySet()) {
            String scoreboardName = toBlockScoreboardName(entry.getKey());
            runCommand(server,
                    "scoreboard players set " + scoreboardName + " rituals.config " + entry.getValue());
            blockCount++;
        }

        for (Map.Entry<String, Integer> entry : config.killXpValues.entrySet()) {
            String scoreboardName = toKillScoreboardName(entry.getKey());
            runCommand(server,
                    "scoreboard players set " + scoreboardName + " rituals.config " + entry.getValue());
            killCount++;
        }

        runCommand(server,
                "data modify storage rituals:config soul_level_base set value " + config.levelBase);
        runCommand(server,
                "data modify storage rituals:config soul_level_scaling set value " + config.levelScaling);

        // Recalibrate block/kill tracking so config changes don't cause phantom XP.
        // Removing these tags forces the datapack to re-snapshot prev_blocks/prev_kills
        // on the next tick using the NEW weighted totals, so the delta stays zero.
        runCommand(server, "tag @a remove rituals.blocks_initialized");
        runCommand(server, "tag @a remove rituals.kills_initialized");

        RitualsMod.LOGGER.info(
                "[Soul Embodiment] Pushed {} block + {} kill XP values to scoreboards",
                blockCount, killCount);
    }

    /**
     * Initial push on server start. Logs total count only.
     */
    private static void pushConfigToScoreboards(MinecraftServer server) {
        pushAllToScoreboards(server);
    }

    /**
     * Converts a namespaced block ID to the scoreboard constant name.
     * Example: "minecraft:stone" -> "#xp_stone"
     * Example: "mymod:cool_ore" -> "#xp_cool_ore"
     *
     * @param blockId the namespaced block ID
     * @return the scoreboard constant name
     */
    private static String toBlockScoreboardName(String blockId) {
        String name = blockId;
        // Strip namespace prefix
        int colonIdx = name.indexOf(':');
        if (colonIdx >= 0) {
            name = name.substring(colonIdx + 1);
        }
        return "#xp_" + name;
    }

    /**
     * Converts a namespaced entity ID to the scoreboard constant name.
     * Example: "minecraft:zombie" -> "#kxp_zombie"
     * Example: "mymod:custom_boss" -> "#kxp_custom_boss"
     *
     * @param entityId the namespaced entity ID
     * @return the scoreboard constant name
     */
    private static String toKillScoreboardName(String entityId) {
        String name = entityId;
        // Strip namespace prefix
        int colonIdx = name.indexOf(':');
        if (colonIdx >= 0) {
            name = name.substring(colonIdx + 1);
        }
        return "#kxp_" + name;
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
