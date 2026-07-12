package com.rituals.plugin.command;

import com.rituals.plugin.RitualsPlugin;
import com.rituals.plugin.admin.AdminHubMenu;
import com.rituals.plugin.admin.TotemArtifactCleanup;
import com.rituals.plugin.config.ConfigMenu;
import com.rituals.plugin.config.Messages;
import com.rituals.plugin.guide.RecipeChatGuide;
import com.rituals.plugin.gui.GuideHubMenu;
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
            "help", "config", "reload", "give", "soul", "admin", "guide"
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
            case "guide" -> handleGuide(sender, args);
            case "admin" -> handleAdmin(sender, args);
            default -> {
                Messages.send(sender, "&cUnknown subcommand. Use /rituals help");
                yield true;
            }
        };
    }

    private void sendHelp(CommandSender sender) {
        if (sender instanceof Player player) {
            plugin.getDatapackBridge().runFunction(player, "rituals:help");
            return;
        }
        Messages.send(sender, "&d—— Rituals ——");
        Messages.send(sender, "&b/rituals help &7— guidebook + command list");
        Messages.send(sender, "&b/rituals config &7— chest config GUI (rituals.config)");
        Messages.send(sender, "&b/rituals reload &7— reload plugin + datapack config");
        Messages.send(sender, "&b/rituals give welcome &7— enchanted guidebook (rituals.admin)");
        Messages.send(sender, "&b/rituals give all &7— totems + guidebook (rituals.give)");
        Messages.send(sender, "&b/rituals soul info &7— soul weapon stats (rituals.soul)");
        Messages.send(sender, "&b/rituals guide &7— crafting chest GUI + chat recipes");
        Messages.send(sender, "&b/rituals admin &7— admin hub GUI (rituals.admin)");
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
        if (args.length < 2) {
            Messages.send(sender, "&eUsage: /rituals give <all|guidebook|welcome|...>");
            return true;
        }

        String target = args[1].toLowerCase(Locale.ROOT);
        if (target.equals("welcome") || target.equals("guidebook_welcome")) {
            if (!sender.hasPermission("rituals.admin")) {
                Messages.send(sender, plugin.getPluginConfig().noPermission());
                return true;
            }
            if (!(sender instanceof Player player)) {
                Messages.send(sender, "&cGive commands are player-only.");
                return true;
            }
            plugin.getDatapackBridge().runFunction(player, "rituals:give/guidebook_welcome");
            return true;
        }

        if (!sender.hasPermission("rituals.give")) {
            Messages.send(sender, plugin.getPluginConfig().noPermission());
            return true;
        }
        if (!(sender instanceof Player player)) {
            Messages.send(sender, "&cGive commands are player-only.");
            return true;
        }

        double cost = plugin.getPluginConfig().getGiveTotemSetCost();
        if (cost > 0 && !plugin.getVaultHook().charge(player, cost)) {
            return true;
        }

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

    private boolean handleGuide(CommandSender sender, String[] args) {
        if (!sender.hasPermission("rituals.use")) {
            Messages.send(sender, plugin.getPluginConfig().noPermission());
            return true;
        }
        if (args.length < 2) {
            if (sender instanceof Player player) {
                GuideHubMenu.open(plugin, player);
            } else {
                RecipeChatGuide.sendHub(sender);
            }
            return true;
        }
        String topic = args[1].toLowerCase(Locale.ROOT);
        return switch (topic) {
            case "recipes", "recipe", "gui" -> {
                if (sender instanceof Player player) {
                    GuideHubMenu.open(plugin, player);
                } else {
                    RecipeChatGuide.sendHub(sender);
                }
                yield true;
            }
            case "totem" -> {
                if (args.length < 3) {
                    Messages.send(sender, "&eUsage: /rituals guide totem <wood|copper|iron|gold|diamond|netherite>");
                } else {
                    RecipeChatGuide.sendTotemTier(sender, args[2]);
                }
                yield true;
            }
            case "scrying", "glass" -> {
                RecipeChatGuide.sendRecipe(sender, com.rituals.plugin.recipe.RitualRecipeCatalog.scryingGlass());
                yield true;
            }
            case "play", "help" -> {
                RecipeChatGuide.sendPlayGuide(sender);
                yield true;
            }
            default -> {
                RecipeChatGuide.sendHub(sender);
                yield true;
            }
        };
    }

    private boolean handleAdmin(CommandSender sender, String[] args) {
        if (!sender.hasPermission("rituals.admin")) {
            Messages.send(sender, plugin.getPluginConfig().noPermission());
            return true;
        }
        if (args.length < 2 || args[1].equalsIgnoreCase("gui") || args[1].equalsIgnoreCase("menu")) {
            if (sender instanceof Player player) {
                AdminHubMenu.open(plugin, player);
            } else {
                Messages.send(sender, "&cAdmin GUI is player-only.");
            }
            return true;
        }
        String action = String.join("_", Arrays.copyOfRange(args, 1, args.length)).toLowerCase(Locale.ROOT);
        if (action.equals("cleanup_totem_artifacts")) {
            int removed = TotemArtifactCleanup.cleanupOrphanDisplays();
            Messages.send(sender, plugin.getPluginConfig().prefix(
                    "&aRemoved &f" + removed + " &aorphaned totem display entit"
                            + (removed == 1 ? "y" : "ies")
                            + "&a. Break and re-place any totem that still looks wrong."));
            return true;
        }
        if (action.equals("refresh_totem_visuals")) {
            if (sender instanceof Player player) {
                plugin.getDatapackBridge().runFunction(player, "rituals:admin/refresh_totem_visuals");
            } else {
                plugin.getDatapackBridge().runFunctionAsConsole("rituals:admin/refresh_totem_visuals");
            }
            Messages.send(sender, plugin.getPluginConfig().prefix("&aRan refresh_totem_visuals."));
            return true;
        }
        if (sender instanceof Player player) {
            plugin.getDatapackBridge().runFunction(player, "rituals:admin/" + action);
        } else {
            plugin.getDatapackBridge().runFunctionAsConsole("rituals:admin/" + action);
        }
        Messages.send(sender, plugin.getPluginConfig().prefix("&aRan rituals:admin/" + action));
        return true;
    }

    @Override
    public @Nullable List<String> onTabComplete(@NotNull CommandSender sender, @NotNull Command command,
                                              @NotNull String alias, @NotNull String[] args) {
        if (args.length == 1) {
            return filter(ROOT_SUBS, args[0]);
        }
        if (args.length == 2 && args[0].equalsIgnoreCase("guide")) {
            return filter(List.of("recipes", "totem", "scrying", "play"), args[1]);
        }
        if (args.length == 3 && args[0].equalsIgnoreCase("guide") && args[1].equalsIgnoreCase("totem")) {
            return filter(List.of("wood", "copper", "iron", "gold", "diamond", "netherite"), args[2]);
        }
        if (args.length == 2 && args[0].equalsIgnoreCase("give")) {
            return filter(List.of("all", "guidebook", "welcome", "basic", "copper", "iron", "gold", "advanced", "netherite"), args[1]);
        }
        if (args.length == 2 && args[0].equalsIgnoreCase("soul")) {
            return filter(List.of("info", "rename"), args[1]);
        }
        if (args.length >= 2 && args[0].equalsIgnoreCase("admin")) {
            return filter(List.of(
                    "gui", "menu",
                    "cleanup_totem_artifacts", "refresh_totem_visuals",
                    "enable_kiwi_mode", "disable_kiwi_mode",
                    "enable_debug_mode", "disable_debug_mode"
            ), args[1]);
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
