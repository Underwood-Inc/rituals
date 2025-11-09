package com.rituals.config;

import me.shedaniel.clothconfig2.api.ConfigBuilder;
import me.shedaniel.clothconfig2.api.ConfigCategory;
import me.shedaniel.clothconfig2.api.ConfigEntryBuilder;
import net.minecraft.client.gui.screen.Screen;
import net.minecraft.text.Text;

/**
 * Builds the Rituals config screen using Cloth Config API (like AFKFish does)
 */
public class RitualsConfigScreenBuilder {
    
    public static Screen buildScreen(Screen parentScreen) {
        ConfigBuilder builder = ConfigBuilder.create()
                .setParentScreen(parentScreen)
                .setTitle(Text.literal("Rituals Configuration"))
                .transparentBackground()
                .setSavingRunnable(() -> {
                    RitualsConfig.save();
                    
                    // If we're in a world, sync to server immediately
                    if (net.minecraft.client.MinecraftClient.getInstance().player != null) {
                        var networkHandler = net.minecraft.client.MinecraftClient.getInstance().player.networkHandler;
                        try {
                            networkHandler.sendChatCommand("data modify storage rituals:registry single_rituals[{id:\"growth\"}].item set value \"" + RitualsConfig.growthItem + "\"");
                            networkHandler.sendChatCommand("data modify storage rituals:registry single_rituals[{id:\"strength\"}].item set value \"" + RitualsConfig.strengthItem + "\"");
                            networkHandler.sendChatCommand("data modify storage rituals:registry single_rituals[{id:\"prosperity\"}].item set value \"" + RitualsConfig.prosperityItem + "\"");
                            networkHandler.sendChatCommand("data modify storage rituals:registry single_rituals[{id:\"protection\"}].item set value \"" + RitualsConfig.protectionItem + "\"");
                            networkHandler.sendChatCommand("data modify storage rituals:registry single_rituals[{id:\"healing\"}].item set value \"" + RitualsConfig.healingItem + "\"");
                            networkHandler.sendChatCommand("data modify storage rituals:registry single_rituals[{id:\"sentry\"}].item set value \"" + RitualsConfig.sentryItem + "\"");
                            networkHandler.sendChatCommand("data modify storage rituals:registry pattern_rituals[{id:\"auto_farming\"}].central_item set value \"" + RitualsConfig.autoFarmingItem + "\"");
                            networkHandler.sendChatCommand("data modify storage rituals:registry pattern_rituals[{id:\"auto_breeding\"}].central_item set value \"" + RitualsConfig.autoBreedingItem + "\"");
                            com.rituals.RitualsMod.LOGGER.info("Config synced to server!");
                        } catch (Exception e) {
                            com.rituals.RitualsMod.LOGGER.error("Failed to sync config to server", e);
                        }
                    }
                });
        
        ConfigEntryBuilder entryBuilder = builder.entryBuilder();
        ConfigCategory ritualCat = builder.getOrCreateCategory(Text.literal("Ritual Items"));
        
        // Single-Totem Rituals
        ritualCat.addEntry(entryBuilder.startStrField(
                Text.literal("Growth Ritual Item"), 
                RitualsConfig.growthItem)
                .setDefaultValue("minecraft:emerald")
                .setTooltip(Text.literal("Item ID for Growth ritual"))
                .setSaveConsumer(newValue -> RitualsConfig.growthItem = newValue)
                .build());
        
        ritualCat.addEntry(entryBuilder.startStrField(
                Text.literal("Strength Ritual Item"), 
                RitualsConfig.strengthItem)
                .setDefaultValue("minecraft:diamond")
                .setTooltip(Text.literal("Item ID for Strength ritual"))
                .setSaveConsumer(newValue -> RitualsConfig.strengthItem = newValue)
                .build());
        
        ritualCat.addEntry(entryBuilder.startStrField(
                Text.literal("Prosperity Ritual Item"), 
                RitualsConfig.prosperityItem)
                .setDefaultValue("minecraft:netherite_block")
                .setTooltip(Text.literal("Item ID for Prosperity ritual"))
                .setSaveConsumer(newValue -> RitualsConfig.prosperityItem = newValue)
                .build());
        
        ritualCat.addEntry(entryBuilder.startStrField(
                Text.literal("Protection Ritual Item"), 
                RitualsConfig.protectionItem)
                .setDefaultValue("minecraft:iron_ingot")
                .setTooltip(Text.literal("Item ID for Protection ritual"))
                .setSaveConsumer(newValue -> RitualsConfig.protectionItem = newValue)
                .build());
        
        ritualCat.addEntry(entryBuilder.startStrField(
                Text.literal("Healing Ritual Item"), 
                RitualsConfig.healingItem)
                .setDefaultValue("minecraft:nether_star")
                .setTooltip(Text.literal("Item ID for Healing ritual"))
                .setSaveConsumer(newValue -> RitualsConfig.healingItem = newValue)
                .build());
        
        ritualCat.addEntry(entryBuilder.startStrField(
                Text.literal("Sentry Ritual Item"), 
                RitualsConfig.sentryItem)
                .setDefaultValue("minecraft:arrow")
                .setTooltip(Text.literal("Item ID for Sentry ritual"))
                .setSaveConsumer(newValue -> RitualsConfig.sentryItem = newValue)
                .build());
        
        // Pattern Rituals
        ConfigCategory patternCat = builder.getOrCreateCategory(Text.literal("Pattern Rituals"));
        
        patternCat.addEntry(entryBuilder.startStrField(
                Text.literal("Auto-Farming Central Item"), 
                RitualsConfig.autoFarmingItem)
                .setDefaultValue("minecraft:diamond_hoe")
                .setTooltip(Text.literal("Central item ID for Auto-Farming pattern ritual"))
                .setSaveConsumer(newValue -> RitualsConfig.autoFarmingItem = newValue)
                .build());
        
        patternCat.addEntry(entryBuilder.startStrField(
                Text.literal("Auto-Breeding Central Item"), 
                RitualsConfig.autoBreedingItem)
                .setDefaultValue("minecraft:wheat")
                .setTooltip(Text.literal("Central item ID for Auto-Breeding pattern ritual"))
                .setSaveConsumer(newValue -> RitualsConfig.autoBreedingItem = newValue)
                .build());
        
        return builder.build();
    }
}

