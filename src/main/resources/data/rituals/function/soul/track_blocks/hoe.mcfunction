# ========================================
# Track Hoe Blocks - Weighted Tier XP
# ========================================
# Adds weighted hoe block counts to #total rituals.soul_temp
# Called from soul/track_blocks.mcfunction

# === TIER 1 (1 XP - direct add) ===
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
scoreboard players operation #total rituals.soul_temp += @s rituals.m_dried_kelp_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_moss_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_moss_carpet
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pale_moss_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pale_moss_carpet
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pale_hanging_moss
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sculk_vein
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

# === TIER 2 (2 XP) ===
scoreboard players set #t2 rituals.soul_temp 0
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_hay_block
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_target
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_nether_wart_block
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_warped_wart_block
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_shroomlight
scoreboard players operation #t2 rituals.soul_temp *= #2 rituals.data
scoreboard players operation #total rituals.soul_temp += #t2 rituals.soul_temp

# === TIER 3 (3 XP) ===
scoreboard players set #t3 rituals.soul_temp 0
scoreboard players operation #t3 rituals.soul_temp += @s rituals.m_sculk
scoreboard players operation #t3 rituals.soul_temp += @s rituals.m_sponge
scoreboard players operation #t3 rituals.soul_temp += @s rituals.m_wet_sponge
scoreboard players operation #t3 rituals.soul_temp *= #3 rituals.data
scoreboard players operation #total rituals.soul_temp += #t3 rituals.soul_temp

# === TIER 4 (4 XP) ===
scoreboard players set #t4 rituals.soul_temp 0
scoreboard players operation #t4 rituals.soul_temp += @s rituals.m_sculk_sensor
scoreboard players operation #t4 rituals.soul_temp *= #4 rituals.data
scoreboard players operation #total rituals.soul_temp += #t4 rituals.soul_temp

# === TIER 5 (5 XP) ===
scoreboard players set #t5 rituals.soul_temp 0
scoreboard players operation #t5 rituals.soul_temp += @s rituals.m_sculk_catalyst
scoreboard players operation #t5 rituals.soul_temp += @s rituals.m_calibrated_sculk_sensor
scoreboard players operation #t5 rituals.soul_temp += @s rituals.m_sculk_shrieker
scoreboard players operation #t5 rituals.soul_temp *= #5 rituals.data
scoreboard players operation #total rituals.soul_temp += #t5 rituals.soul_temp
