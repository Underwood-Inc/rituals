package com.rituals.config;

import com.rituals.RitualsMod;
import net.fabricmc.fabric.api.client.event.lifecycle.v1.ClientTickEvents;
import net.minecraft.client.MinecraftClient;
import net.minecraft.client.network.ClientPlayNetworkHandler;

/**
 * Handles syncing client config to server on world join
 */
public class ConfigSyncHandler {
    private static boolean hasSynced = false;
    
    public static void init() {
        ClientTickEvents.END_CLIENT_TICK.register(client -> {
            if (client.world != null && client.player != null && !hasSynced) {
                syncConfigToServer(client.player.networkHandler);
                hasSynced = true;
            } else if (client.world == null) {
                hasSynced = false; // Reset when leaving world
            }
        });
    }
    
    private static void syncConfigToServer(ClientPlayNetworkHandler networkHandler) {
        try {
            // Sync ritual items to datapack storage via commands
            RitualsMod.LOGGER.info("Syncing client config to server...");
            
            // Use commands to update server-side datapack storage
            networkHandler.sendChatCommand("data modify storage rituals:registry single_rituals[{id:\"growth\"}].item set value \"" + RitualsConfig.growthItem + "\"");
            networkHandler.sendChatCommand("data modify storage rituals:registry single_rituals[{id:\"strength\"}].item set value \"" + RitualsConfig.strengthItem + "\"");
            networkHandler.sendChatCommand("data modify storage rituals:registry single_rituals[{id:\"prosperity\"}].item set value \"" + RitualsConfig.prosperityItem + "\"");
            networkHandler.sendChatCommand("data modify storage rituals:registry single_rituals[{id:\"protection\"}].item set value \"" + RitualsConfig.protectionItem + "\"");
            networkHandler.sendChatCommand("data modify storage rituals:registry single_rituals[{id:\"healing\"}].item set value \"" + RitualsConfig.healingItem + "\"");
            networkHandler.sendChatCommand("data modify storage rituals:registry single_rituals[{id:\"sentry\"}].item set value \"" + RitualsConfig.sentryItem + "\"");
            
            networkHandler.sendChatCommand("data modify storage rituals:registry pattern_rituals[{id:\"auto_farming\"}].central_item set value \"" + RitualsConfig.autoFarmingItem + "\"");
            networkHandler.sendChatCommand("data modify storage rituals:registry pattern_rituals[{id:\"auto_breeding\"}].central_item set value \"" + RitualsConfig.autoBreedingItem + "\"");
            
            RitualsMod.LOGGER.info("Config synced to server!");
        } catch (Exception e) {
            RitualsMod.LOGGER.error("Failed to sync config to server", e);
        }
    }
}

