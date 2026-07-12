package com.rituals.plugin.admin;

import com.rituals.plugin.RitualsPlugin;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.inventory.Inventory;

import java.util.List;

public final class PlayerGiveLookupMenu implements AdminMenus.AdminScreen {

    private final Inventory inventory;
    private final int page;
    private final AdminPlayerHeads.LookupScope scope;

    private PlayerGiveLookupMenu(RitualsPlugin plugin, int page, AdminPlayerHeads.LookupScope scope) {
        this.page = page;
        this.scope = scope;
        this.inventory = Bukkit.createInventory(this, 54, com.rituals.plugin.config.Messages.colorize("&8Give Rituals Items"));
        build(plugin);
    }

    public static void open(RitualsPlugin plugin, Player player) {
        open(plugin, player, 0, AdminPlayerHeads.LookupScope.ONLINE);
    }

    public static void open(RitualsPlugin plugin, Player player, int page, AdminPlayerHeads.LookupScope scope) {
        player.openInventory(new PlayerGiveLookupMenu(plugin, page, scope).getInventory());
    }

    public int page() {
        return page;
    }

    public AdminPlayerHeads.LookupScope scope() {
        return scope;
    }

    private void build(RitualsPlugin plugin) {
        List<AdminPlayerHeads.PlayerRow> rows = AdminPlayerHeads.list(scope);

        inventory.setItem(AdminMenus.SLOT_HEADER, AdminMenus.button(
                plugin,
                Material.PLAYER_HEAD,
                "&aGive to Player",
                List.of(
                        " ",
                        "&7View: &f" + (scope == AdminPlayerHeads.LookupScope.ONLINE ? "Online" : "All known"),
                        "&7Listed: &f" + rows.size(),
                        " ",
                        "&7Click a head to grant items.",
                        "&8Target must be online."
                ),
                "noop",
                null
        ));

        inventory.setItem(1, scopeButton(plugin, AdminPlayerHeads.LookupScope.ONLINE, "&aOnline"));
        inventory.setItem(2, scopeButton(plugin, AdminPlayerHeads.LookupScope.ALL, "&bAll known"));

        int perPage = AdminMenus.CONTENT_28.length;
        int start = page * perPage;
        int end = Math.min(start + perPage, rows.size());
        for (int i = start; i < end; i++) {
            AdminPlayerHeads.PlayerRow row = rows.get(i);
            inventory.setItem(
                    AdminMenus.CONTENT_28[i - start],
                    AdminPlayerHeads.playerHead(
                            plugin,
                            row.uuid(),
                            AdminPlayerHeads.headTitle(row),
                            List.of(
                                    " ",
                                    row.online() ? "&aOnline" : "&cOffline",
                                    " ",
                                    "&eClick » Choose items"
                            ),
                            "select_player",
                            row.uuid().toString()
                    )
            );
        }

        if (page > 0) {
            inventory.setItem(45, AdminMenus.previousPage(plugin, "&ePrevious", List.of(), "prev"));
        }
        if (end < rows.size()) {
            inventory.setItem(53, AdminMenus.nextPage(plugin, "&eNext", List.of(), "next"));
        }

        inventory.setItem(AdminMenus.SLOT_BACK, AdminMenus.back(plugin));
    }

    private org.bukkit.inventory.ItemStack scopeButton(
            RitualsPlugin plugin,
            AdminPlayerHeads.LookupScope target,
            String label
    ) {
        boolean active = scope == target;
        return AdminMenus.button(
                plugin,
                active ? Material.LIME_DYE : Material.GRAY_DYE,
                (active ? "&a&l" : "&7") + label,
                List.of(active ? "&aActive" : "&eSwitch"),
                "scope_" + target.name().toLowerCase(),
                null
        );
    }

    @Override
    public Inventory getInventory() {
        return inventory;
    }
}
