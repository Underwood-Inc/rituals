# ========================================
# Track Shovel Blocks - Config-Driven XP
# ========================================
# Each block's mined count is multiplied by its XP value from rituals.config
# Config values set in config/soul_xp/shovel_blocks.mcfunction
# Called from soul/track_blocks.mcfunction

# === DIRT TYPES ===
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_dirt
scoreboard players operation #bxp rituals.soul_temp *= #xp_dirt rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_grass_block
scoreboard players operation #bxp rituals.soul_temp *= #xp_grass_block rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_dirt_path
scoreboard players operation #bxp rituals.soul_temp *= #xp_dirt_path rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_coarse_dirt
scoreboard players operation #bxp rituals.soul_temp *= #xp_coarse_dirt rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_rooted_dirt
scoreboard players operation #bxp rituals.soul_temp *= #xp_rooted_dirt rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_podzol
scoreboard players operation #bxp rituals.soul_temp *= #xp_podzol rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_mycelium
scoreboard players operation #bxp rituals.soul_temp *= #xp_mycelium rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_farmland
scoreboard players operation #bxp rituals.soul_temp *= #xp_farmland rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_mud
scoreboard players operation #bxp rituals.soul_temp *= #xp_mud rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_muddy_mangrove_roots
scoreboard players operation #bxp rituals.soul_temp *= #xp_muddy_mangrove_roots rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_packed_mud
scoreboard players operation #bxp rituals.soul_temp *= #xp_packed_mud rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

# === SAND ===
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_sand
scoreboard players operation #bxp rituals.soul_temp *= #xp_sand rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_red_sand
scoreboard players operation #bxp rituals.soul_temp *= #xp_red_sand rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_suspicious_sand
scoreboard players operation #bxp rituals.soul_temp *= #xp_suspicious_sand rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_suspicious_gravel
scoreboard players operation #bxp rituals.soul_temp *= #xp_suspicious_gravel rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

# === GRAVEL ===
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_gravel
scoreboard players operation #bxp rituals.soul_temp *= #xp_gravel rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

# === CLAY ===
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_clay
scoreboard players operation #bxp rituals.soul_temp *= #xp_clay rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

# === SOUL BLOCKS ===
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_soul_sand
scoreboard players operation #bxp rituals.soul_temp *= #xp_soul_sand rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_soul_soil
scoreboard players operation #bxp rituals.soul_temp *= #xp_soul_soil rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

# === SNOW ===
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_snow
scoreboard players operation #bxp rituals.soul_temp *= #xp_snow rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_snow_block
scoreboard players operation #bxp rituals.soul_temp *= #xp_snow_block rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_powder_snow
scoreboard players operation #bxp rituals.soul_temp *= #xp_powder_snow rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

# === CONCRETE POWDER ===
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_white_concrete_powder
scoreboard players operation #bxp rituals.soul_temp *= #xp_white_concrete_powder rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_orange_concrete_powder
scoreboard players operation #bxp rituals.soul_temp *= #xp_orange_concrete_powder rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_magenta_concrete_powder
scoreboard players operation #bxp rituals.soul_temp *= #xp_magenta_concrete_powder rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_light_blue_concrete_powder
scoreboard players operation #bxp rituals.soul_temp *= #xp_light_blue_concrete_powder rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_yellow_concrete_powder
scoreboard players operation #bxp rituals.soul_temp *= #xp_yellow_concrete_powder rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_lime_concrete_powder
scoreboard players operation #bxp rituals.soul_temp *= #xp_lime_concrete_powder rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_pink_concrete_powder
scoreboard players operation #bxp rituals.soul_temp *= #xp_pink_concrete_powder rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_gray_concrete_powder
scoreboard players operation #bxp rituals.soul_temp *= #xp_gray_concrete_powder rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_light_gray_concrete_powder
scoreboard players operation #bxp rituals.soul_temp *= #xp_light_gray_concrete_powder rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_cyan_concrete_powder
scoreboard players operation #bxp rituals.soul_temp *= #xp_cyan_concrete_powder rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_purple_concrete_powder
scoreboard players operation #bxp rituals.soul_temp *= #xp_purple_concrete_powder rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_blue_concrete_powder
scoreboard players operation #bxp rituals.soul_temp *= #xp_blue_concrete_powder rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_brown_concrete_powder
scoreboard players operation #bxp rituals.soul_temp *= #xp_brown_concrete_powder rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_green_concrete_powder
scoreboard players operation #bxp rituals.soul_temp *= #xp_green_concrete_powder rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_red_concrete_powder
scoreboard players operation #bxp rituals.soul_temp *= #xp_red_concrete_powder rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
scoreboard players operation #bxp rituals.soul_temp = @s rituals.m_black_concrete_powder
scoreboard players operation #bxp rituals.soul_temp *= #xp_black_concrete_powder rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
