# ========================================
# Track Pickaxe Blocks - Weighted Tier XP
# ========================================
# Adds weighted pickaxe block counts to #total rituals.soul_temp
# Called from soul/track_blocks.mcfunction
# Tier-based grouping: blocks grouped by XP value for efficient multiplication

# ----------------------------------------
# TIER 1 (1 XP) - Add directly to #total
# ----------------------------------------
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
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cobbled_deepslate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_deepslate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cracked_deepslate_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_tiles
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cracked_deepslate_tiles
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chiseled_deepslate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_infested_deepslate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_granite
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_granite
scoreboard players operation #total rituals.soul_temp += @s rituals.m_diorite
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_diorite
scoreboard players operation #total rituals.soul_temp += @s rituals.m_andesite
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_andesite
scoreboard players operation #total rituals.soul_temp += @s rituals.m_tuff
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_tuff
scoreboard players operation #total rituals.soul_temp += @s rituals.m_tuff_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chiseled_tuff
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chiseled_tuff_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_tuff_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_tuff_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_tuff_wall
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_tuff_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_tuff_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_tuff_wall
scoreboard players operation #total rituals.soul_temp += @s rituals.m_tuff_brick_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_tuff_brick_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_tuff_brick_wall
scoreboard players operation #total rituals.soul_temp += @s rituals.m_calcite
scoreboard players operation #total rituals.soul_temp += @s rituals.m_dripstone_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pointed_dripstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sandstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chiseled_sandstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cut_sandstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_smooth_sandstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_red_sandstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chiseled_red_sandstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cut_red_sandstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_smooth_red_sandstone
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
scoreboard players operation #total rituals.soul_temp += @s rituals.m_magma_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mud_bricks
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
scoreboard players operation #total rituals.soul_temp += @s rituals.m_ice
scoreboard players operation #total rituals.soul_temp += @s rituals.m_packed_ice
scoreboard players operation #total rituals.soul_temp += @s rituals.m_medium_amethyst_bud
scoreboard players operation #total rituals.soul_temp += @s rituals.m_small_amethyst_bud
scoreboard players operation #total rituals.soul_temp += @s rituals.m_rail
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chain
scoreboard players operation #total rituals.soul_temp += @s rituals.m_iron_bars
scoreboard players operation #total rituals.soul_temp += @s rituals.m_heavy_weighted_pressure_plate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_light_weighted_pressure_plate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_stone_pressure_plate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_blackstone_pressure_plate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_stone_button
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_blackstone_button

# ----------------------------------------
# TIER 2 (2 XP)
# ----------------------------------------
scoreboard players set #t2 rituals.soul_temp 0
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_prismarine
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_prismarine_bricks
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_dark_prismarine
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_sea_lantern
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_end_stone
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_end_stone_bricks
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_purpur_block
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_purpur_pillar
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_quartz_block
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_chiseled_quartz_block
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_quartz_bricks
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_quartz_pillar
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_smooth_quartz
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_copper_block
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_exposed_copper
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_weathered_copper
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_oxidized_copper
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_cut_copper
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_exposed_cut_copper
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_weathered_cut_copper
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_oxidized_cut_copper
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_copper_block
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_exposed_copper
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_weathered_copper
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_oxidized_copper
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_cut_copper
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_exposed_cut_copper
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_weathered_cut_copper
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_oxidized_cut_copper
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_chiseled_copper
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_exposed_chiseled_copper
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_weathered_chiseled_copper
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_oxidized_chiseled_copper
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_chiseled_copper
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_exposed_chiseled_copper
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_weathered_chiseled_copper
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_oxidized_chiseled_copper
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_copper_grate
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_exposed_copper_grate
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_weathered_copper_grate
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_oxidized_copper_grate
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_copper_grate
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_exposed_copper_grate
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_weathered_copper_grate
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_oxidized_copper_grate
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_copper_bulb
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_exposed_copper_bulb
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_weathered_copper_bulb
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_oxidized_copper_bulb
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_copper_bulb
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_exposed_copper_bulb
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_weathered_copper_bulb
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_oxidized_copper_bulb
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_copper_door
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_exposed_copper_door
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_weathered_copper_door
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_oxidized_copper_door
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_copper_door
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_exposed_copper_door
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_weathered_copper_door
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_oxidized_copper_door
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_copper_trapdoor
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_exposed_copper_trapdoor
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_weathered_copper_trapdoor
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_oxidized_copper_trapdoor
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_copper_trapdoor
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_exposed_copper_trapdoor
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_weathered_copper_trapdoor
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_waxed_oxidized_copper_trapdoor
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_lightning_rod
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_raw_copper_block
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_coal_ore
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_deepslate_coal_ore
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_copper_ore
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_deepslate_copper_ore
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_blue_ice
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_amethyst_cluster
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_large_amethyst_bud
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_glowstone
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_coal_block
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_furnace
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_blast_furnace
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_smoker
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_stonecutter
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_grindstone
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_cauldron
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_dispenser
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_dropper
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_observer
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_piston
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_sticky_piston
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_powered_rail
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_detector_rail
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_activator_rail
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_lantern
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_soul_lantern
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_iron_door
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_iron_trapdoor
scoreboard players operation #t2 rituals.soul_temp *= #2 rituals.data
scoreboard players operation #total rituals.soul_temp += #t2 rituals.soul_temp

# ----------------------------------------
# TIER 3 (3 XP)
# ----------------------------------------
scoreboard players set #t3 rituals.soul_temp 0
scoreboard players operation #t3 rituals.soul_temp += @s rituals.m_iron_ore
scoreboard players operation #t3 rituals.soul_temp += @s rituals.m_deepslate_iron_ore
scoreboard players operation #t3 rituals.soul_temp += @s rituals.m_raw_iron_block
scoreboard players operation #t3 rituals.soul_temp += @s rituals.m_redstone_ore
scoreboard players operation #t3 rituals.soul_temp += @s rituals.m_deepslate_redstone_ore
scoreboard players operation #t3 rituals.soul_temp += @s rituals.m_nether_quartz_ore
scoreboard players operation #t3 rituals.soul_temp += @s rituals.m_iron_block
scoreboard players operation #t3 rituals.soul_temp += @s rituals.m_redstone_block
scoreboard players operation #t3 rituals.soul_temp += @s rituals.m_amethyst_block
scoreboard players operation #t3 rituals.soul_temp += @s rituals.m_obsidian
scoreboard players operation #t3 rituals.soul_temp += @s rituals.m_crying_obsidian
scoreboard players operation #t3 rituals.soul_temp += @s rituals.m_brewing_stand
scoreboard players operation #t3 rituals.soul_temp += @s rituals.m_hopper
scoreboard players operation #t3 rituals.soul_temp += @s rituals.m_anvil
scoreboard players operation #t3 rituals.soul_temp += @s rituals.m_chipped_anvil
scoreboard players operation #t3 rituals.soul_temp += @s rituals.m_damaged_anvil
scoreboard players operation #t3 rituals.soul_temp += @s rituals.m_crafter
scoreboard players operation #t3 rituals.soul_temp += @s rituals.m_gilded_blackstone
scoreboard players operation #t3 rituals.soul_temp *= #3 rituals.data
scoreboard players operation #total rituals.soul_temp += #t3 rituals.soul_temp

# ----------------------------------------
# TIER 4 (4 XP)
# ----------------------------------------
scoreboard players set #t4 rituals.soul_temp 0
scoreboard players operation #t4 rituals.soul_temp += @s rituals.m_gold_ore
scoreboard players operation #t4 rituals.soul_temp += @s rituals.m_deepslate_gold_ore
scoreboard players operation #t4 rituals.soul_temp += @s rituals.m_nether_gold_ore
scoreboard players operation #t4 rituals.soul_temp += @s rituals.m_raw_gold_block
scoreboard players operation #t4 rituals.soul_temp += @s rituals.m_lapis_ore
scoreboard players operation #t4 rituals.soul_temp += @s rituals.m_deepslate_lapis_ore
scoreboard players operation #t4 rituals.soul_temp += @s rituals.m_gold_block
scoreboard players operation #t4 rituals.soul_temp += @s rituals.m_lapis_block
scoreboard players operation #t4 rituals.soul_temp *= #4 rituals.data
scoreboard players operation #total rituals.soul_temp += #t4 rituals.soul_temp

# ----------------------------------------
# TIER 5 (5 XP)
# ----------------------------------------
scoreboard players set #t5 rituals.soul_temp 0
scoreboard players operation #t5 rituals.soul_temp += @s rituals.m_reinforced_deepslate
scoreboard players operation #t5 rituals.soul_temp += @s rituals.m_budding_amethyst
scoreboard players operation #t5 rituals.soul_temp += @s rituals.m_lodestone
scoreboard players operation #t5 rituals.soul_temp += @s rituals.m_respawn_anchor
scoreboard players operation #t5 rituals.soul_temp += @s rituals.m_enchanting_table
scoreboard players operation #t5 rituals.soul_temp += @s rituals.m_bell
scoreboard players operation #t5 rituals.soul_temp += @s rituals.m_ender_chest
scoreboard players operation #t5 rituals.soul_temp *= #5 rituals.data
scoreboard players operation #total rituals.soul_temp += #t5 rituals.soul_temp

# ----------------------------------------
# TIER 10 (10 XP)
# ----------------------------------------
scoreboard players set #t10 rituals.soul_temp 0
scoreboard players operation #t10 rituals.soul_temp += @s rituals.m_diamond_ore
scoreboard players operation #t10 rituals.soul_temp += @s rituals.m_deepslate_diamond_ore
scoreboard players operation #t10 rituals.soul_temp += @s rituals.m_diamond_block
scoreboard players operation #t10 rituals.soul_temp += @s rituals.m_spawner
scoreboard players operation #t10 rituals.soul_temp += @s rituals.m_conduit
scoreboard players operation #t10 rituals.soul_temp *= #10 rituals.data
scoreboard players operation #total rituals.soul_temp += #t10 rituals.soul_temp

# ----------------------------------------
# TIER 12 (12 XP)
# ----------------------------------------
scoreboard players set #t12 rituals.soul_temp 0
scoreboard players operation #t12 rituals.soul_temp += @s rituals.m_emerald_ore
scoreboard players operation #t12 rituals.soul_temp += @s rituals.m_deepslate_emerald_ore
scoreboard players operation #t12 rituals.soul_temp += @s rituals.m_emerald_block
scoreboard players operation #t12 rituals.soul_temp *= #12 rituals.data
scoreboard players operation #total rituals.soul_temp += #t12 rituals.soul_temp

# ----------------------------------------
# TIER 15 (15 XP)
# ----------------------------------------
scoreboard players set #t15 rituals.soul_temp 0
scoreboard players operation #t15 rituals.soul_temp += @s rituals.m_trial_spawner
scoreboard players operation #t15 rituals.soul_temp += @s rituals.m_beacon
scoreboard players operation #t15 rituals.soul_temp *= #15 rituals.data
scoreboard players operation #total rituals.soul_temp += #t15 rituals.soul_temp

# ----------------------------------------
# TIER 20 (20 XP)
# ----------------------------------------
scoreboard players set #t20 rituals.soul_temp 0
scoreboard players operation #t20 rituals.soul_temp += @s rituals.m_vault
scoreboard players operation #t20 rituals.soul_temp *= #20 rituals.data
scoreboard players operation #total rituals.soul_temp += #t20 rituals.soul_temp

# ----------------------------------------
# TIER 25 (25 XP)
# ----------------------------------------
scoreboard players set #t25 rituals.soul_temp 0
scoreboard players operation #t25 rituals.soul_temp += @s rituals.m_ancient_debris
scoreboard players operation #t25 rituals.soul_temp += @s rituals.m_netherite_block
scoreboard players operation #t25 rituals.soul_temp *= #25 rituals.data
scoreboard players operation #total rituals.soul_temp += #t25 rituals.soul_temp

# ----------------------------------------
# TIER 50 (50 XP)
# ----------------------------------------
scoreboard players set #t50 rituals.soul_temp 0
scoreboard players operation #t50 rituals.soul_temp += @s rituals.m_end_portal_frame
scoreboard players operation #t50 rituals.soul_temp *= #50 rituals.data
scoreboard players operation #total rituals.soul_temp += #t50 rituals.soul_temp
