# ========================================
# Chopping Action - Axe XP (Full Block Tracking)
# ========================================
# Tracks ALL axe blocks and awards XP based on config
# Minecraft 1.21.11 - Complete block mapping

# === SUM ALL CHOPPED BLOCKS ===
scoreboard players set #total rituals.soul_temp 0

# === LOGS (2 XP each) ===
scoreboard players set #logs rituals.soul_temp 0
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_oak_log
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_oak_wood
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_stripped_oak_log
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_stripped_oak_wood
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_spruce_log
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_spruce_wood
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_stripped_spruce_log
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_stripped_spruce_wood
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_birch_log
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_birch_wood
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_stripped_birch_log
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_stripped_birch_wood
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_jungle_log
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_jungle_wood
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_stripped_jungle_log
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_stripped_jungle_wood
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_acacia_log
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_acacia_wood
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_stripped_acacia_log
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_stripped_acacia_wood
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_dark_oak_log
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_dark_oak_wood
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_stripped_dark_oak_log
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_stripped_dark_oak_wood
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_mangrove_log
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_mangrove_wood
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_stripped_mangrove_log
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_stripped_mangrove_wood
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_mangrove_roots
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_cherry_log
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_cherry_wood
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_stripped_cherry_log
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_stripped_cherry_wood
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_pale_oak_log
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_pale_oak_wood
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_stripped_pale_oak_log
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_stripped_pale_oak_wood
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_bamboo_block
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_stripped_bamboo_block
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_crimson_stem
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_crimson_hyphae
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_stripped_crimson_stem
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_stripped_crimson_hyphae
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_warped_stem
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_warped_hyphae
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_stripped_warped_stem
scoreboard players operation #logs rituals.soul_temp += @s rituals.m_stripped_warped_hyphae
scoreboard players operation #logs rituals.soul_temp *= #2 rituals.data
scoreboard players operation #total rituals.soul_temp += #logs rituals.soul_temp

# === PLANKS/WOOD ITEMS (1 XP each) ===
scoreboard players operation #total rituals.soul_temp += @s rituals.m_oak_planks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_oak_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_oak_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_oak_fence
scoreboard players operation #total rituals.soul_temp += @s rituals.m_oak_fence_gate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_oak_door
scoreboard players operation #total rituals.soul_temp += @s rituals.m_oak_trapdoor
scoreboard players operation #total rituals.soul_temp += @s rituals.m_oak_pressure_plate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_oak_button
scoreboard players operation #total rituals.soul_temp += @s rituals.m_oak_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_oak_wall_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_oak_hanging_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_oak_wall_hanging_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_spruce_planks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_spruce_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_spruce_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_spruce_fence
scoreboard players operation #total rituals.soul_temp += @s rituals.m_spruce_fence_gate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_spruce_door
scoreboard players operation #total rituals.soul_temp += @s rituals.m_spruce_trapdoor
scoreboard players operation #total rituals.soul_temp += @s rituals.m_spruce_pressure_plate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_spruce_button
scoreboard players operation #total rituals.soul_temp += @s rituals.m_spruce_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_spruce_wall_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_spruce_hanging_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_spruce_wall_hanging_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_birch_planks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_birch_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_birch_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_birch_fence
scoreboard players operation #total rituals.soul_temp += @s rituals.m_birch_fence_gate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_birch_door
scoreboard players operation #total rituals.soul_temp += @s rituals.m_birch_trapdoor
scoreboard players operation #total rituals.soul_temp += @s rituals.m_birch_pressure_plate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_birch_button
scoreboard players operation #total rituals.soul_temp += @s rituals.m_birch_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_birch_wall_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_birch_hanging_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_birch_wall_hanging_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_jungle_planks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_jungle_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_jungle_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_jungle_fence
scoreboard players operation #total rituals.soul_temp += @s rituals.m_jungle_fence_gate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_jungle_door
scoreboard players operation #total rituals.soul_temp += @s rituals.m_jungle_trapdoor
scoreboard players operation #total rituals.soul_temp += @s rituals.m_jungle_pressure_plate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_jungle_button
scoreboard players operation #total rituals.soul_temp += @s rituals.m_jungle_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_jungle_wall_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_jungle_hanging_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_jungle_wall_hanging_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_acacia_planks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_acacia_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_acacia_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_acacia_fence
scoreboard players operation #total rituals.soul_temp += @s rituals.m_acacia_fence_gate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_acacia_door
scoreboard players operation #total rituals.soul_temp += @s rituals.m_acacia_trapdoor
scoreboard players operation #total rituals.soul_temp += @s rituals.m_acacia_pressure_plate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_acacia_button
scoreboard players operation #total rituals.soul_temp += @s rituals.m_acacia_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_acacia_wall_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_acacia_hanging_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_acacia_wall_hanging_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_dark_oak_planks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_dark_oak_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_dark_oak_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_dark_oak_fence
scoreboard players operation #total rituals.soul_temp += @s rituals.m_dark_oak_fence_gate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_dark_oak_door
scoreboard players operation #total rituals.soul_temp += @s rituals.m_dark_oak_trapdoor
scoreboard players operation #total rituals.soul_temp += @s rituals.m_dark_oak_pressure_plate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_dark_oak_button
scoreboard players operation #total rituals.soul_temp += @s rituals.m_dark_oak_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_dark_oak_wall_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_dark_oak_hanging_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_dark_oak_wall_hanging_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mangrove_planks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mangrove_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mangrove_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mangrove_fence
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mangrove_fence_gate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mangrove_door
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mangrove_trapdoor
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mangrove_pressure_plate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mangrove_button
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mangrove_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mangrove_wall_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mangrove_hanging_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mangrove_wall_hanging_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cherry_planks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cherry_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cherry_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cherry_fence
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cherry_fence_gate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cherry_door
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cherry_trapdoor
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cherry_pressure_plate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cherry_button
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cherry_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cherry_wall_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cherry_hanging_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cherry_wall_hanging_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pale_oak_planks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pale_oak_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pale_oak_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pale_oak_fence
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pale_oak_fence_gate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pale_oak_door
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pale_oak_trapdoor
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pale_oak_pressure_plate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pale_oak_button
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pale_oak_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pale_oak_wall_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pale_oak_hanging_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pale_oak_wall_hanging_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_bamboo_planks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_bamboo_mosaic
scoreboard players operation #total rituals.soul_temp += @s rituals.m_bamboo_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_bamboo_mosaic_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_bamboo_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_bamboo_mosaic_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_bamboo_fence
scoreboard players operation #total rituals.soul_temp += @s rituals.m_bamboo_fence_gate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_bamboo_door
scoreboard players operation #total rituals.soul_temp += @s rituals.m_bamboo_trapdoor
scoreboard players operation #total rituals.soul_temp += @s rituals.m_bamboo_pressure_plate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_bamboo_button
scoreboard players operation #total rituals.soul_temp += @s rituals.m_bamboo_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_bamboo_wall_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_bamboo_hanging_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_bamboo_wall_hanging_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_bamboo
scoreboard players operation #total rituals.soul_temp += @s rituals.m_crimson_planks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_crimson_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_crimson_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_crimson_fence
scoreboard players operation #total rituals.soul_temp += @s rituals.m_crimson_fence_gate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_crimson_door
scoreboard players operation #total rituals.soul_temp += @s rituals.m_crimson_trapdoor
scoreboard players operation #total rituals.soul_temp += @s rituals.m_crimson_pressure_plate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_crimson_button
scoreboard players operation #total rituals.soul_temp += @s rituals.m_crimson_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_crimson_wall_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_crimson_hanging_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_crimson_wall_hanging_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_warped_planks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_warped_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_warped_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_warped_fence
scoreboard players operation #total rituals.soul_temp += @s rituals.m_warped_fence_gate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_warped_door
scoreboard players operation #total rituals.soul_temp += @s rituals.m_warped_trapdoor
scoreboard players operation #total rituals.soul_temp += @s rituals.m_warped_pressure_plate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_warped_button
scoreboard players operation #total rituals.soul_temp += @s rituals.m_warped_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_warped_wall_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_warped_hanging_sign
scoreboard players operation #total rituals.soul_temp += @s rituals.m_warped_wall_hanging_sign

# === UTILITY BLOCKS (2 XP each) ===
scoreboard players set #util rituals.soul_temp 0
scoreboard players operation #util rituals.soul_temp += @s rituals.m_crafting_table
scoreboard players operation #util rituals.soul_temp += @s rituals.m_cartography_table
scoreboard players operation #util rituals.soul_temp += @s rituals.m_fletching_table
scoreboard players operation #util rituals.soul_temp += @s rituals.m_smithing_table
scoreboard players operation #util rituals.soul_temp += @s rituals.m_loom
scoreboard players operation #util rituals.soul_temp += @s rituals.m_bookshelf
scoreboard players operation #util rituals.soul_temp += @s rituals.m_chiseled_bookshelf
scoreboard players operation #util rituals.soul_temp += @s rituals.m_lectern
scoreboard players operation #util rituals.soul_temp += @s rituals.m_barrel
scoreboard players operation #util rituals.soul_temp += @s rituals.m_chest
scoreboard players operation #util rituals.soul_temp += @s rituals.m_trapped_chest
scoreboard players operation #util rituals.soul_temp += @s rituals.m_note_block
scoreboard players operation #util rituals.soul_temp += @s rituals.m_beehive
scoreboard players operation #util rituals.soul_temp += @s rituals.m_bee_nest
scoreboard players operation #util rituals.soul_temp += @s rituals.m_campfire
scoreboard players operation #util rituals.soul_temp += @s rituals.m_soul_campfire
scoreboard players operation #util rituals.soul_temp += @s rituals.m_daylight_detector
scoreboard players operation #util rituals.soul_temp *= #2 rituals.data
scoreboard players operation #total rituals.soul_temp += #util rituals.soul_temp

# Jukebox (3 XP)
scoreboard players set #juke rituals.soul_temp 0
scoreboard players operation #juke rituals.soul_temp += @s rituals.m_jukebox
scoreboard players operation #juke rituals.soul_temp *= #3 rituals.data
scoreboard players operation #total rituals.soul_temp += #juke rituals.soul_temp

# Composter/Ladder (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_composter
scoreboard players operation #total rituals.soul_temp += @s rituals.m_ladder

# Melon/Pumpkin (2 XP)
scoreboard players set #melons rituals.soul_temp 0
scoreboard players operation #melons rituals.soul_temp += @s rituals.m_pumpkin
scoreboard players operation #melons rituals.soul_temp += @s rituals.m_carved_pumpkin
scoreboard players operation #melons rituals.soul_temp += @s rituals.m_jack_o_lantern
scoreboard players operation #melons rituals.soul_temp += @s rituals.m_melon
scoreboard players operation #melons rituals.soul_temp *= #2 rituals.data
scoreboard players operation #total rituals.soul_temp += #melons rituals.soul_temp

# Mushroom blocks (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_brown_mushroom_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_red_mushroom_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mushroom_stem

# Nether fungus (2 XP)
scoreboard players set #fungus rituals.soul_temp 0
scoreboard players operation #fungus rituals.soul_temp += @s rituals.m_nether_wart_block
scoreboard players operation #fungus rituals.soul_temp += @s rituals.m_warped_wart_block
scoreboard players operation #fungus rituals.soul_temp += @s rituals.m_shroomlight
scoreboard players operation #fungus rituals.soul_temp *= #2 rituals.data
scoreboard players operation #total rituals.soul_temp += #fungus rituals.soul_temp

# Cocoa (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cocoa

# === CALCULATE XP DELTA ===
scoreboard players operation @s rituals.axe_mined = #total rituals.soul_temp
execute unless score @s rituals.prev_axe matches 0.. run scoreboard players operation @s rituals.prev_axe = @s rituals.axe_mined
scoreboard players operation #xp_gain rituals.soul_temp = @s rituals.axe_mined
scoreboard players operation #xp_gain rituals.soul_temp -= @s rituals.prev_axe

# === AWARD XP ===
execute if score #xp_gain rituals.soul_temp matches 1.. run function rituals:soul/award_xp
scoreboard players operation @s rituals.prev_axe = @s rituals.axe_mined

