package com.rituals.plugin.admin;

import com.rituals.plugin.RitualsPlugin;
import com.rituals.plugin.config.Messages;
import org.bukkit.Material;
import org.bukkit.NamespacedKey;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.ItemMeta;
import org.bukkit.persistence.PersistentDataType;

import java.util.ArrayList;
import java.util.List;

public final class AdminMenus {

    public static final int[] CONTENT_28 = {
            10, 11, 12, 13, 14, 15, 16,
            19, 20, 21, 22, 23, 24, 25,
            28, 29, 30, 31, 32, 33, 34,
            37, 38, 39, 40, 41, 42, 43
    };

    public static final int SLOT_HEADER = 4;
    public static final int ROW2_LEFT = 20;
    public static final int ROW2_CENTER = 22;
    public static final int ROW2_RIGHT = 24;
    public static final int SLOT_BACK = 49;

    private AdminMenus() {
    }

    public static ItemStack button(RitualsPlugin plugin, Material material, String name, List<String> lore,
                                   String action, String payload) {
        ItemStack stack = new ItemStack(material);
        ItemMeta meta = stack.getItemMeta();
        if (meta == null) {
            return stack;
        }
        meta.setDisplayName(Messages.colorize(name));
        if (lore != null && !lore.isEmpty()) {
            List<String> colored = new ArrayList<>();
            for (String line : lore) {
                colored.add(Messages.colorize(line));
            }
            meta.setLore(colored);
        }
        var pdc = meta.getPersistentDataContainer();
        pdc.set(actionKey(plugin), PersistentDataType.STRING, action);
        if (payload != null) {
            pdc.set(payloadKey(plugin), PersistentDataType.STRING, payload);
        }
        stack.setItemMeta(meta);
        return stack;
    }

    public static String action(RitualsPlugin plugin, ItemStack item) {
        if (item == null || !item.hasItemMeta()) {
            return null;
        }
        return item.getItemMeta().getPersistentDataContainer().get(actionKey(plugin), PersistentDataType.STRING);
    }

    public static String payload(RitualsPlugin plugin, ItemStack item) {
        if (item == null || !item.hasItemMeta()) {
            return null;
        }
        return item.getItemMeta().getPersistentDataContainer().get(payloadKey(plugin), PersistentDataType.STRING);
    }

    public static ItemStack back(RitualsPlugin plugin) {
        return button(plugin, Material.ARROW, "&eBack", List.of(), "back", null);
    }

    public static ItemStack previousPage(RitualsPlugin plugin, String name, List<String> lore, String action) {
        return button(plugin, Material.SOUL_TORCH, name, lore, action, null);
    }

    public static ItemStack nextPage(RitualsPlugin plugin, String name, List<String> lore, String action) {
        return button(plugin, Material.REDSTONE_TORCH, name, lore, action, null);
    }

    public static NamespacedKey actionKey(RitualsPlugin plugin) {
        return new NamespacedKey(plugin, "admin_action");
    }

    public static NamespacedKey payloadKey(RitualsPlugin plugin) {
        return new NamespacedKey(plugin, "admin_payload");
    }

    public interface AdminScreen extends org.bukkit.inventory.InventoryHolder {
    }
}
