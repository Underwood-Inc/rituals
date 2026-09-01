package com.rituals.plugin.command;

import com.shirecraft.bukkit.chat.ChatSections;
import com.shirecraft.bukkit.chat.CommandClickSupport;
import com.shirecraft.bukkit.chat.CommandFeedback;
import com.shirecraft.bukkit.chat.TabCompleteFilters;

import com.rituals.plugin.RitualsPlugin;
import com.rituals.plugin.admin.AdminHubMenu;
import com.rituals.plugin.admin.TotemArtifactCleanup;
import com.rituals.plugin.config.ConfigMenu;
import com.rituals.plugin.guide.RecipeChatGuide;
import com.rituals.plugin.gui.GuideHubMenu;
import net.kyori.adventure.text.Component;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.command.TabCompleter;
import org.bukkit.entity.Player;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

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
                CommandFeedback.send(sender, "&cUnknown subcommand. Use /rituals help");
                yield true;
            }
        };
    }

    private void sendHelp(CommandSender sender) {
        if (sender instanceof Player player) {
            plugin.getDatapackBridge().runFunction(player, "rituals:help");
            return;
        }
        for (Component line : ChatSections.blockComponents("Rituals", List.of(
                ChatSections.bulletComponent("/rituals help", "guidebook + command list", plugin),
                ChatSections.bulletComponent("/rituals config", "chest config GUI (rituals.config)", plugin),
                ChatSections.bulletComponent("/rituals reload", "reload plugin + datapack config", plugin),
                ChatSections.bulletComponent("/rituals give welcome", "enchanted guidebook (rituals.admin)", plugin),
                ChatSections.bulletComponent("/rituals give all", "totems + guidebook (rituals.give)", plugin),
                ChatSections.bulletComponent("/rituals soul info", "soul weapon stats (rituals.soul)", plugin),
                ChatSections.bulletComponent("/rituals guide", "crafting chest GUI + chat recipes", plugin),
                ChatSections.bulletComponent("/rituals admin", "admin hub GUI (rituals.admin)", plugin),
                CommandClickSupport.embedInGrayText(
                    "Gameplay requires the Rituals datapack (bundled or manual).", plugin)
        ))) {
            CommandFeedback.send(sender, line);
        }
    }

    private boolean handleConfig(CommandSender sender) {
        if (!sender.hasPermission("rituals.config")) {
            CommandFeedback.send(sender, plugin.getPluginConfig().noPermission());
            return true;
        }
        if (!(sender instanceof Player player)) {
            CommandFeedback.send(sender, "&cConfig GUI is player-only.");
            return true;
        }
        ConfigMenu.open(plugin, player);
        return true;
    }

    private boolean handleReload(CommandSender sender) {
        if (!sender.hasPermission("rituals.config")) {
            CommandFeedback.send(sender, plugin.getPluginConfig().noPermission());
            return true;
        }
        plugin.reloadAll();
        CommandFeedback.send(sender, plugin.getPluginConfig().prefix("&aPlugin and datapack config reloaded."));
        return true;
    }

    private boolean handleGive(CommandSender sender, String[] args) {
        if (args.length < 2) {
            CommandFeedback.send(sender, "&eUsage: /rituals give <all|guidebook|welcome|...>");
            return true;
        }

        String target = args[1].toLowerCase(Locale.ROOT);
        if (target.equals("welcome") || target.equals("guidebook_welcome")) {
            if (!sender.hasPermission("rituals.admin")) {
                CommandFeedback.send(sender, plugin.getPluginConfig().noPermission());
                return true;
            }
            if (!(sender instanceof Player player)) {
                CommandFeedback.send(sender, "&cGive commands are player-only.");
                return true;
            }
            plugin.getDatapackBridge().runFunction(player, "rituals:give/guidebook_welcome");
            return true;
        }

        if (!sender.hasPermission("rituals.give")) {
            CommandFeedback.send(sender, plugin.getPluginConfig().noPermission());
            return true;
        }
        if (!(sender instanceof Player player)) {
            CommandFeedback.send(sender, "&cGive commands are player-only.");
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
            CommandFeedback.send(sender, plugin.getPluginConfig().noPermission());
            return true;
        }
        if (!(sender instanceof Player player)) {
            CommandFeedback.send(sender, "&cSoul commands are player-only.");
            return true;
        }
        if (args.length < 2) {
            CommandFeedback.send(sender, "&eUsage: /rituals soul <info|rename <name>>");
            return true;
        }
        if (args[1].equalsIgnoreCase("info")) {
            plugin.getDatapackBridge().runFunction(player, "rituals:soul/debug_xp");
            return true;
        }
        if (args[1].equalsIgnoreCase("rename")) {
            if (!sender.hasPermission("rituals.soul.rename")) {
                CommandFeedback.send(sender, plugin.getPluginConfig().noPermission());
                return true;
            }
            if (args.length < 3) {
                CommandFeedback.send(sender, "&eUsage: /rituals soul rename <name>");
                return true;
            }
            double cost = plugin.getPluginConfig().getSoulRenameCost();
            if (cost > 0 && !plugin.getVaultHook().charge(player, cost)) {
                return true;
            }
            CommandFeedback.send(sender, plugin.getPluginConfig().prefix(
                    "&eRename soul weapons at an anvil, or hold the item and use datapack sync."));
            return true;
        }
        CommandFeedback.send(sender, "&cUnknown soul subcommand.");
        return true;
    }

    private boolean handleGuide(CommandSender sender, String[] args) {
        if (!sender.hasPermission("rituals.use")) {
            CommandFeedback.send(sender, plugin.getPluginConfig().noPermission());
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
                    CommandFeedback.send(sender, "&eUsage: /rituals guide totem <wood|copper|iron|gold|diamond|netherite>");
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
            CommandFeedback.send(sender, plugin.getPluginConfig().noPermission());
            return true;
        }
        if (args.length < 2 || args[1].equalsIgnoreCase("gui") || args[1].equalsIgnoreCase("menu")) {
            if (sender instanceof Player player) {
                AdminHubMenu.open(plugin, player);
            } else {
                CommandFeedback.send(sender, "&cAdmin GUI is player-only.");
            }
            return true;
        }
        String action = String.join("_", Arrays.copyOfRange(args, 1, args.length)).toLowerCase(Locale.ROOT);
        if (action.equals("cleanup_totem_artifacts") || action.equals("purgegarbage") || action.equals("purge_garbage")) {
            TotemArtifactCleanup.Result result = TotemArtifactCleanup.purge();
            CommandFeedback.send(sender, plugin.getPluginConfig().prefix(
                    "&aPurged &f" + result.total() + " &amagenta display entit"
                            + (result.total() == 1 ? "y" : "ies")
                            + " &7(item_visual=" + result.itemVisual()
                            + ", rp=" + result.itemVisualRp()
                            + ", fungus=" + result.itemFungus()
                            + ", new_visual=" + result.itemNewVisual()
                            + ", rituals.id=" + result.itemRitualsId() + ")"));
            if (result.total() == 0) {
                CommandFeedback.send(sender, plugin.getPluginConfig().prefix(
                        "&eNo matching orphans found. If pink cubes remain, your server may still be running the old datapack that spawns them — replace rituals.zip and restart."));
            }
            return true;
        }
        if (action.equals("count_totem_garbage")) {
            var counts = TotemArtifactCleanup.countOrphans();
            int total = counts.values().stream().mapToInt(Integer::intValue).sum();
            CommandFeedback.send(sender, plugin.getPluginConfig().prefix("&fOrphan scan: &e" + total + " &7" + counts));
            return true;
        }
        if (action.equals("refresh_totem_visuals")) {
            if (sender instanceof Player player) {
                plugin.getDatapackBridge().runFunction(player, "rituals:admin/refresh_totem_visuals");
            } else {
                plugin.getDatapackBridge().runFunctionAsConsole("rituals:admin/refresh_totem_visuals");
            }
            CommandFeedback.send(sender, plugin.getPluginConfig().prefix("&aRan refresh_totem_visuals."));
            return true;
        }
        if (sender instanceof Player player) {
            plugin.getDatapackBridge().runFunction(player, "rituals:admin/" + action);
        } else {
            plugin.getDatapackBridge().runFunctionAsConsole("rituals:admin/" + action);
        }
        CommandFeedback.send(sender, plugin.getPluginConfig().prefix("&aRan rituals:admin/" + action));
        return true;
    }

    @Override
    public @Nullable List<String> onTabComplete(@NotNull CommandSender sender, @NotNull Command command,
                                              @NotNull String alias, @NotNull String[] args) {
        if (args.length == 1) {
            return TabCompleteFilters.prefixFilter(ROOT_SUBS, args[0]);
        }
        if (args.length == 2 && args[0].equalsIgnoreCase("guide")) {
            return TabCompleteFilters.prefixFilter(List.of("recipes", "totem", "scrying", "play"), args[1]);
        }
        if (args.length == 3 && args[0].equalsIgnoreCase("guide") && args[1].equalsIgnoreCase("totem")) {
            return TabCompleteFilters.prefixFilter(List.of("wood", "copper", "iron", "gold", "diamond", "netherite"), args[2]);
        }
        if (args.length == 2 && args[0].equalsIgnoreCase("give")) {
            return TabCompleteFilters.prefixFilter(List.of("all", "guidebook", "welcome", "basic", "copper", "iron", "gold", "advanced", "netherite"), args[1]);
        }
        if (args.length == 2 && args[0].equalsIgnoreCase("soul")) {
            return TabCompleteFilters.prefixFilter(List.of("info", "rename"), args[1]);
        }
        if (args.length >= 2 && args[0].equalsIgnoreCase("admin")) {
            return TabCompleteFilters.prefixFilter(List.of(
                    "gui", "menu",
                    "cleanup_totem_artifacts", "purgegarbage", "purge_garbage", "count_totem_garbage",
                    "refresh_totem_visuals",
                    "enable_kiwi_mode", "disable_kiwi_mode",
                    "enable_debug_mode", "disable_debug_mode"
            ), args[1]);
        }
        return Collections.emptyList();
    }
}
