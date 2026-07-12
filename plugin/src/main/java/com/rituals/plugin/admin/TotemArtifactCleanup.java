package com.rituals.plugin.admin;

import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.World;
import org.bukkit.entity.Entity;
import org.bukkit.entity.ItemDisplay;
import org.bukkit.inventory.ItemStack;

/**
 * Removes orphaned totem {@link ItemDisplay} entities left from abandoned placed-totem
 * resource-pack experiments (magenta missing-texture cubes).
 */
public final class TotemArtifactCleanup {

    private TotemArtifactCleanup() {
    }

    public static int cleanupOrphanDisplays() {
        int removed = 0;
        for (World world : Bukkit.getWorlds()) {
            for (Entity entity : world.getEntities()) {
                if (!(entity instanceof ItemDisplay display)) {
                    continue;
                }
                if (shouldRemove(display)) {
                    display.remove();
                    removed++;
                }
            }
        }
        return removed;
    }

    private static boolean shouldRemove(ItemDisplay display) {
        var tags = display.getScoreboardTags();
        if (tags.contains("rituals.totem_visual") || tags.contains("rituals.totem_visual_rp")) {
            return true;
        }
        if (tags.contains("rituals.totem_display")) {
            return false;
        }
        ItemStack item = display.getItemStack();
        return item != null && item.getType() == Material.WARPED_FUNGUS_ON_A_STICK;
    }
}
