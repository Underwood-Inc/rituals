package com.rituals.plugin.admin;

import com.rituals.plugin.RitualsPlugin;
import com.rituals.plugin.config.Messages;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.OfflinePlayer;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.SkullMeta;
import org.bukkit.persistence.PersistentDataType;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
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
        ItemStack stack = new ItemStack(Material.PLAYER_HEAD);
        SkullMeta meta = (SkullMeta) stack.getItemMeta();
        if (meta == null) {
            return stack;
        }
        meta.setOwningPlayer(Bukkit.getOfflinePlayer(uuid));
        meta.setDisplayName(Messages.colorize(displayName));
        if (lore != null && !lore.isEmpty()) {
            List<String> colored = new ArrayList<>();
            for (String line : lore) {
                colored.add(Messages.colorize(line));
            }
            meta.setLore(colored);
        }
        var pdc = meta.getPersistentDataContainer();
        pdc.set(AdminMenus.actionKey(plugin), PersistentDataType.STRING, action);
        if (payload != null) {
            pdc.set(AdminMenus.payloadKey(plugin), PersistentDataType.STRING, payload);
        }
        stack.setItemMeta(meta);
        return stack;
    }

    public static String resolveName(UUID uuid) {
        OfflinePlayer offline = Bukkit.getOfflinePlayer(uuid);
        String name = offline.getName();
        if (name != null && !name.isBlank()) {
            return name;
        }
        return uuid.toString().substring(0, 8) + "…";
    }

    public static List<PlayerRow> list(LookupScope scope) {
        Set<UUID> ids = new LinkedHashSet<>();
        Bukkit.getOnlinePlayers().forEach(player -> ids.add(player.getUniqueId()));
        if (scope == LookupScope.ALL) {
            for (OfflinePlayer offline : Bukkit.getOfflinePlayers()) {
                if (offline.hasPlayedBefore()) {
                    ids.add(offline.getUniqueId());
                }
            }
        }

        List<PlayerRow> rows = new ArrayList<>();
        for (UUID uuid : ids) {
            rows.add(new PlayerRow(uuid, resolveName(uuid), Bukkit.getPlayer(uuid) != null));
        }
        rows.sort(Comparator
                .comparing(PlayerRow::online).reversed()
                .thenComparing(row -> row.name().toLowerCase(Locale.ROOT)));
        return rows;
    }

    public static String headTitle(PlayerRow row) {
        return (row.online() ? "&a" : "&7") + row.name();
    }
}
