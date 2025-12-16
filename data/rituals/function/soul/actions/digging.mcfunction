# ========================================
# Digging Action - Shovel XP (Full Block Tracking)
# ========================================
# Tracks ALL shovel blocks and awards XP based on config
# Minecraft 1.21.11 - Complete block mapping

# Debug: confirm function is being called
execute if entity @a[tag=rituals.debug] run tellraw @a[tag=rituals.debug] [{"text":"[Soul Debug] ","color":"gold"},{"text":"Digging action called for ","color":"gray"},{"selector":"@s"}]

# === SUM ALL DUG BLOCKS ===
scoreboard players set #total rituals.soul_temp 0

# Dirt types (1 XP each)
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

# Suspicious blocks (3 XP - archaeology bonus)
scoreboard players set #sus rituals.soul_temp 0
scoreboard players operation #sus rituals.soul_temp += @s rituals.m_suspicious_sand
scoreboard players operation #sus rituals.soul_temp += @s rituals.m_suspicious_gravel
scoreboard players operation #sus rituals.soul_temp *= #3 rituals.data
scoreboard players operation #total rituals.soul_temp += #sus rituals.soul_temp

# Gravel (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_gravel

# Clay (2 XP)
scoreboard players set #clay rituals.soul_temp 0
scoreboard players operation #clay rituals.soul_temp += @s rituals.m_clay
scoreboard players operation #clay rituals.soul_temp *= #2 rituals.data
scoreboard players operation #total rituals.soul_temp += #clay rituals.soul_temp

# Soul blocks (2 XP)
scoreboard players set #soul rituals.soul_temp 0
scoreboard players operation #soul rituals.soul_temp += @s rituals.m_soul_sand
scoreboard players operation #soul rituals.soul_temp += @s rituals.m_soul_soil
scoreboard players operation #soul rituals.soul_temp *= #2 rituals.data
scoreboard players operation #total rituals.soul_temp += #soul rituals.soul_temp

# Snow (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_snow
scoreboard players operation #total rituals.soul_temp += @s rituals.m_snow_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_powder_snow

# Concrete powder (1 XP each)
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

# === CALCULATE XP DELTA ===
# Initialize player's prev_shovel if they've never had it set (undefined becomes 0)
execute unless score @s rituals.prev_shovel matches -2147483648.. run scoreboard players set @s rituals.prev_shovel 0

# Store current total
scoreboard players operation @s rituals.shovel_mined = #total rituals.soul_temp

# Calculate gain since last check
scoreboard players operation #xp_gain rituals.soul_temp = @s rituals.shovel_mined
scoreboard players operation #xp_gain rituals.soul_temp -= @s rituals.prev_shovel

# Debug: show calculated values
execute if entity @a[tag=rituals.debug] run tellraw @a[tag=rituals.debug] [{"text":"[Soul Debug] ","color":"gold"},{"text":"Shovel total: ","color":"gray"},{"score":{"name":"#total","objective":"rituals.soul_temp"},"color":"aqua"},{"text":" | prev: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.prev_shovel"},"color":"yellow"},{"text":" | gain: ","color":"gray"},{"score":{"name":"#xp_gain","objective":"rituals.soul_temp"},"color":"green"}]

# === AWARD XP ===
execute if score #xp_gain rituals.soul_temp matches 1.. run function rituals:soul/award_xp
scoreboard players operation @s rituals.prev_shovel = @s rituals.shovel_mined

