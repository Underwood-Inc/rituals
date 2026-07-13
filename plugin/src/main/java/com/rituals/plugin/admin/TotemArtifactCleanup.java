package com.rituals.plugin.admin;

import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.World;
import org.bukkit.entity.Display;
import org.bukkit.entity.Entity;
import org.bukkit.entity.ItemDisplay;
import org.bukkit.inventory.ItemStack;
import org.bukkit.scoreboard.Objective;
import org.bukkit.scoreboard.Score;
import org.bukkit.scoreboard.Scoreboard;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * Removes orphaned totem display entities from the abandoned placed-totem resource-pack
 * experiment (v2.1.6 spawned {@link ItemDisplay} with tag {@code rituals.totem_visual}).
 */
public final class TotemArtifactCleanup {

    public record Result(int itemVisual, int itemVisualRp, int itemFungus, int itemNewVisual, int itemRitualsId, int total) {
    }

    private TotemArtifactCleanup() {
    }

    public static Result purge() {
        int itemVisual = 0;
        int itemVisualRp = 0;
        int itemFungus = 0;
        int itemNewVisual = 0;
        int itemRitualsId = 0;

        Objective ritualsId = ritualsIdObjective();

        for (World world : Bukkit.getWorlds()) {
            for (Entity entity : world.getEntities()) {
                if (!(entity instanceof ItemDisplay display)) {
                    continue;
                }
                if (display.getScoreboardTags().contains("rituals.totem_display")) {
                    continue;
                }

                Set<String> tags = display.getScoreboardTags();
                boolean remove = false;

                if (tags.contains("rituals.totem_visual")) {
                    itemVisual++;
                    remove = true;
                } else if (tags.contains("rituals.totem_visual_rp")) {
                    itemVisualRp++;
                    remove = true;
                } else if (tags.contains("rituals.new_visual")) {
                    itemNewVisual++;
                    remove = true;
                } else if (hasRitualsIdScore(display, ritualsId)) {
                    itemRitualsId++;
                    remove = true;
                } else if (isWarpedFungusStick(display)) {
                    itemFungus++;
                    remove = true;
                }

                if (remove) {
                    display.remove();
                }
            }
        }

        int total = itemVisual + itemVisualRp + itemFungus + itemNewVisual + itemRitualsId;
        return new Result(itemVisual, itemVisualRp, itemFungus, itemNewVisual, itemRitualsId, total);
    }

    /** @deprecated use {@link #purge()} */
    public static int cleanupOrphanDisplays() {
        return purge().total();
    }

    private static Objective ritualsIdObjective() {
        Scoreboard board = Bukkit.getScoreboardManager().getMainScoreboard();
        return board.getObjective("rituals.id");
    }

    private static boolean hasRitualsIdScore(ItemDisplay display, Objective ritualsId) {
        if (ritualsId == null) {
            return false;
        }
        String holder = display.getUniqueId().toString();
        Score score = ritualsId.getScore(holder);
        return score.isScoreSet() && score.getScore() > 0;
    }

    private static boolean isWarpedFungusStick(ItemDisplay display) {
        ItemStack item = display.getItemStack();
        return item != null && item.getType() == Material.WARPED_FUNGUS_ON_A_STICK;
    }

    public static Map<String, Integer> countOrphans() {
        Map<String, Integer> counts = new HashMap<>();
        counts.put("item_visual", 0);
        counts.put("item_visual_rp", 0);
        counts.put("item_fungus", 0);
        counts.put("item_new_visual", 0);
        counts.put("item_rituals_id", 0);

        Objective ritualsId = ritualsIdObjective();

        for (World world : Bukkit.getWorlds()) {
            for (Entity entity : world.getEntities()) {
                if (!(entity instanceof ItemDisplay display)) {
                    continue;
                }
                if (display.getScoreboardTags().contains("rituals.totem_display")) {
                    continue;
                }
                Set<String> tags = display.getScoreboardTags();
                if (tags.contains("rituals.totem_visual")) {
                    counts.merge("item_visual", 1, Integer::sum);
                } else if (tags.contains("rituals.totem_visual_rp")) {
                    counts.merge("item_visual_rp", 1, Integer::sum);
                } else if (tags.contains("rituals.new_visual")) {
                    counts.merge("item_new_visual", 1, Integer::sum);
                } else if (hasRitualsIdScore(display, ritualsId)) {
                    counts.merge("item_rituals_id", 1, Integer::sum);
                } else if (isWarpedFungusStick(display)) {
                    counts.merge("item_fungus", 1, Integer::sum);
                }
            }
        }
        return counts;
    }
}
