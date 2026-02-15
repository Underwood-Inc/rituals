package com.rituals.soul;

import com.rituals.RitualsMod;
import com.rituals.config.RitualsConfig;

import net.fabricmc.fabric.api.event.lifecycle.v1.ServerLifecycleEvents;
import net.minecraft.server.MinecraftServer;

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
        ServerLifecycleEvents.SERVER_STARTED.register(SoulXpTracker::pushConfigToScoreboards);

        // Re-push after /reload so datapack defaults don't overwrite TOML values.
        // Flow: /reload -> datapack load.mcfunction sets defaults -> END_DATA_PACK_RELOAD fires -> we overwrite with TOML.
        ServerLifecycleEvents.END_DATA_PACK_RELOAD.register((server, resourceManager, success) -> {
            if (success) {
                pushConfigToScoreboards(server);
                RitualsMod.LOGGER.info("[Soul Embodiment] Config re-pushed after datapack reload");
            }
        });

        RitualsMod.LOGGER.info("[Soul Embodiment] Config pusher registered (datapack handles tracking)");
    }

    /**
     * Re-push config values after a config reload (e.g. from ModMenu save).
     * Call this from wherever config reload is triggered while server is running.
     *
     * @param server the running server instance
     */
    public static void repushConfig(MinecraftServer server) {
        pushConfigToScoreboards(server);
        RitualsMod.LOGGER.info("[Soul Embodiment] Config values re-pushed to scoreboards");
    }

    /**
     * Reads the TOML config and pushes block/kill XP values to the
     * {@code rituals.config} scoreboard as constants.
     *
     * <p>Block entries use prefix {@code #xp_} (e.g. {@code #xp_stone}).</p>
     * <p>Kill entries use prefix {@code #kxp_} (e.g. {@code #kxp_zombie}).</p>
     *
     * <p>These are the SAME scoreboard constant names that the datapack's
     * config files ({@code config/soul_xp/pickaxe_blocks.mcfunction}, etc.)
     * define. Values pushed here override the datapack defaults.</p>
     *
     * @param server the server instance
     */
    private static void pushConfigToScoreboards(MinecraftServer server) {
        RitualsConfig config = RitualsConfig.get();

        // Ensure the config scoreboard objective exists
        runCommand(server, "scoreboard objectives add rituals.config dummy");

        int blockCount = 0;
        int killCount = 0;

        // Push block XP values: "minecraft:stone" -> #xp_stone on rituals.config
        for (Map.Entry<String, Integer> entry : config.blockXpValues.entrySet()) {
            String blockId = entry.getKey();
            int xp = entry.getValue();
            String scoreboardName = toBlockScoreboardName(blockId);
            runCommand(server,
                    "scoreboard players set " + scoreboardName + " rituals.config " + xp);
            blockCount++;
        }

        // Push kill XP values: "minecraft:zombie" -> #kxp_zombie on rituals.config
        for (Map.Entry<String, Integer> entry : config.killXpValues.entrySet()) {
            String entityId = entry.getKey();
            int xp = entry.getValue();
            String scoreboardName = toKillScoreboardName(entityId);
            runCommand(server,
                    "scoreboard players set " + scoreboardName + " rituals.config " + xp);
            killCount++;
        }

        // Push level curve values
        runCommand(server,
                "data modify storage rituals:config soul_level_base set value " + config.levelBase);
        runCommand(server,
                "data modify storage rituals:config soul_level_scaling set value " + config.levelScaling);

        RitualsMod.LOGGER.info(
                "[Soul Embodiment] Pushed {} block XP values and {} kill XP values to scoreboards",
                blockCount, killCount);
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
     * Executes a command on the server.
     *
     * @param server  the server instance
     * @param command the command string (without leading slash)
     */
    private static void runCommand(MinecraftServer server, String command) {
        server.getCommandManager().parseAndExecute(server.getCommandSource(), command);
    }
}
