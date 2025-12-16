# ========================================
# Harvesting Action - Hoe XP (Full Block Tracking)
# ========================================
# Tracks ALL hoe blocks and awards XP based on config
# Minecraft 1.21.11 - Complete block mapping

# === SUM ALL HARVESTED BLOCKS ===
scoreboard players set #total rituals.soul_temp 0

# === LEAVES (1 XP each) ===
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

# === HAY/TARGET (2 XP) ===
scoreboard players set #hay rituals.soul_temp 0
scoreboard players operation #hay rituals.soul_temp += @s rituals.m_hay_block
scoreboard players operation #hay rituals.soul_temp += @s rituals.m_target
scoreboard players operation #hay rituals.soul_temp *= #2 rituals.data
scoreboard players operation #total rituals.soul_temp += #hay rituals.soul_temp

# Dried kelp (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_dried_kelp_block

# === MOSS (1 XP) ===
scoreboard players operation #total rituals.soul_temp += @s rituals.m_moss_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_moss_carpet
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pale_moss_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pale_moss_carpet
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pale_hanging_moss

# === SCULK (3-5 XP) ===
scoreboard players set #sculk rituals.soul_temp 0
scoreboard players operation #sculk rituals.soul_temp += @s rituals.m_sculk
scoreboard players operation #sculk rituals.soul_temp *= #3 rituals.data
scoreboard players operation #total rituals.soul_temp += #sculk rituals.soul_temp

scoreboard players operation #total rituals.soul_temp += @s rituals.m_sculk_vein

scoreboard players set #sculk_rare rituals.soul_temp 0
scoreboard players operation #sculk_rare rituals.soul_temp += @s rituals.m_sculk_catalyst
scoreboard players operation #sculk_rare rituals.soul_temp += @s rituals.m_sculk_shrieker
scoreboard players operation #sculk_rare rituals.soul_temp += @s rituals.m_calibrated_sculk_sensor
scoreboard players operation #sculk_rare rituals.soul_temp *= #5 rituals.data
scoreboard players operation #total rituals.soul_temp += #sculk_rare rituals.soul_temp

scoreboard players set #sculk_sensor rituals.soul_temp 0
scoreboard players operation #sculk_sensor rituals.soul_temp += @s rituals.m_sculk_sensor
scoreboard players operation #sculk_sensor rituals.soul_temp *= #4 rituals.data
scoreboard players operation #total rituals.soul_temp += #sculk_sensor rituals.soul_temp

# === SPONGE (3 XP) ===
scoreboard players set #sponge rituals.soul_temp 0
scoreboard players operation #sponge rituals.soul_temp += @s rituals.m_sponge
scoreboard players operation #sponge rituals.soul_temp += @s rituals.m_wet_sponge
scoreboard players operation #sponge rituals.soul_temp *= #3 rituals.data
scoreboard players operation #total rituals.soul_temp += #sponge rituals.soul_temp

# === NETHER WART BLOCKS (2 XP) ===
scoreboard players set #wart rituals.soul_temp 0
scoreboard players operation #wart rituals.soul_temp += @s rituals.m_nether_wart_block_hoe
scoreboard players operation #wart rituals.soul_temp += @s rituals.m_warped_wart_block_hoe
scoreboard players operation #wart rituals.soul_temp += @s rituals.m_shroomlight_hoe
scoreboard players operation #wart rituals.soul_temp *= #2 rituals.data
scoreboard players operation #total rituals.soul_temp += #wart rituals.soul_temp

# === WOOL (1 XP each) ===
scoreboard players operation #total rituals.soul_temp += @s rituals.m_white_wool
scoreboard players operation #total rituals.soul_temp += @s rituals.m_orange_wool
scoreboard players operation #total rituals.soul_temp += @s rituals.m_magenta_wool
scoreboard players operation #total rituals.soul_temp += @s rituals.m_light_blue_wool
scoreboard players operation #total rituals.soul_temp += @s rituals.m_yellow_wool
scoreboard players operation #total rituals.soul_temp += @s rituals.m_lime_wool
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pink_wool
scoreboard players operation #total rituals.soul_temp += @s rituals.m_gray_wool
scoreboard players operation #total rituals.soul_temp += @s rituals.m_light_gray_wool
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cyan_wool
scoreboard players operation #total rituals.soul_temp += @s rituals.m_purple_wool
scoreboard players operation #total rituals.soul_temp += @s rituals.m_blue_wool
scoreboard players operation #total rituals.soul_temp += @s rituals.m_brown_wool
scoreboard players operation #total rituals.soul_temp += @s rituals.m_green_wool
scoreboard players operation #total rituals.soul_temp += @s rituals.m_red_wool
scoreboard players operation #total rituals.soul_temp += @s rituals.m_black_wool

# === CARPET (1 XP each) ===
scoreboard players operation #total rituals.soul_temp += @s rituals.m_white_carpet
scoreboard players operation #total rituals.soul_temp += @s rituals.m_orange_carpet
scoreboard players operation #total rituals.soul_temp += @s rituals.m_magenta_carpet
scoreboard players operation #total rituals.soul_temp += @s rituals.m_light_blue_carpet
scoreboard players operation #total rituals.soul_temp += @s rituals.m_yellow_carpet
scoreboard players operation #total rituals.soul_temp += @s rituals.m_lime_carpet
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pink_carpet
scoreboard players operation #total rituals.soul_temp += @s rituals.m_gray_carpet
scoreboard players operation #total rituals.soul_temp += @s rituals.m_light_gray_carpet
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cyan_carpet
scoreboard players operation #total rituals.soul_temp += @s rituals.m_purple_carpet
scoreboard players operation #total rituals.soul_temp += @s rituals.m_blue_carpet
scoreboard players operation #total rituals.soul_temp += @s rituals.m_brown_carpet
scoreboard players operation #total rituals.soul_temp += @s rituals.m_green_carpet
scoreboard players operation #total rituals.soul_temp += @s rituals.m_red_carpet
scoreboard players operation #total rituals.soul_temp += @s rituals.m_black_carpet

# === CROPS (2 XP each) ===
scoreboard players set #crops rituals.soul_temp 0
scoreboard players operation #crops rituals.soul_temp += @s rituals.m_wheat
scoreboard players operation #crops rituals.soul_temp += @s rituals.m_carrots
scoreboard players operation #crops rituals.soul_temp += @s rituals.m_potatoes
scoreboard players operation #crops rituals.soul_temp += @s rituals.m_beetroots
scoreboard players operation #crops rituals.soul_temp += @s rituals.m_nether_wart
scoreboard players operation #crops rituals.soul_temp += @s rituals.m_sweet_berry_bush
scoreboard players operation #crops rituals.soul_temp += @s rituals.m_cave_vines
scoreboard players operation #crops rituals.soul_temp += @s rituals.m_cave_vines_plant
scoreboard players operation #crops rituals.soul_temp += @s rituals.m_torchflower
scoreboard players operation #crops rituals.soul_temp += @s rituals.m_torchflower_crop
scoreboard players operation #crops rituals.soul_temp += @s rituals.m_pitcher_crop
scoreboard players operation #crops rituals.soul_temp += @s rituals.m_pitcher_plant
scoreboard players operation #crops rituals.soul_temp *= #2 rituals.data
scoreboard players operation #total rituals.soul_temp += #crops rituals.soul_temp

# === VINES/PLANTS (1 XP) ===
scoreboard players operation #total rituals.soul_temp += @s rituals.m_vine
scoreboard players operation #total rituals.soul_temp += @s rituals.m_glow_lichen
scoreboard players operation #total rituals.soul_temp += @s rituals.m_hanging_roots
scoreboard players operation #total rituals.soul_temp += @s rituals.m_spore_blossom
scoreboard players operation #total rituals.soul_temp += @s rituals.m_big_dripleaf
scoreboard players operation #total rituals.soul_temp += @s rituals.m_big_dripleaf_stem
scoreboard players operation #total rituals.soul_temp += @s rituals.m_small_dripleaf

# === CALCULATE XP DELTA ===
scoreboard players operation @s rituals.hoe_mined = #total rituals.soul_temp
execute unless score @s rituals.prev_hoe matches 0.. run scoreboard players operation @s rituals.prev_hoe = @s rituals.hoe_mined
scoreboard players operation #xp_gain rituals.soul_temp = @s rituals.hoe_mined
scoreboard players operation #xp_gain rituals.soul_temp -= @s rituals.prev_hoe

# === AWARD XP ===
execute if score #xp_gain rituals.soul_temp matches 1.. run function rituals:soul/award_xp
scoreboard players operation @s rituals.prev_hoe = @s rituals.hoe_mined

