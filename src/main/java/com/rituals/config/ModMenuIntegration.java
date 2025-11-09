package com.rituals.config;

import com.terraformersmc.modmenu.api.ConfigScreenFactory;
import com.terraformersmc.modmenu.api.ModMenuApi;
import net.minecraft.client.gui.screen.Screen;

/**
 * ModMenu integration for Rituals mod
 * Provides configuration screen access through ModMenu
 * This is a client-side only class
 */
public class ModMenuIntegration implements ModMenuApi {
    
    @Override
    public ConfigScreenFactory<?> getModConfigScreenFactory() {
        return RitualsConfigScreenBuilder::buildScreen;
    }
}

