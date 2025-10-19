# ========================================
# Growth Ritual Effect
# ========================================
# Grows crops in tier-based range

# Get tier-based range settings
function rituals:ritual/get_tier_settings

# Get growth-specific frequency
function rituals:ritual/get_growth_settings

# Store current tier for use in growth chance calculation
scoreboard players operation #current_tier rituals.temp = @s rituals.tier

# Check timing using separate effect counter (don't touch main timer!)
scoreboard players add @s rituals.data 1

# DEBUG: Show timer and frequency every 5 seconds (100 ticks) - only if debug enabled
execute if score #rituals_debug_mode rituals.data matches 1 run scoreboard players operation #rituals_timer_mod rituals.temp = @s rituals.data
execute if score #rituals_debug_mode rituals.data matches 1 run scoreboard players operation #rituals_timer_mod rituals.temp %= #100 rituals.data
execute if score #rituals_debug_mode rituals.data matches 1 if score #rituals_timer_mod rituals.temp matches 0 run tellraw @a[distance=..10] [{"text":"[DEBUG GROWTH] Timer: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.data"},"color":"yellow"},{"text":" / ","color":"gray"},{"score":{"name":"#current_freq","objective":"rituals.temp"},"color":"yellow"},{"text":" | Range: ","color":"gray"},{"score":{"name":"#current_h_range","objective":"rituals.temp"},"color":"green"},{"text":"x","color":"gray"},{"score":{"name":"#current_v_range","objective":"rituals.temp"},"color":"green"}]

execute unless score @s rituals.data >= #current_freq rituals.temp run return 0
scoreboard players set @s rituals.data 0

# DEBUG: Growth attempt happening - only if debug enabled
execute if score #rituals_debug_mode rituals.data matches 1 run tellraw @a[distance=..10] [{"text":"[DEBUG GROWTH] Growth attempt now!","color":"green","bold":true}]

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

# DEBUG: Calling tier-specific growth - only if debug enabled
execute if score #rituals_debug_mode rituals.data matches 1 run tellraw @a[distance=..10] [{"text":"[DEBUG GROWTH] Calling tier-specific growth","color":"red","bold":true}]

# Scan area with macro (or direct positioned check)
function rituals:ritual/effects/growth_scan_box with storage rituals:temp

# Ambient particles - REMOVED: Beam-like particles at corners
# particle happy_villager ~2 ~1 ~2 0.2 0.5 0.2 0 2
# particle happy_villager ~-2 ~1 ~-2 0.2 0.5 0.2 0 2

