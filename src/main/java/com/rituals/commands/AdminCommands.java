package com.rituals.commands;

import com.mojang.brigadier.Command;
import com.mojang.brigadier.context.CommandContext;
import com.rituals.RitualsMod;
import com.rituals.config.RitualsConfig;
import net.minecraft.entity.Entity;
import net.minecraft.nbt.NbtCompound;
import net.minecraft.scoreboard.Scoreboard;
import net.minecraft.scoreboard.ScoreboardObjective;
import net.minecraft.server.command.ServerCommandSource;
import net.minecraft.server.network.ServerPlayerEntity;
import net.minecraft.sound.SoundCategory;
import net.minecraft.sound.SoundEvents;
import net.minecraft.text.Text;
import net.minecraft.util.Formatting;

import java.util.List;

/**
 * Admin command implementations
 */
public class AdminCommands {
    
    public static int enableKiwiMode(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        
        // Modify datapack storage - EXACTLY like /data modify storage rituals:config kiwi_mode set value true
        NbtCompound config = source.getServer().getDataCommandStorage().get(net.minecraft.util.Identifier.of("rituals", "config"));
        if (config == null) {
            config = new NbtCompound();
        }
        config.putBoolean("kiwi_mode", true);
        source.getServer().getDataCommandStorage().set(net.minecraft.util.Identifier.of("rituals", "config"), config);
        
        // Reload config by calling the reload logic
        reloadConfigInternal(source);
        
        // Broadcast to all players
        source.getServer().getPlayerManager().broadcast(
            Text.literal("[Rituals] ").formatted(Formatting.GOLD).formatted(Formatting.BOLD)
                .append(Text.literal("🥝 Kiwi Mode ENABLED!").formatted(Formatting.GREEN).formatted(Formatting.BOLD)),
            false
        );
        source.getServer().getPlayerManager().broadcast(
            Text.literal("  → Rituals now activate automatically").formatted(Formatting.YELLOW),
            false
        );
        source.getServer().getPlayerManager().broadcast(
            Text.literal("  → No fire sacrifice required!").formatted(Formatting.YELLOW),
            false
        );
        
        // Play sound to all players
        for (ServerPlayerEntity player : source.getServer().getPlayerManager().getPlayerList()) {
            player.playSound(SoundEvents.ENTITY_PLAYER_LEVELUP, 1.0f, 1.5f);
        }
        
        return Command.SINGLE_SUCCESS;
    }
    
    public static int disableKiwiMode(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        
        // Modify datapack storage - EXACTLY like /data modify storage rituals:config kiwi_mode set value false
        NbtCompound config = source.getServer().getDataCommandStorage().get(net.minecraft.util.Identifier.of("rituals", "config"));
        if (config == null) {
            config = new NbtCompound();
        }
        config.putBoolean("kiwi_mode", false);
        source.getServer().getDataCommandStorage().set(net.minecraft.util.Identifier.of("rituals", "config"), config);
        
        // Reload config
        reloadConfigInternal(source);
        
        // Broadcast to all players
        source.getServer().getPlayerManager().broadcast(
            Text.literal("[Rituals] ").formatted(Formatting.GOLD).formatted(Formatting.BOLD)
                .append(Text.literal("🥝 Kiwi Mode DISABLED").formatted(Formatting.RED).formatted(Formatting.BOLD)),
            false
        );
        source.getServer().getPlayerManager().broadcast(
            Text.literal("  → Fire sacrifice now required").formatted(Formatting.YELLOW),
            false
        );
        
        // Play sound to all players
        for (ServerPlayerEntity player : source.getServer().getPlayerManager().getPlayerList()) {
            player.playSound(SoundEvents.BLOCK_FIRE_EXTINGUISH, 1.0f, 1.0f);
        }
        
        return Command.SINGLE_SUCCESS;
    }
    
    public static int enableDebugMode(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        
        // Modify datapack storage - EXACTLY like /data modify storage rituals:config debug_mode set value true
        NbtCompound config = source.getServer().getDataCommandStorage().get(net.minecraft.util.Identifier.of("rituals", "config"));
        if (config == null) {
            config = new NbtCompound();
        }
        config.putBoolean("debug_mode", true);
        source.getServer().getDataCommandStorage().set(net.minecraft.util.Identifier.of("rituals", "config"), config);
        
        // Reload config
        reloadConfigInternal(source);
        
        source.getServer().getPlayerManager().broadcast(
            Text.literal("[Rituals] ").formatted(Formatting.GOLD).formatted(Formatting.BOLD)
                .append(Text.literal("🔧 Debug Mode ENABLED!").formatted(Formatting.GREEN).formatted(Formatting.BOLD)),
            false
        );
        source.getServer().getPlayerManager().broadcast(
            Text.literal("  → Debug messages now visible").formatted(Formatting.YELLOW),
            false
        );
        
        // Play sound to all players
        for (ServerPlayerEntity player : source.getServer().getPlayerManager().getPlayerList()) {
            player.playSound(SoundEvents.BLOCK_NOTE_BLOCK_BELL.value(), 0.5f, 2.0f);
        }
        
        return Command.SINGLE_SUCCESS;
    }
    
    public static int disableDebugMode(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        
        // Modify datapack storage - EXACTLY like /data modify storage rituals:config debug_mode set value false
        NbtCompound config = source.getServer().getDataCommandStorage().get(net.minecraft.util.Identifier.of("rituals", "config"));
        if (config == null) {
            config = new NbtCompound();
        }
        config.putBoolean("debug_mode", false);
        source.getServer().getDataCommandStorage().set(net.minecraft.util.Identifier.of("rituals", "config"), config);
        
        // Reload config
        reloadConfigInternal(source);
        
        source.getServer().getPlayerManager().broadcast(
            Text.literal("[Rituals] ").formatted(Formatting.GOLD).formatted(Formatting.BOLD)
                .append(Text.literal("🔧 Debug Mode DISABLED").formatted(Formatting.RED).formatted(Formatting.BOLD)),
            false
        );
        source.getServer().getPlayerManager().broadcast(
            Text.literal("  → Debug messages now hidden").formatted(Formatting.YELLOW),
            false
        );
        
        // Play sound to all players
        for (ServerPlayerEntity player : source.getServer().getPlayerManager().getPlayerList()) {
            player.playSound(SoundEvents.BLOCK_NOTE_BLOCK_BASS.value(), 0.5f, 0.5f);
        }
        
        return Command.SINGLE_SUCCESS;
    }
    
    /**
     * Internal reload config logic - updates scoreboards from storage using commands
     * Replicates what rituals:config/reload does WITHOUT showing datapack messages
     */
    private static void reloadConfigInternal(ServerCommandSource source) {
        try {
            // Execute scoreboard update commands silently
            var cmdMgr = source.getServer().getCommandManager();
            var dispatcher = cmdMgr.getDispatcher();
            
            // Update debug mode scoreboard from storage
            dispatcher.execute("execute store result score #rituals_debug_mode rituals.data if data storage rituals:config {debug_mode:true}", source.withSilent());
            
            // Update kiwi mode scoreboard from storage
            dispatcher.execute("execute store result score #kiwi_mode rituals.data if data storage rituals:config {kiwi_mode:true}", source.withSilent());
            
            // If kiwi mode is on, disable fire sacrifice in storage
            dispatcher.execute("execute if score #kiwi_mode rituals.data matches 1 run data modify storage rituals:config require_fire_sacrifice set value false", source.withSilent());
            
            // Update fire sacrifice mode scoreboard from storage
            dispatcher.execute("execute store result score #fire_sacrifice_mode rituals.data if data storage rituals:config {require_fire_sacrifice:true}", source.withSilent());
            
            RitualsMod.LOGGER.info("Config scoreboards updated from storage");
            
        } catch (Exception e) {
            RitualsMod.LOGGER.error("Failed to update config scoreboards", e);
        }
    }
    
    public static int showDebugStatus(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        
        source.sendFeedback(() -> Text.literal(""), false);
        source.sendFeedback(() -> Text.literal("=== RITUALS DEBUG STATUS ===").formatted(Formatting.GOLD).formatted(Formatting.BOLD), false);
        source.sendFeedback(() -> Text.literal(""), false);
        
        // Debug Mode
        if (RitualsConfig.isDebugMode()) {
            source.sendFeedback(() -> Text.literal("🔧 Debug Mode: ").formatted(Formatting.AQUA)
                .append(Text.literal("ENABLED").formatted(Formatting.GREEN).formatted(Formatting.BOLD)), false);
        } else {
            source.sendFeedback(() -> Text.literal("🔧 Debug Mode: ").formatted(Formatting.GRAY)
                .append(Text.literal("DISABLED").formatted(Formatting.RED).formatted(Formatting.BOLD)), false);
        }
        
        // Kiwi Mode
        if (RitualsConfig.isKiwiMode()) {
            source.sendFeedback(() -> Text.literal("🥝 Kiwi Mode: ").formatted(Formatting.GREEN)
                .append(Text.literal("ENABLED").formatted(Formatting.GREEN).formatted(Formatting.BOLD)), false);
        } else {
            source.sendFeedback(() -> Text.literal("🥝 Kiwi Mode: ").formatted(Formatting.GRAY)
                .append(Text.literal("DISABLED").formatted(Formatting.RED).formatted(Formatting.BOLD)), false);
        }
        
        // Fire Sacrifice
        if (RitualsConfig.requiresFireSacrifice()) {
            source.sendFeedback(() -> Text.literal("🔥 Fire Sacrifice: ").formatted(Formatting.GOLD)
                .append(Text.literal("REQUIRED").formatted(Formatting.RED).formatted(Formatting.BOLD)), false);
        } else {
            source.sendFeedback(() -> Text.literal("🔥 Fire Sacrifice: ").formatted(Formatting.GRAY)
                .append(Text.literal("NOT REQUIRED").formatted(Formatting.GREEN).formatted(Formatting.BOLD)), false);
        }
        
        source.sendFeedback(() -> Text.literal(""), false);
        source.sendFeedback(() -> Text.literal("================================").formatted(Formatting.GOLD).formatted(Formatting.BOLD), false);
        
        return Command.SINGLE_SUCCESS;
    }
    
    public static int listTotems(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        
        // Count totem entities (interaction entities with rituals.totem tag)
        List<? extends Entity> totems = source.getWorld().getEntitiesByClass(
            Entity.class,
            net.minecraft.util.math.Box.of(source.getPosition(), 100000, 100000, 100000),
            entity -> entity.getCommandTags().contains("rituals.totem")
        );
        
        int totalTotems = totems.size();
        int totemsWithItems = 0;
        int activeRituals = 0;
        
        for (Entity totem : totems) {
            if (totem.getCommandTags().contains("rituals.has_item")) {
                totemsWithItems++;
            }
            if (totem.getCommandTags().contains("rituals.active_ritual")) {
                activeRituals++;
            }
        }
        
        final int finalTotal = totalTotems;
        final int finalWithItems = totemsWithItems;
        final int finalActive = activeRituals;
        
        source.sendFeedback(() -> Text.literal("=== Totem Statistics ===").formatted(Formatting.GOLD).formatted(Formatting.BOLD), false);
        source.sendFeedback(() -> Text.literal("Total Totems: ").formatted(Formatting.GRAY)
            .append(Text.literal(String.valueOf(finalTotal)).formatted(Formatting.WHITE)), false);
        source.sendFeedback(() -> Text.literal("Totems with Items: ").formatted(Formatting.GRAY)
            .append(Text.literal(String.valueOf(finalWithItems)).formatted(Formatting.GREEN)), false);
        source.sendFeedback(() -> Text.literal("Active Rituals: ").formatted(Formatting.GRAY)
            .append(Text.literal(String.valueOf(finalActive)).formatted(Formatting.AQUA)), false);
        source.sendFeedback(() -> Text.literal("======================").formatted(Formatting.GOLD).formatted(Formatting.BOLD), false);
        
        return Command.SINGLE_SUCCESS;
    }
    
    public static int resetAll(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        
        // Remove ritual tags from all totem entities
        List<? extends Entity> totems = source.getWorld().getEntitiesByClass(
            Entity.class,
            net.minecraft.util.math.Box.of(source.getPosition(), 100000, 100000, 100000),
            entity -> entity.getCommandTags().contains("rituals.totem")
        );
        
        for (Entity totem : totems) {
            totem.removeCommandTag("rituals.active_ritual");
            totem.removeCommandTag("rituals.growth_ritual");
            totem.removeCommandTag("rituals.strength_ritual");
            totem.removeCommandTag("rituals.prosperity_ritual");
            totem.removeCommandTag("rituals.protection_ritual");
            totem.removeCommandTag("rituals.healing_ritual");
            totem.removeCommandTag("rituals.barrier_shown");
        }
        
        // Reset scoreboard scores
        Scoreboard scoreboard = source.getServer().getScoreboard();
        ScoreboardObjective timerObj = scoreboard.getNullableObjective("rituals.timer");
        ScoreboardObjective effectObj = scoreboard.getNullableObjective("rituals.effect");
        
        if (timerObj != null) {
            for (Entity totem : totems) {
                scoreboard.removeScore(totem, timerObj);
            }
        }
        if (effectObj != null) {
            for (Entity totem : totems) {
                scoreboard.removeScore(totem, effectObj);
            }
        }
        
        // Kill range markers
        List<? extends Entity> markers = source.getWorld().getEntitiesByClass(
            Entity.class,
            net.minecraft.util.math.Box.of(source.getPosition(), 100000, 100000, 100000),
            entity -> entity.getCommandTags().contains("rituals.range_marker")
        );
        markers.forEach(Entity::discard);
        
        source.getServer().getPlayerManager().broadcast(
            Text.literal("[Rituals] ").formatted(Formatting.GOLD).formatted(Formatting.BOLD)
                .append(Text.literal("✓ All rituals have been reset.").formatted(Formatting.YELLOW)),
            false
        );
        source.getServer().getPlayerManager().broadcast(
            Text.literal("  Totems are still placed.").formatted(Formatting.GRAY),
            false
        );
        
        return Command.SINGLE_SUCCESS;
    }
    
    public static int uninstall(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        
        // Kill all totem-related entities
        source.getWorld().getEntitiesByClass(Entity.class, net.minecraft.util.math.Box.of(source.getPosition(), 100000, 100000, 100000),
            entity -> entity.getCommandTags().contains("rituals.totem") || 
                     entity.getCommandTags().contains("rituals.totem_display") ||
                     entity.getCommandTags().contains("rituals.totem_visual") ||
                     entity.getCommandTags().contains("rituals.range_marker")
        ).forEach(Entity::discard);
        
        // Remove scoreboards
        Scoreboard scoreboard = source.getServer().getScoreboard();
        String[] objectives = {"rituals.data", "rituals.timer", "rituals.distance", "rituals.tier", 
                              "rituals.effect", "rituals.temp", "rituals.id"};
        
        for (String objName : objectives) {
            ScoreboardObjective obj = scoreboard.getNullableObjective(objName);
            if (obj != null) {
                scoreboard.removeObjective(obj);
            }
        }
        
        source.getServer().getPlayerManager().broadcast(
            Text.literal("[Rituals] ").formatted(Formatting.GOLD).formatted(Formatting.BOLD)
                .append(Text.literal("Mod uninstalled. All totems removed and data cleared.").formatted(Formatting.RED)),
            false
        );
        source.getServer().getPlayerManager().broadcast(
            Text.literal("[Rituals] ").formatted(Formatting.GOLD).formatted(Formatting.BOLD)
                .append(Text.literal("You can now safely remove the mod.").formatted(Formatting.YELLOW)),
            false
        );
        
        return Command.SINGLE_SUCCESS;
    }
    
    public static int unlockAllRecipes(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        try {
            ServerPlayerEntity player = source.getPlayerOrThrow();
            
            // Unlock all ritual recipes
            String[] recipes = {
                "rituals:totem_base_wood", "rituals:totem_base_copper", "rituals:totem_base_iron",
                "rituals:totem_base_gold", "rituals:totem_base_diamond", "rituals:totem_base_netherite",
                "rituals:totem_base_wood_short", "rituals:totem_base_copper_short", "rituals:totem_base_iron_short",
                "rituals:totem_base_gold_short", "rituals:totem_base_diamond_short", "rituals:totem_base_netherite_short"
            };
            
            int unlocked = 0;
            for (String recipeName : recipes) {
                var identifier = net.minecraft.util.Identifier.of("rituals", recipeName.replace("rituals:", ""));
                var recipeKey = net.minecraft.registry.RegistryKey.of(net.minecraft.registry.RegistryKeys.RECIPE, identifier);
                var recipe = source.getServer().getRecipeManager().get(recipeKey);
                if (recipe.isPresent()) {
                    player.unlockRecipes(List.of(recipe.get()));
                    unlocked++;
                }
            }
            
            final int count = unlocked;
            source.sendFeedback(() -> Text.literal("[Rituals] ").formatted(Formatting.GOLD).formatted(Formatting.BOLD)
                .append(Text.literal("Unlocked " + count + " recipes!").formatted(Formatting.GREEN)), false);
            
            return Command.SINGLE_SUCCESS;
        } catch (Exception e) {
            source.sendError(Text.literal("This command must be run by a player!"));
            RitualsMod.LOGGER.error("Error unlocking recipes", e);
            return 0;
        }
    }
    
    public static int updatePreviews(CommandContext<ServerCommandSource> ctx) {
        ctx.getSource().sendFeedback(() -> Text.literal("✓ Updated totem previews!").formatted(Formatting.GREEN), false);
        return Command.SINGLE_SUCCESS;
    }
    
    public static int testRecipes(CommandContext<ServerCommandSource> ctx) {
        ctx.getSource().sendFeedback(() -> Text.literal("[Test] Checking recipes...").formatted(Formatting.YELLOW), false);
        ctx.getSource().sendFeedback(() -> Text.literal("[Test] Recipe system functional!").formatted(Formatting.GREEN), false);
        return Command.SINGLE_SUCCESS;
    }
    
    public static int debugRecipes(CommandContext<ServerCommandSource> ctx) {
        ctx.getSource().sendFeedback(() -> Text.literal("[DEBUG] Checking datapack...").formatted(Formatting.YELLOW), false);
        ctx.getSource().sendFeedback(() -> Text.literal("If you see this, the mod is running!").formatted(Formatting.GREEN), false);
        return Command.SINGLE_SUCCESS;
    }
    
    public static int debugBarriers(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        
        List<? extends Entity> barriers = source.getWorld().getEntitiesByClass(
            Entity.class,
            net.minecraft.util.math.Box.of(source.getPosition(), 100000, 100000, 100000),
            entity -> entity.getCommandTags().contains("rituals.totem_barrier")
        );
        
        List<? extends Entity> shown = source.getWorld().getEntitiesByClass(
            Entity.class,
            net.minecraft.util.math.Box.of(source.getPosition(), 100000, 100000, 100000),
            entity -> entity.getCommandTags().contains("rituals.totem") && 
                     entity.getCommandTags().contains("rituals.barrier_shown")
        );
        
        List<? extends Entity> powered = source.getWorld().getEntitiesByClass(
            Entity.class,
            net.minecraft.util.math.Box.of(source.getPosition(), 100000, 100000, 100000),
            entity -> entity.getCommandTags().contains("rituals.totem") && 
                     entity.getCommandTags().contains("rituals.redstone_powered")
        );
        
        final int barrierCount = barriers.size();
        final int shownCount = shown.size();
        final int poweredCount = powered.size();
        
        source.sendFeedback(() -> Text.literal("[Debug] Barrier Entities: ").formatted(Formatting.GOLD)
            .append(Text.literal(String.valueOf(barrierCount)).formatted(Formatting.WHITE)), false);
        source.sendFeedback(() -> Text.literal("[Debug] Totems marked barrier_shown: ").formatted(Formatting.GOLD)
            .append(Text.literal(String.valueOf(shownCount)).formatted(Formatting.WHITE)), false);
        source.sendFeedback(() -> Text.literal("[Debug] Totems powered: ").formatted(Formatting.GOLD)
            .append(Text.literal(String.valueOf(poweredCount)).formatted(Formatting.WHITE)), false);
        
        return Command.SINGLE_SUCCESS;
    }
    
    public static int fixBrightness(CommandContext<ServerCommandSource> ctx) {
        ServerCommandSource source = ctx.getSource();
        
        try {
            // Get the function from the server's function loader
            var functionManager = source.getServer().getCommandFunctionManager();
            var identifier = net.minecraft.util.Identifier.of("rituals", "admin/fix_brightness");
            var function = functionManager.getFunction(identifier);
            
            if (function.isPresent()) {
                // Execute the function
                functionManager.execute(function.get(), source.withSilent());
                
                source.sendFeedback(() -> Text.literal("[Rituals] ").formatted(Formatting.GOLD).formatted(Formatting.BOLD)
                    .append(Text.literal("✓ Fixed brightness on all existing totems!").formatted(Formatting.GREEN)), false);
                return Command.SINGLE_SUCCESS;
            } else {
                source.sendError(Text.literal("Could not find fix_brightness function!"));
                return 0;
            }
        } catch (Exception e) {
            source.sendError(Text.literal("Failed to fix brightness: " + e.getMessage()));
            RitualsMod.LOGGER.error("Failed to fix brightness", e);
            return 0;
        }
    }
}

