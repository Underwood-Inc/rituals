package com.rituals.plugin.recipe;

import org.bukkit.Material;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Display catalog mirroring datapack recipes ({@code data/rituals/recipe/}).
 */
public final class RitualRecipeCatalog {

    public record ShapedRecipeSpec(
            String id,
            String title,
            String[] shape,
            Map<Character, Material> ingredients,
            Material resultIcon,
            String resultName,
            boolean datapackOnly
    ) {
    }

    public enum TotemTier {
        WOOD("wood", "&6Wooden Totem", Material.STICK, 1),
        COPPER("copper", "&6Copper Totem", Material.COPPER_INGOT, 2),
        IRON("iron", "&fIron Totem", Material.IRON_INGOT, 3),
        GOLD("gold", "&eGold Totem", Material.GOLD_INGOT, 4),
        DIAMOND("diamond", "&bDiamond Totem", Material.DIAMOND, 5),
        NETHERITE("netherite", "&8Netherite Totem", Material.NETHERITE_INGOT, 6);

        private final String id;
        private final String title;
        private final Material icon;
        private final int tier;

        TotemTier(String id, String title, Material icon, int tier) {
            this.id = id;
            this.title = title;
            this.icon = icon;
            this.tier = tier;
        }

        public String id() {
            return id;
        }

        public String title() {
            return title;
        }

        public Material icon() {
            return icon;
        }

        public int tier() {
            return tier;
        }
    }

    private RitualRecipeCatalog() {
    }

    public static List<TotemTier> totemTiers() {
        return List.of(TotemTier.values());
    }

    public static ShapedRecipeSpec totem(TotemTier tier) {
        return switch (tier) {
            case WOOD -> shapedTotem(
                    "totem_base_wood",
                    tier.title(),
                    new String[]{" S ", "SPS", " P "},
                    Map.of('S', Material.STICK, 'P', Material.OAK_PLANKS),
                    Material.WARPED_FUNGUS_ON_A_STICK,
                    tier.title(),
                    true
            );
            case COPPER -> ingotBlockTotem(tier, Material.COPPER_INGOT, Material.COPPER_BLOCK);
            case IRON -> ingotBlockTotem(tier, Material.IRON_INGOT, Material.IRON_BLOCK);
            case GOLD -> ingotBlockTotem(tier, Material.GOLD_INGOT, Material.GOLD_BLOCK);
            case DIAMOND -> shapedTotem(
                    "totem_base_diamond",
                    tier.title(),
                    new String[]{" D ", "DBD", " B "},
                    Map.of('D', Material.DIAMOND, 'B', Material.DIAMOND_BLOCK),
                    Material.WARPED_FUNGUS_ON_A_STICK,
                    tier.title(),
                    true
            );
            case NETHERITE -> ingotBlockTotem(tier, Material.NETHERITE_INGOT, Material.NETHERITE_BLOCK);
        };
    }

    public static ShapedRecipeSpec scryingGlass() {
        return shapedTotem(
                "scrying_glass",
                "&dScrying Glass",
                new String[]{" A ", "ASA", " A "},
                Map.of('A', Material.AMETHYST_SHARD, 'S', Material.SPYGLASS),
                Material.SPYGLASS,
                "&dScrying Glass",
                true
        );
    }

    public static List<ShapedRecipeSpec> allGuiRecipes() {
        return List.of(
                scryingGlass(),
                totem(TotemTier.WOOD),
                totem(TotemTier.COPPER),
                totem(TotemTier.IRON),
                totem(TotemTier.GOLD),
                totem(TotemTier.DIAMOND),
                totem(TotemTier.NETHERITE)
        );
    }

    private static ShapedRecipeSpec ingotBlockTotem(TotemTier tier, Material ingot, Material block) {
        Map<Character, Material> map = new LinkedHashMap<>();
        map.put('I', ingot);
        map.put('B', block);
        return shapedTotem(
                "totem_base_" + tier.id(),
                tier.title(),
                new String[]{" I ", "IBI", " B "},
                map,
                Material.WARPED_FUNGUS_ON_A_STICK,
                tier.title(),
                true
        );
    }

    private static ShapedRecipeSpec shapedTotem(
            String id,
            String title,
            String[] shape,
            Map<Character, Material> ingredients,
            Material resultIcon,
            String resultName,
            boolean datapackOnly
    ) {
        return new ShapedRecipeSpec(id, title, shape, ingredients, resultIcon, resultName, datapackOnly);
    }
}
