# ========================================
# Growth Ritual Effect
# ========================================
# Grows crops in tier-based range

# Get tier-based settings from config
function rituals:ritual/get_tier_settings

# Check if enough time has passed based on frequency
execute unless score @s rituals.timer >= #current_freq rituals.temp run return 0
scoreboard players operation @s rituals.timer -= #current_freq rituals.temp

# Apply bonemeal to ALL crops in box range (dx/dy/dz)
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

# Scan area with macro (or direct positioned check)
function rituals:ritual/effects/growth_scan_box with storage rituals:temp

# Ambient particles
particle happy_villager ~2 ~1 ~2 0.2 0.5 0.2 0 2
particle happy_villager ~-2 ~1 ~-2 0.2 0.5 0.2 0 2

