# ========================================
# Track Shovel Blocks - Weighted Tier XP
# ========================================
# Adds weighted shovel block counts to #total rituals.soul_temp
# Called from soul/track_blocks.mcfunction

# === TIER 1 (1 XP - direct add) ===
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
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sand
scoreboard players operation #total rituals.soul_temp += @s rituals.m_red_sand
scoreboard players operation #total rituals.soul_temp += @s rituals.m_gravel
scoreboard players operation #total rituals.soul_temp += @s rituals.m_snow
scoreboard players operation #total rituals.soul_temp += @s rituals.m_snow_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_powder_snow
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

# === TIER 2 (2 XP) ===
scoreboard players set #t2 rituals.soul_temp 0
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_clay
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_soul_sand
scoreboard players operation #t2 rituals.soul_temp += @s rituals.m_soul_soil
scoreboard players operation #t2 rituals.soul_temp *= #2 rituals.data
scoreboard players operation #total rituals.soul_temp += #t2 rituals.soul_temp

# === TIER 3 (3 XP) ===
scoreboard players set #t3 rituals.soul_temp 0
scoreboard players operation #t3 rituals.soul_temp += @s rituals.m_suspicious_sand
scoreboard players operation #t3 rituals.soul_temp += @s rituals.m_suspicious_gravel
scoreboard players operation #t3 rituals.soul_temp *= #3 rituals.data
scoreboard players operation #total rituals.soul_temp += #t3 rituals.soul_temp
