# ========================================
# Auto-Farming Ritual Effect
# ========================================
# Automatically harvests and replants fully grown crops

# Ambient particles (show every tick)
particle minecraft:composter ~ ~2.5 ~ 0.5 0.5 0.5 0 3
particle happy_villager ~2 ~1 ~2 0.2 0.5 0.2 0 2
particle happy_villager ~-2 ~1 ~-2 0.2 0.5 0.2 0 2

# Get tier-based range settings
function rituals:ritual/get_tier_settings

# Get farming-specific frequency (check crops every 5 seconds by default)
scoreboard players set #current_freq rituals.temp 100

# Store current tier for use in scanning
scoreboard players operation #current_tier rituals.temp = @s rituals.tier

# Check timing using separate effect counter
# Initialize to frequency-1 so first add+check triggers immediately
execute unless score @s rituals.data matches -2147483648.. run scoreboard players operation @s rituals.data = #current_freq rituals.temp
execute unless score @s rituals.data matches -2147483648.. run scoreboard players remove @s rituals.data 1
scoreboard players add @s rituals.data 1
execute if score @s rituals.data < #current_freq rituals.temp run return 0
scoreboard players set @s rituals.data 0

# Calculate negative offsets for positioned command
scoreboard players operation #neg_h rituals.temp = #current_h_range rituals.temp
scoreboard players operation #neg_h rituals.temp *= #-1 rituals.data
scoreboard players operation #neg_v rituals.temp = #current_v_range rituals.temp
scoreboard players operation #neg_v rituals.temp *= #-1 rituals.data

# Calculate positive box sizes (2x range)
scoreboard players operation #box_h rituals.temp = #current_h_range rituals.temp
scoreboard players operation #box_h rituals.temp *= #2 rituals.data
scoreboard players operation #box_v rituals.temp = #current_v_range rituals.temp
scoreboard players operation #box_v rituals.temp *= #2 rituals.data

# Use execute store to get offset position, then scan box
execute store result storage rituals:temp neg_h int 1 run scoreboard players get #neg_h rituals.temp
execute store result storage rituals:temp neg_v int 1 run scoreboard players get #neg_v rituals.temp
execute store result storage rituals:temp box_h int 1 run scoreboard players get #box_h rituals.temp
execute store result storage rituals:temp box_v int 1 run scoreboard players get #box_v rituals.temp

# Scan area for fully grown crops
function rituals:ritual/effects/farming_scan_box with storage rituals:temp

