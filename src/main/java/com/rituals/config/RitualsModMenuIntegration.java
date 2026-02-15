package com.rituals.config;

import com.terraformersmc.modmenu.api.ConfigScreenFactory;
import com.terraformersmc.modmenu.api.ModMenuApi;

/**
 * ModMenu integration for Rituals.
 * Provides a config screen when ModMenu is installed.
 * Uses Cloth Config for rich GUI if available, otherwise shows simple screen.
 */
public class RitualsModMenuIntegration implements ModMenuApi {
    
    @Override
    public ConfigScreenFactory<?> getModConfigScreenFactory() {
        return parent -> {
            try {
                Class.forName("me.shedaniel.clothconfig2.api.ConfigBuilder");
                return RitualsClothConfigScreen.create(parent);
            } catch (Throwable e) {
                return new RitualsSimpleConfigScreen(parent);
            }
        };
    }
}
