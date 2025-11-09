package com.rituals;

import com.rituals.config.ConfigSyncHandler;
import net.fabricmc.api.ClientModInitializer;

/**
 * Client-side initialization for Rituals mod
 */
public class RitualsModClient implements ClientModInitializer {
    
    @Override
    public void onInitializeClient() {
        RitualsMod.LOGGER.info("Initializing Rituals client...");
        
        // Register config sync handler
        ConfigSyncHandler.init();
        
        RitualsMod.LOGGER.info("Rituals client initialized!");
    }
}

