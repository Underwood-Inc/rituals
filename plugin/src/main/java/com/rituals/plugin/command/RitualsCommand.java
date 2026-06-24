package com.rituals.plugin.command;

import com.rituals.plugin.RitualsPlugin;
import com.rituals.plugin.config.ConfigMenu;
import com.rituals.plugin.config.Messages;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.command.TabCompleter;
import org.bukkit.entity.Player;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

public final class RitualsCommand implements CommandExecutor, TabCompleter {

    private static final List<String> ROOT_SUBS = List.of(
            "help", "config", "reload", "give", "soul", "admin"
    );

    private final RitualsPlugin plugin;

    public RitualsCommand(RitualsPlugin plugin) {
        this.plugin = plugin;
    }

    @Override
    public boolean onCommand(@NotNull CommandSender sender, @NotNull Command command,
                             @NotNull String label, @NotNull String[] args) {
        if (args.length == 0 || args[0].equalsIgnoreCase("help")) {
            sendHelp(sender);
            return true;
        }

        String sub = args[0].toLowerCase(Locale.ROOT);
        return switch (sub) {
            case "config", "menu", "gui" -> handleConfig(sender);
            case "reload" -> handleReload(sender);
            case "give" -> handleGive(sender, args);
            case "soul" -> handleSoul(sender, args);
            case "admin" -> handleAdmin(sender, args);
            default -> {
                Messages.send(sender, "&cUnknown subcommand. Use /rituals help");
                yield true;
            }
        };
    }

    private void sendHelp(CommandSender sender) {
        Messages.send(sender, "&d—— Rituals ——");
        Messages.send(sender, "&b/rituals config &7— chest config GUI (rituals.config)");
        Messages.send(sender, "&b/rituals reload &7— reload plugin + datapack config");
        Messages.send(sender, "&b/rituals give all &7— totems + guidebook (rituals.give)");
        Messages.send(sender, "&b/rituals soul info &7— soul weapon stats (rituals.soul)");
        Messages.send(sender, "&b/rituals admin <action> &7— kiwi mode, debug (rituals.admin)");
        Messages.send(sender, "&8Gameplay requires the Rituals datapack (bundled or manual).");
    }

    private boolean handleConfig(CommandSender sender) {
        if (!sender.hasPermission("rituals.config")) {
            Messages.send(sender, plugin.getPluginConfig().noPermission());
            return true;
        }
        if (!(sender instanceof Player player)) {
            Messages.send(sender, "&cConfig GUI is player-only.");
            return true;
        }
        ConfigMenu.open(plugin, player);
        return true;
    }

    private boolean handleReload(CommandSender sender) {
        if (!sender.hasPermission("rituals.config")) {
            Messages.send(sender, plugin.getPluginConfig().noPermission());
            return true;
        }
        plugin.reloadAll();
        Messages.send(sender, plugin.getPluginConfig().prefix("&aPlugin and datapack config reloaded."));
        return true;
    }

    private boolean handleGive(CommandSender sender, String[] args) {
        if (!sender.hasPermission("rituals.give")) {
            Messages.send(sender, plugin.getPluginConfig().noPermission());
            return true;
        }
        if (!(sender instanceof Player player)) {
            Messages.send(sender, "&cGive commands are player-only.");
            return true;
        }
        if (args.length < 2) {
            Messages.send(sender, "&eUsage: /rituals give <all|guidebook|...>");
            return true;
        }

        double cost = plugin.getPluginConfig().getGiveTotemSetCost();
        if (cost > 0 && !plugin.getVaultHook().charge(player, cost)) {
            return true;
        }

        String target = args[1].toLowerCase(Locale.ROOT);
        if (target.equals("all")) {
            plugin.getDatapackBridge().runFunction(player, "rituals:give/all");
        } else if (target.equals("guidebook")) {
            plugin.getDatapackBridge().runFunction(player, "rituals:give/guidebook");
        } else {
            plugin.getDatapackBridge().runFunction(player, "rituals:give/totem_" + target);
        }
        return true;
    }

    private boolean handleSoul(CommandSender sender, String[] args) {
        if (!sender.hasPermission("rituals.soul")) {
            Messages.send(sender, plugin.getPluginConfig().noPermission());
            return true;
        }
        if (!(sender instanceof Player player)) {
            Messages.send(sender, "&cSoul commands are player-only.");
            return true;
        }
        if (args.length < 2) {
            Messages.send(sender, "&eUsage: /rituals soul <info|rename <name>>");
            return true;
        }
        if (args[1].equalsIgnoreCase("info")) {
            plugin.getDatapackBridge().runFunction(player, "rituals:soul/debug_xp");
            return true;
        }
        if (args[1].equalsIgnoreCase("rename")) {
            if (!sender.hasPermission("rituals.soul.rename")) {
                Messages.send(sender, plugin.getPluginConfig().noPermission());
                return true;
            }
            if (args.length < 3) {
                Messages.send(sender, "&eUsage: /rituals soul rename <name>");
                return true;
            }
            double cost = plugin.getPluginConfig().getSoulRenameCost();
            if (cost > 0 && !plugin.getVaultHook().charge(player, cost)) {
                return true;
            }
            Messages.send(sender, plugin.getPluginConfig().prefix(
                    "&eRename soul weapons at an anvil, or hold the item and use datapack sync."));
            return true;
        }
        Messages.send(sender, "&cUnknown soul subcommand.");
        return true;
    }

    private boolean handleAdmin(CommandSender sender, String[] args) {
        if (!sender.hasPermission("rituals.admin")) {
            Messages.send(sender, plugin.getPluginConfig().noPermission());
            return true;
        }
        if (args.length < 2) {
            Messages.send(sender, "&eUsage: /rituals admin <enable_kiwi_mode|disable_kiwi_mode|...>");
            return true;
        }
        String action = String.join("_", Arrays.copyOfRange(args, 1, args.length)).toLowerCase(Locale.ROOT);
        plugin.getDatapackBridge().runFunctionAsConsole("rituals:admin/" + action);
        Messages.send(sender, plugin.getPluginConfig().prefix("&aRan rituals:admin/" + action));
        return true;
    }

    @Override
    public @Nullable List<String> onTabComplete(@NotNull CommandSender sender, @NotNull Command command,
                                              @NotNull String alias, @NotNull String[] args) {
        if (args.length == 1) {
            return filter(ROOT_SUBS, args[0]);
        }
        if (args.length == 2 && args[0].equalsIgnoreCase("give")) {
            return filter(List.of("all", "guidebook", "basic", "copper", "iron", "gold", "advanced", "netherite"), args[1]);
        }
        if (args.length == 2 && args[0].equalsIgnoreCase("soul")) {
            return filter(List.of("info", "rename"), args[1]);
        }
        if (args.length >= 2 && args[0].equalsIgnoreCase("admin")) {
            return filter(List.of("enable_kiwi_mode", "disable_kiwi_mode", "enable_debug_mode", "disable_debug_mode"), args[1]);
        }
        return Collections.emptyList();
    }

    private static List<String> filter(List<String> options, String prefix) {
        String lower = prefix.toLowerCase(Locale.ROOT);
        return options.stream()
                .filter(o -> o.startsWith(lower))
                .collect(Collectors.toCollection(ArrayList::new));
    }
}
