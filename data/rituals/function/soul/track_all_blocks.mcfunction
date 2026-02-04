# ========================================
# Track ALL Blocks Mined - Unified XP System
# ========================================
# Tracks EVERY block mined regardless of tool type
# Shows XP popup for every block broken
# Minimum 1 XP per block, bonus for valuable blocks

# === SAFETY CHECK: Must be holding soul weapon ===
# Reset check score first, then store value
scoreboard players set #has_soul rituals.soul_temp 0
execute store result score #has_soul rituals.soul_temp run data get entity @s SelectedItem.components."minecraft:custom_data".soul_embodied
execute unless score #has_soul rituals.soul_temp matches 1 run return fail

# === SUM ALL BLOCKS EVER MINED ===
scoreboard players set #total rituals.soul_temp 0

# =====================
# PICKAXE BLOCKS (Stone, Ores, etc.)
# =====================

# Stone variants (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_stone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cobblestone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mossy_cobblestone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_smooth_stone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_stone_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mossy_stone_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cracked_stone_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chiseled_stone_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_infested_stone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_infested_cobblestone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_infested_stone_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_infested_mossy_stone_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_infested_cracked_stone_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_infested_chiseled_stone_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_infested_deepslate

# Deepslate variants (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cobbled_deepslate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_deepslate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cracked_deepslate_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_tiles
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cracked_deepslate_tiles
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chiseled_deepslate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_reinforced_deepslate

# Granite/Diorite/Andesite (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_granite
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_granite
scoreboard players operation #total rituals.soul_temp += @s rituals.m_diorite
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_diorite
scoreboard players operation #total rituals.soul_temp += @s rituals.m_andesite
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_andesite

# Tuff (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_tuff
scoreboard players operation #total rituals.soul_temp += @s rituals.m_tuff_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_tuff
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chiseled_tuff
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chiseled_tuff_bricks

# Calcite/Dripstone (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_calcite
scoreboard players operation #total rituals.soul_temp += @s rituals.m_dripstone_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pointed_dripstone

# Sandstone (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sandstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chiseled_sandstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cut_sandstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_smooth_sandstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_red_sandstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chiseled_red_sandstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cut_red_sandstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_smooth_red_sandstone

# Bricks (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mud_bricks

# Prismarine (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_prismarine
scoreboard players operation #total rituals.soul_temp += @s rituals.m_prismarine_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_dark_prismarine
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sea_lantern

# Purpur (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_purpur_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_purpur_pillar

# End Stone (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_end_stone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_end_stone_bricks

# Nether blocks (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_netherrack
scoreboard players operation #total rituals.soul_temp += @s rituals.m_nether_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cracked_nether_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chiseled_nether_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_red_nether_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_basalt
scoreboard players operation #total rituals.soul_temp += @s rituals.m_smooth_basalt
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_basalt
scoreboard players operation #total rituals.soul_temp += @s rituals.m_blackstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_blackstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_blackstone_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cracked_polished_blackstone_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chiseled_polished_blackstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_gilded_blackstone

# Quartz (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_quartz_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chiseled_quartz_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_quartz_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_quartz_pillar
scoreboard players operation #total rituals.soul_temp += @s rituals.m_smooth_quartz

# Amethyst (2 XP bonus)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_amethyst_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_amethyst_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_budding_amethyst
scoreboard players operation #total rituals.soul_temp += @s rituals.m_budding_amethyst
scoreboard players operation #total rituals.soul_temp += @s rituals.m_amethyst_cluster
scoreboard players operation #total rituals.soul_temp += @s rituals.m_amethyst_cluster

# Raw ore blocks (3 XP bonus)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_raw_iron_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_raw_iron_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_raw_iron_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_raw_copper_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_raw_copper_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_raw_copper_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_raw_gold_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_raw_gold_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_raw_gold_block

# Copper blocks (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_copper_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_exposed_copper
scoreboard players operation #total rituals.soul_temp += @s rituals.m_weathered_copper
scoreboard players operation #total rituals.soul_temp += @s rituals.m_oxidized_copper
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cut_copper
scoreboard players operation #total rituals.soul_temp += @s rituals.m_exposed_cut_copper
scoreboard players operation #total rituals.soul_temp += @s rituals.m_weathered_cut_copper
scoreboard players operation #total rituals.soul_temp += @s rituals.m_oxidized_cut_copper
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chiseled_copper
scoreboard players operation #total rituals.soul_temp += @s rituals.m_exposed_chiseled_copper
scoreboard players operation #total rituals.soul_temp += @s rituals.m_weathered_chiseled_copper
scoreboard players operation #total rituals.soul_temp += @s rituals.m_oxidized_chiseled_copper
scoreboard players operation #total rituals.soul_temp += @s rituals.m_copper_grate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_exposed_copper_grate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_weathered_copper_grate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_oxidized_copper_grate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_copper_bulb
scoreboard players operation #total rituals.soul_temp += @s rituals.m_exposed_copper_bulb
scoreboard players operation #total rituals.soul_temp += @s rituals.m_weathered_copper_bulb
scoreboard players operation #total rituals.soul_temp += @s rituals.m_oxidized_copper_bulb

# Waxed copper (same as above)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_waxed_copper_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_waxed_exposed_copper
scoreboard players operation #total rituals.soul_temp += @s rituals.m_waxed_weathered_copper
scoreboard players operation #total rituals.soul_temp += @s rituals.m_waxed_oxidized_copper
scoreboard players operation #total rituals.soul_temp += @s rituals.m_waxed_cut_copper
scoreboard players operation #total rituals.soul_temp += @s rituals.m_waxed_exposed_cut_copper
scoreboard players operation #total rituals.soul_temp += @s rituals.m_waxed_weathered_cut_copper
scoreboard players operation #total rituals.soul_temp += @s rituals.m_waxed_oxidized_cut_copper
scoreboard players operation #total rituals.soul_temp += @s rituals.m_waxed_chiseled_copper
scoreboard players operation #total rituals.soul_temp += @s rituals.m_waxed_exposed_chiseled_copper
scoreboard players operation #total rituals.soul_temp += @s rituals.m_waxed_weathered_chiseled_copper
scoreboard players operation #total rituals.soul_temp += @s rituals.m_waxed_oxidized_chiseled_copper
scoreboard players operation #total rituals.soul_temp += @s rituals.m_waxed_copper_grate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_waxed_exposed_copper_grate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_waxed_weathered_copper_grate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_waxed_oxidized_copper_grate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_waxed_copper_bulb
scoreboard players operation #total rituals.soul_temp += @s rituals.m_waxed_exposed_copper_bulb
scoreboard players operation #total rituals.soul_temp += @s rituals.m_waxed_weathered_copper_bulb
scoreboard players operation #total rituals.soul_temp += @s rituals.m_waxed_oxidized_copper_bulb

# Glowstone (2 XP bonus)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_glowstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_glowstone

# Obsidian (2 XP - hard)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_obsidian
scoreboard players operation #total rituals.soul_temp += @s rituals.m_obsidian
scoreboard players operation #total rituals.soul_temp += @s rituals.m_crying_obsidian
scoreboard players operation #total rituals.soul_temp += @s rituals.m_crying_obsidian

# Ice (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_ice
scoreboard players operation #total rituals.soul_temp += @s rituals.m_packed_ice
scoreboard players operation #total rituals.soul_temp += @s rituals.m_blue_ice

# Terracotta (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_white_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_orange_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_magenta_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_light_blue_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_yellow_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_lime_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pink_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_gray_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_light_gray_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cyan_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_purple_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_blue_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_brown_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_green_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_red_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_black_terracotta

# Glazed terracotta (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_white_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_orange_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_magenta_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_light_blue_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_yellow_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_lime_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pink_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_gray_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_light_gray_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cyan_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_purple_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_blue_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_brown_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_green_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_red_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_black_glazed_terracotta

# Concrete (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_white_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_orange_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_magenta_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_light_blue_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_yellow_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_lime_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pink_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_gray_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_light_gray_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cyan_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_purple_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_blue_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_brown_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_green_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_red_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_black_concrete

# =====================
# ORES (BONUS XP)
# =====================

# Coal ore (2 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_coal_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_coal_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_coal_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_coal_ore

# Iron ore (2 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_iron_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_iron_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_iron_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_iron_ore

# Copper ore (2 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_copper_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_copper_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_copper_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_copper_ore

# Gold ore (3 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_gold_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_gold_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_gold_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_gold_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_gold_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_gold_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_nether_gold_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_nether_gold_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_nether_gold_ore

# Redstone ore (2 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_redstone_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_redstone_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_redstone_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_redstone_ore

# Lapis ore (3 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_lapis_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_lapis_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_lapis_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_lapis_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_lapis_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_lapis_ore

# Nether quartz ore (2 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_nether_quartz_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_nether_quartz_ore

# Diamond ore (5 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_diamond_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_diamond_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_diamond_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_diamond_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_diamond_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_diamond_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_diamond_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_diamond_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_diamond_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_diamond_ore

# Emerald ore (5 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_emerald_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_emerald_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_emerald_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_emerald_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_emerald_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_emerald_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_emerald_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_emerald_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_emerald_ore
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_emerald_ore

# Ancient debris (10 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_ancient_debris
scoreboard players operation #total rituals.soul_temp += @s rituals.m_ancient_debris
scoreboard players operation #total rituals.soul_temp += @s rituals.m_ancient_debris
scoreboard players operation #total rituals.soul_temp += @s rituals.m_ancient_debris
scoreboard players operation #total rituals.soul_temp += @s rituals.m_ancient_debris
scoreboard players operation #total rituals.soul_temp += @s rituals.m_ancient_debris
scoreboard players operation #total rituals.soul_temp += @s rituals.m_ancient_debris
scoreboard players operation #total rituals.soul_temp += @s rituals.m_ancient_debris
scoreboard players operation #total rituals.soul_temp += @s rituals.m_ancient_debris
scoreboard players operation #total rituals.soul_temp += @s rituals.m_ancient_debris

# =====================
# SHOVEL BLOCKS
# =====================

# Dirt types (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_dirt
scoreboard players operation #total rituals.soul_temp += @s rituals.m_grass_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_dirt_path
scoreboard players operation #total rituals.soul_temp += @s rituals.m_coarse_dirt
scoreboard players operation #total rituals.soul_temp += @s rituals.m_rooted_dirt
scoreboard players operation #total rituals.soul_temp += @s rituals.m_podzol
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mycelium
scoreboard players operation #total rituals.soul_temp += @s rituals.m_farmland
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mud
scoreboard players operation #total rituals.soul_temp += @s rituals.m_muddy_mangrove_roots
scoreboard players operation #total rituals.soul_temp += @s rituals.m_packed_mud

# Sand (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sand
scoreboard players operation #total rituals.soul_temp += @s rituals.m_red_sand

# Suspicious blocks (3 XP - archaeology)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_suspicious_sand
scoreboard players operation #total rituals.soul_temp += @s rituals.m_suspicious_sand
scoreboard players operation #total rituals.soul_temp += @s rituals.m_suspicious_sand
scoreboard players operation #total rituals.soul_temp += @s rituals.m_suspicious_gravel
scoreboard players operation #total rituals.soul_temp += @s rituals.m_suspicious_gravel
scoreboard players operation #total rituals.soul_temp += @s rituals.m_suspicious_gravel

# Gravel (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_gravel

# Clay (2 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_clay
scoreboard players operation #total rituals.soul_temp += @s rituals.m_clay

# Soul blocks (2 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_soul_sand
scoreboard players operation #total rituals.soul_temp += @s rituals.m_soul_sand
scoreboard players operation #total rituals.soul_temp += @s rituals.m_soul_soil
scoreboard players operation #total rituals.soul_temp += @s rituals.m_soul_soil

# Snow (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_snow
scoreboard players operation #total rituals.soul_temp += @s rituals.m_snow_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_powder_snow

# Concrete powder (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_white_concrete_powder
scoreboard players operation #total rituals.soul_temp += @s rituals.m_orange_concrete_powder
scoreboard players operation #total rituals.soul_temp += @s rituals.m_magenta_concrete_powder
scoreboard players operation #total rituals.soul_temp += @s rituals.m_light_blue_concrete_powder
scoreboard players operation #total rituals.soul_temp += @s rituals.m_yellow_concrete_powder
scoreboard players operation #total rituals.soul_temp += @s rituals.m_lime_concrete_powder
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pink_concrete_powder
scoreboard players operation #total rituals.soul_temp += @s rituals.m_gray_concrete_powder
scoreboard players operation #total rituals.soul_temp += @s rituals.m_light_gray_concrete_powder
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cyan_concrete_powder
scoreboard players operation #total rituals.soul_temp += @s rituals.m_purple_concrete_powder
scoreboard players operation #total rituals.soul_temp += @s rituals.m_blue_concrete_powder
scoreboard players operation #total rituals.soul_temp += @s rituals.m_brown_concrete_powder
scoreboard players operation #total rituals.soul_temp += @s rituals.m_green_concrete_powder
scoreboard players operation #total rituals.soul_temp += @s rituals.m_red_concrete_powder
scoreboard players operation #total rituals.soul_temp += @s rituals.m_black_concrete_powder

# =====================
# AXE/WOOD BLOCKS
# =====================

# Logs (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_oak_log
scoreboard players operation #total rituals.soul_temp += @s rituals.m_spruce_log
scoreboard players operation #total rituals.soul_temp += @s rituals.m_birch_log
scoreboard players operation #total rituals.soul_temp += @s rituals.m_jungle_log
scoreboard players operation #total rituals.soul_temp += @s rituals.m_acacia_log
scoreboard players operation #total rituals.soul_temp += @s rituals.m_dark_oak_log
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mangrove_log
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cherry_log
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pale_oak_log
scoreboard players operation #total rituals.soul_temp += @s rituals.m_crimson_stem
scoreboard players operation #total rituals.soul_temp += @s rituals.m_warped_stem

# Stripped logs (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_stripped_oak_log
scoreboard players operation #total rituals.soul_temp += @s rituals.m_stripped_spruce_log
scoreboard players operation #total rituals.soul_temp += @s rituals.m_stripped_birch_log
scoreboard players operation #total rituals.soul_temp += @s rituals.m_stripped_jungle_log
scoreboard players operation #total rituals.soul_temp += @s rituals.m_stripped_acacia_log
scoreboard players operation #total rituals.soul_temp += @s rituals.m_stripped_dark_oak_log
scoreboard players operation #total rituals.soul_temp += @s rituals.m_stripped_mangrove_log
scoreboard players operation #total rituals.soul_temp += @s rituals.m_stripped_cherry_log
scoreboard players operation #total rituals.soul_temp += @s rituals.m_stripped_pale_oak_log
scoreboard players operation #total rituals.soul_temp += @s rituals.m_stripped_crimson_stem
scoreboard players operation #total rituals.soul_temp += @s rituals.m_stripped_warped_stem

# Wood (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_oak_wood
scoreboard players operation #total rituals.soul_temp += @s rituals.m_spruce_wood
scoreboard players operation #total rituals.soul_temp += @s rituals.m_birch_wood
scoreboard players operation #total rituals.soul_temp += @s rituals.m_jungle_wood
scoreboard players operation #total rituals.soul_temp += @s rituals.m_acacia_wood
scoreboard players operation #total rituals.soul_temp += @s rituals.m_dark_oak_wood
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mangrove_wood
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cherry_wood
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pale_oak_wood
scoreboard players operation #total rituals.soul_temp += @s rituals.m_crimson_hyphae
scoreboard players operation #total rituals.soul_temp += @s rituals.m_warped_hyphae

# Planks (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_oak_planks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_spruce_planks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_birch_planks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_jungle_planks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_acacia_planks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_dark_oak_planks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mangrove_planks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cherry_planks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pale_oak_planks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_bamboo_planks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_crimson_planks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_warped_planks

# Utility blocks (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_crafting_table
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chest
scoreboard players operation #total rituals.soul_temp += @s rituals.m_trapped_chest
scoreboard players operation #total rituals.soul_temp += @s rituals.m_barrel
scoreboard players operation #total rituals.soul_temp += @s rituals.m_bookshelf
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chiseled_bookshelf
scoreboard players operation #total rituals.soul_temp += @s rituals.m_lectern
scoreboard players operation #total rituals.soul_temp += @s rituals.m_composter
scoreboard players operation #total rituals.soul_temp += @s rituals.m_note_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_jukebox
scoreboard players operation #total rituals.soul_temp += @s rituals.m_beehive
scoreboard players operation #total rituals.soul_temp += @s rituals.m_bee_nest
scoreboard players operation #total rituals.soul_temp += @s rituals.m_ladder
scoreboard players operation #total rituals.soul_temp += @s rituals.m_campfire
scoreboard players operation #total rituals.soul_temp += @s rituals.m_soul_campfire

# Pumpkin/Melon (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pumpkin
scoreboard players operation #total rituals.soul_temp += @s rituals.m_carved_pumpkin
scoreboard players operation #total rituals.soul_temp += @s rituals.m_jack_o_lantern
scoreboard players operation #total rituals.soul_temp += @s rituals.m_melon

# Mushroom blocks (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_brown_mushroom_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_red_mushroom_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mushroom_stem

# =====================
# HOE BLOCKS (LEAVES, CROPS)
# =====================

# Leaves (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_oak_leaves
scoreboard players operation #total rituals.soul_temp += @s rituals.m_spruce_leaves
scoreboard players operation #total rituals.soul_temp += @s rituals.m_birch_leaves
scoreboard players operation #total rituals.soul_temp += @s rituals.m_jungle_leaves
scoreboard players operation #total rituals.soul_temp += @s rituals.m_acacia_leaves
scoreboard players operation #total rituals.soul_temp += @s rituals.m_dark_oak_leaves
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mangrove_leaves
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cherry_leaves
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pale_oak_leaves
scoreboard players operation #total rituals.soul_temp += @s rituals.m_azalea_leaves
scoreboard players operation #total rituals.soul_temp += @s rituals.m_flowering_azalea_leaves

# Hay/Moss (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_hay_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_moss_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_moss_carpet

# Sponge (2 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sponge
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sponge
scoreboard players operation #total rituals.soul_temp += @s rituals.m_wet_sponge
scoreboard players operation #total rituals.soul_temp += @s rituals.m_wet_sponge

# Sculk (3 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sculk
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sculk
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sculk
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sculk_vein
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sculk_vein
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sculk_vein
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sculk_catalyst
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sculk_catalyst
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sculk_catalyst
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sculk_sensor
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sculk_sensor
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sculk_sensor
scoreboard players operation #total rituals.soul_temp += @s rituals.m_calibrated_sculk_sensor
scoreboard players operation #total rituals.soul_temp += @s rituals.m_calibrated_sculk_sensor
scoreboard players operation #total rituals.soul_temp += @s rituals.m_calibrated_sculk_sensor
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sculk_shrieker
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sculk_shrieker
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sculk_shrieker

# Nether wart block (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_nether_wart_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_warped_wart_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_shroomlight

# =====================
# CALCULATE XP DELTA
# =====================
# Ensure player score exists (defensive - handles tag but no score edge case)
execute unless score @s rituals.prev_blocks matches -2147483648.. run scoreboard players set @s rituals.prev_blocks 0

# First time detection using tag (prevents huge XP dump from lifetime stats)
execute unless entity @s[tag=rituals.blocks_initialized] store result score @s rituals.prev_blocks run scoreboard players get #total rituals.soul_temp
execute unless entity @s[tag=rituals.blocks_initialized] run tag @s add rituals.blocks_initialized

scoreboard players operation #xp_gain rituals.soul_temp = #total rituals.soul_temp
scoreboard players operation #xp_gain rituals.soul_temp -= @s rituals.prev_blocks

# =====================
# ALWAYS SHOW POPUP
# =====================
execute if score #xp_gain rituals.soul_temp matches 1.. run title @s actionbar [{"text":"✦ +","color":"light_purple"},{"score":{"name":"#xp_gain","objective":"rituals.soul_temp"},"color":"aqua"},{"text":" Soul XP","color":"gray"}]

# =====================
# AWARD XP IF ANY
# =====================
execute if score #xp_gain rituals.soul_temp matches 1.. run function rituals:soul/award_xp

# Update previous count
scoreboard players operation @s rituals.prev_blocks = #total rituals.soul_temp
