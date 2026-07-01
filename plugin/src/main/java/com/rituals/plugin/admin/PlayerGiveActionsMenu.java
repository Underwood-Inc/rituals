package com.rituals.plugin.admin;

import com.rituals.plugin.RitualsPlugin;
import com.rituals.plugin.config.Messages;
import com.rituals.plugin.recipe.RitualRecipeCatalog;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.inventory.Inventory;

import java.util.List;
import java.util.UUID;

public final class PlayerGiveActionsMenu implements AdminMenus.AdminScreen {

    private final Inventory inventory;
    private final UUID targetUuid;
    private final int lookupPage;
    private final AdminPlayerHeads.LookupScope lookupScope;

    private PlayerGiveActionsMenu(
            RitualsPlugin plugin,
            UUID targetUuid,
            int lookupPage,
            AdminPlayerHeads.LookupScope lookupScope
    ) {
        this.targetUuid = targetUuid;
        this.lookupPage = lookupPage;
        this.lookupScope = lookupScope;
        String name = AdminPlayerHeads.resolveName(targetUuid);
        this.inventory = Bukkit.createInventory(this, 54, Messages.colorize("&8Give » " + name));
        build(plugin);
    }

    public static void open(
            RitualsPlugin plugin,
            Player admin,
            UUID targetUuid,
            int lookupPage,
            AdminPlayerHeads.LookupScope lookupScope
    ) {
        admin.openInventory(new PlayerGiveActionsMenu(plugin, targetUuid, lookupPage, lookupScope).getInventory());
    }

    public UUID targetUuid() {
        return targetUuid;
    }

    public int lookupPage() {
        return lookupPage;
    }

    public AdminPlayerHeads.LookupScope lookupScope() {
        return lookupScope;
    }

    private void build(RitualsPlugin plugin) {
        boolean online = Bukkit.getPlayer(targetUuid) != null;
        inventory.setItem(AdminMenus.SLOT_HEADER, AdminPlayerHeads.playerHead(
                plugin,
                targetUuid,
                AdminPlayerHeads.headTitle(new AdminPlayerHeads.PlayerRow(targetUuid, AdminPlayerHeads.resolveName(targetUuid), online)),
                List.of(" ", online ? "&aOnline" : "&cOffline — cannot give"),
                "noop",
                null
        ));

        inventory.setItem(AdminMenus.ROW2_LEFT, AdminMenus.button(
                plugin,
                Material.WRITABLE_BOOK,
                "&dGuidebook",
                List.of(" ", "&7Standard rituals guidebook.", " ", "&eClick » Give"),
                "give_guidebook",
                null
        ));
        inventory.setItem(AdminMenus.ROW2_CENTER, AdminMenus.button(
                plugin,
                Material.ENCHANTED_BOOK,
                "&5Welcome Guidebook",
                List.of(" ", "&7Enchanted welcome copy.", " ", "&eClick » Give"),
                "give_welcome",
                null
        ));
        inventory.setItem(AdminMenus.ROW2_RIGHT, AdminMenus.button(
                plugin,
                Material.CHEST,
                "&6All Totems + Book",
                List.of(" ", "&7Full starter set via datapack.", " ", "&eClick » Give"),
                "give_all",
                null
        ));

        int slot = 28;
        for (RitualRecipeCatalog.TotemTier tier : RitualRecipeCatalog.totemTiers()) {
            if (slot > 34) {
                break;
            }
            inventory.setItem(slot++, AdminMenus.button(
                    plugin,
                    tier.icon(),
                    tier.title(),
                    List.of(" ", "&7Single totem tier.", " ", "&eClick » Give"),
                    "give_totem",
                    tier.id()
            ));
        }

        inventory.setItem(48, AdminMenus.button(plugin, Material.ARROW, "&ePlayer list", List.of(), "back_lookup", null));
        inventory.setItem(AdminMenus.SLOT_BACK, AdminMenus.back(plugin));
    }

    @Override
    public Inventory getInventory() {
        return inventory;
    }
}
