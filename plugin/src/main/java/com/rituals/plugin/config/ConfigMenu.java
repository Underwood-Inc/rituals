package com.rituals.plugin.config;

import com.rituals.plugin.RitualsPlugin;
import org.bukkit.Bukkit;
import org.bukkit.ChatColor;
import org.bukkit.Material;
import org.bukkit.NamespacedKey;
import org.bukkit.entity.Player;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.InventoryHolder;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.ItemMeta;
import org.bukkit.persistence.PersistentDataType;

import java.util.List;

/**
 * Chest-style admin config GUI — toggles datapack storage via {@link com.rituals.plugin.datapack.DatapackBridge}.
 */
public final class ConfigMenu implements InventoryHolder {

    public static final String TITLE = Messages.colorize("&5Rituals Config");

    public enum Action {
        KIWI_ON,
        KIWI_OFF,
        FIRE_ON,
        FIRE_OFF,
        XP_EASY,
        XP_HARD,
        RELOAD,
        CLOSE
    }

    private static NamespacedKey actionKey(RitualsPlugin plugin) {
        return new NamespacedKey(plugin, "config_action");
    }

    private final Inventory inventory;

    private ConfigMenu(RitualsPlugin plugin) {
        this.inventory = Bukkit.createInventory(this, 27, TITLE);
        fill(plugin);
    }

    public static void open(RitualsPlugin plugin, Player player) {
        player.openInventory(new ConfigMenu(plugin).getInventory());
    }

    private void fill(RitualsPlugin plugin) {
        inventory.setItem(10, button(plugin, Material.LIME_WOOL, "Enable Kiwi Mode",
                "Rituals activate without fire sacrifice", Action.KIWI_ON));
        inventory.setItem(11, button(plugin, Material.RED_WOOL, "Disable Kiwi Mode",
                "Require fire sacrifice again", Action.KIWI_OFF));
        inventory.setItem(13, button(plugin, Material.FIRE_CHARGE, "Require Fire Sacrifice", null, Action.FIRE_ON));
        inventory.setItem(14, button(plugin, Material.WATER_BUCKET, "Disable Fire Sacrifice", null, Action.FIRE_OFF));
        inventory.setItem(15, button(plugin, Material.EMERALD, "Soul XP: Easy", null, Action.XP_EASY));
        inventory.setItem(16, button(plugin, Material.NETHERITE_INGOT, "Soul XP: Hard", null, Action.XP_HARD));
        inventory.setItem(22, button(plugin, Material.COMPASS, "Reload Config", "Plugin + datapack", Action.RELOAD));
        inventory.setItem(26, button(plugin, Material.BARRIER, "Close", null, Action.CLOSE));
    }

    private static ItemStack button(RitualsPlugin plugin, Material material, String name,
                                  String loreLine, Action action) {
        ItemStack stack = new ItemStack(material);
        ItemMeta meta = stack.getItemMeta();
        meta.setDisplayName(ChatColor.GOLD + name);
        if (loreLine != null) {
            meta.setLore(List.of(ChatColor.GRAY + loreLine));
        }
        meta.getPersistentDataContainer().set(actionKey(plugin), PersistentDataType.STRING, action.name());
        stack.setItemMeta(meta);
        return stack;
    }

    public static Action actionOf(RitualsPlugin plugin, ItemStack stack) {
        if (stack == null || !stack.hasItemMeta()) {
            return null;
        }
        String tag = stack.getItemMeta().getPersistentDataContainer()
                .get(actionKey(plugin), PersistentDataType.STRING);
        if (tag == null || tag.isEmpty()) {
            return null;
        }
        try {
            return Action.valueOf(tag);
        } catch (IllegalArgumentException ex) {
            return null;
        }
    }

    @Override
    public Inventory getInventory() {
        return inventory;
    }
}
