package com.rituals.plugin.admin;

import com.rituals.plugin.RitualsPlugin;
import com.shirecraft.bukkit.gui.lookup.PlayerLookupMolecule;
import org.bukkit.inventory.ItemStack;

import java.util.List;
import java.util.UUID;

public final class AdminPlayerHeads {

    private AdminPlayerHeads() {
    }

    public enum LookupScope {
        ONLINE,
        ALL
    }

    public record PlayerRow(UUID uuid, String name, boolean online) {
    }

    public static ItemStack playerHead(
            RitualsPlugin plugin,
            UUID uuid,
            String displayName,
            List<String> lore,
            String action,
            String payload
    ) {
        return PlayerLookupMolecule.playerHead(
                AdminMenus.actionKey(plugin),
                AdminMenus.payloadKey(plugin),
                uuid,
                displayName,
                lore,
                action,
                payload);
    }

    public static String resolveName(UUID uuid) {
        return PlayerLookupMolecule.resolveName(uuid);
    }

    public static List<PlayerRow> list(LookupScope scope) {
        return list(scope, null);
    }

    public static List<PlayerRow> list(LookupScope scope, String nameQuery) {
        PlayerLookupMolecule.LookupScope mol = scope == LookupScope.ONLINE
                ? PlayerLookupMolecule.LookupScope.ONLINE
                : PlayerLookupMolecule.LookupScope.ALL;
        return PlayerLookupMolecule.list(mol, nameQuery).stream()
                .map(row -> new PlayerRow(row.uuid(), row.name(), row.online()))
                .toList();
    }

    public static String headTitle(PlayerRow row) {
        return (row.online() ? "&a" : "&7") + row.name();
    }
}
