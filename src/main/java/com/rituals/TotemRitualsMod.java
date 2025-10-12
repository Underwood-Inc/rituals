package com.rituals;

import net.fabricmc.api.ModInitializer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Totem Rituals - Fire Sacrifice Edition
 * 
 * A Minecraft mod that introduces mystical totems and powerful ritual magic.
 * Place totems, perform fire sacrifices, and unlock powerful effects!
 * 
 * This mod is a datapack/resourcepack wrapper that automatically loads
 * the rituals system into any world without manual installation.
 */
public class TotemRitualsMod implements ModInitializer {
    public static final String MOD_ID = "rituals";
    public static final Logger LOGGER = LoggerFactory.getLogger(MOD_ID);

    @Override
    public void onInitialize() {
        LOGGER.info("===========================================");
        LOGGER.info("  Totem Rituals - Fire Sacrifice Edition  ");
        LOGGER.info("===========================================");
        LOGGER.info("Mod loaded successfully!");
        LOGGER.info("Datapack and resource pack auto-installed.");
        LOGGER.info("Use /function rituals:help for commands.");
        LOGGER.info("===========================================");
    }
}

