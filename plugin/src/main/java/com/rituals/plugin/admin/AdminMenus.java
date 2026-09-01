package com.rituals.plugin.admin;

import com.rituals.plugin.RitualsPlugin;
import com.shirecraft.bukkit.gui.admin.AdminHubLayoutSlots;
import com.shirecraft.bukkit.gui.admin.AdminMenuButtonFactory;
import org.bukkit.Material;
import org.bukkit.NamespacedKey;
import org.bukkit.inventory.ItemStack;

import java.util.List;

public final class AdminMenus {

    public static final int[] CONTENT_28 = AdminHubLayoutSlots.CONTENT_28;
    public static final int SLOT_HEADER = AdminHubLayoutSlots.SLOT_HEADER;
    public static final int ROW2_LEFT = AdminHubLayoutSlots.ROW2_LEFT;
    public static final int ROW2_CENTER = AdminHubLayoutSlots.ROW2_CENTER;
    public static final int ROW2_RIGHT = AdminHubLayoutSlots.ROW2_RIGHT;
    public static final int SLOT_BACK = AdminHubLayoutSlots.SLOT_BACK;

    private AdminMenus() {
    }

    public static ItemStack button(
            RitualsPlugin plugin,
            Material material,
            String name,
            List<String> lore,
            String action,
            String payload
    ) {
        return AdminMenuButtonFactory.button(
                actionKey(plugin),
                payloadKey(plugin),
                material,
                name,
                lore,
                action,
                payload);
    }

    public static String action(RitualsPlugin plugin, ItemStack item) {
        return AdminMenuButtonFactory.readAction(actionKey(plugin), item);
    }

    public static String payload(RitualsPlugin plugin, ItemStack item) {
        return AdminMenuButtonFactory.readPayload(payloadKey(plugin), item);
    }

    public static ItemStack back(RitualsPlugin plugin) {
        return button(plugin, Material.ARROW, "&eBack", List.of(), "back", null);
    }

    public static ItemStack previousPage(RitualsPlugin plugin, String name, List<String> lore, String action) {
        return AdminMenuButtonFactory.previousPage(
                actionKey(plugin),
                payloadKey(plugin),
                name,
                lore,
                action);
    }

    public static ItemStack nextPage(RitualsPlugin plugin, String name, List<String> lore, String action) {
        return AdminMenuButtonFactory.nextPage(
                actionKey(plugin),
                payloadKey(plugin),
                name,
                lore,
                action);
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
