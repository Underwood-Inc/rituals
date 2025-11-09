package com.rituals.config;

import net.minecraft.client.gui.DrawContext;
import net.minecraft.client.gui.screen.Screen;
import net.minecraft.client.gui.widget.ButtonWidget;
import net.minecraft.client.gui.widget.TextFieldWidget;
import net.minecraft.text.Text;
import net.minecraft.util.Formatting;

/**
 * Configuration screen for Rituals mod
 * Allows editing ritual items through a GUI
 */
public class RitualsConfigScreen extends Screen {
    private final Screen parent;
    private ButtonWidget doneButton;
    private ButtonWidget reloadButton;
    
    // Store label positions and text for rendering
    private static class LabelInfo {
        final Text text;
        final int x;
        final int y;
        final int color;
        
        LabelInfo(Text text, int x, int y, int color) {
            this.text = text;
            this.x = x;
            this.y = y;
            this.color = color;
        }
    }
    
    private java.util.List<LabelInfo> labels = new java.util.ArrayList<>();
    
    public RitualsConfigScreen(Screen parent) {
        super(Text.literal("Rituals Configuration"));
        this.parent = parent;
    }
    
    @Override
    protected void init() {
        super.init();
        
        // Clear labels from previous init
        labels.clear();
        
        // Done button
        this.doneButton = ButtonWidget.builder(Text.literal("Done"), button -> {
            this.client.setScreen(this.parent);
        }).dimensions(this.width / 2 - 154, this.height - 28, 150, 20).build();
        this.addDrawableChild(this.doneButton);
        
        // Reload button
        this.reloadButton = ButtonWidget.builder(Text.literal("Reload Registry"), button -> {
            // Execute reload command
            if (this.client.player != null) {
                this.client.player.networkHandler.sendChatCommand("function rituals:config/registry/load");
            }
        }).dimensions(this.width / 2 + 4, this.height - 28, 150, 20).build();
        this.addDrawableChild(this.reloadButton);
        
        // Add title and subtitle labels
        labels.add(new LabelInfo(this.title, this.width / 2, 15, 0xFFFFFF));
        labels.add(new LabelInfo(
            Text.literal("Configure ritual items and settings").formatted(Formatting.GRAY),
            this.width / 2, 25, 0xCCCCCC));
        
        // Add ritual configuration widgets
        int y = 50;
        int x = this.width / 2 - 200;
        
        // Single-Totem Rituals section header
        y += 25;
        labels.add(new LabelInfo(
            Text.literal("Single-Totem Rituals").formatted(Formatting.BOLD, Formatting.GOLD),
            x, y, 0xFFFFFF));
        y += 20;
        
        addRitualConfig(x, y, "Growth", "minecraft:emerald", "growth");
        y += 30;
        addRitualConfig(x, y, "Strength", "minecraft:diamond", "strength");
        y += 30;
        addRitualConfig(x, y, "Prosperity", "minecraft:netherite_block", "prosperity");
        y += 30;
        addRitualConfig(x, y, "Protection", "minecraft:iron_ingot", "protection");
        y += 30;
        addRitualConfig(x, y, "Healing", "minecraft:nether_star", "healing");
        y += 30;
        addRitualConfig(x, y, "Sentry", "minecraft:arrow", "sentry");
        y += 40;
        
        // Pattern Rituals section header
        y += 5;
        labels.add(new LabelInfo(
            Text.literal("Pattern Rituals").formatted(Formatting.BOLD, Formatting.GOLD),
            x, y, 0xFFFFFF));
        y += 20;
        
        addPatternConfig(x, y, "Auto-Farming", "minecraft:diamond_hoe", "auto_farming");
        y += 30;
        addPatternConfig(x, y, "Auto-Breeding", "minecraft:wheat", "auto_breeding");
    }
    
    private void addRitualConfig(int x, int y, String name, String defaultItem, String ritualId) {
        // Add label for ritual name (to the left of the input field)
        labels.add(new LabelInfo(
            Text.literal(name + ":").formatted(Formatting.YELLOW),
            x - 100, y + 5, 0xFFFFFF));
        
        TextFieldWidget itemField = new TextFieldWidget(this.textRenderer, x, y, 200, 20, Text.literal("Item ID"));
        itemField.setText(defaultItem);
        itemField.setMaxLength(100);
        this.addDrawableChild(itemField);
        
        ButtonWidget saveButton = ButtonWidget.builder(Text.literal("Save"), button -> {
            String itemId = itemField.getText();
            if (this.client.player != null) {
                String command = String.format("rituals config ritual set_item %s %s", ritualId, itemId);
                this.client.player.networkHandler.sendChatCommand(command);
            }
        }).dimensions(x + 210, y, 60, 20).build();
        this.addDrawableChild(saveButton);
        
        ButtonWidget resetButton = ButtonWidget.builder(Text.literal("Reset"), button -> {
            itemField.setText(defaultItem);
        }).dimensions(x + 280, y, 60, 20).build();
        this.addDrawableChild(resetButton);
    }
    
    private void addPatternConfig(int x, int y, String name, String defaultItem, String patternId) {
        // Add label for pattern name (to the left of the input field)
        labels.add(new LabelInfo(
            Text.literal(name + ":").formatted(Formatting.YELLOW),
            x - 100, y + 17, 0xFFFFFF));
        
        TextFieldWidget itemField = new TextFieldWidget(this.textRenderer, x, y + 12, 200, 20, Text.literal("Central Item ID"));
        itemField.setText(defaultItem);
        itemField.setMaxLength(100);
        this.addDrawableChild(itemField);
        
        ButtonWidget saveButton = ButtonWidget.builder(Text.literal("Save"), button -> {
            String itemId = itemField.getText();
            if (this.client.player != null) {
                String command = String.format("rituals config pattern set_central %s %s", patternId, itemId);
                this.client.player.networkHandler.sendChatCommand(command);
            }
        }).dimensions(x + 210, y + 12, 60, 20).build();
        this.addDrawableChild(saveButton);
        
        ButtonWidget resetButton = ButtonWidget.builder(Text.literal("Reset"), button -> {
            itemField.setText(defaultItem);
        }).dimensions(x + 280, y + 12, 60, 20).build();
        this.addDrawableChild(resetButton);
    }
    
    @Override
    public void render(DrawContext context, int mouseX, int mouseY, float delta) {
        // Don't call renderBackground - it causes blur conflicts with other mods
        // Just fill with dark background instead
        context.fill(0, 0, this.width, this.height, 0xC0101010);
        
        // Render widgets first
        super.render(context, mouseX, mouseY, delta);
        
        // Render labels AFTER widgets so they appear on top
        // Linter confirms methods need 5 params: (TextRenderer, Text, int, int, int)
        for (LabelInfo label : labels) {
            if (label.x == this.width / 2) {
                context.drawCenteredTextWithShadow(this.textRenderer, label.text, label.x, label.y, label.color);
            } else {
                context.drawTextWithShadow(this.textRenderer, label.text, label.x, label.y, label.color);
            }
        }
    }
    
    @Override
    public void close() {
        this.client.setScreen(this.parent);
    }
}

