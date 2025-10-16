# ========================================
# Auto-Breeding Ritual Effect
# ========================================
# Automatically breeds animals in tier-based range

# Get tier-based range settings
function rituals:ritual/get_tier_settings

# Get breeding-specific frequency
function rituals:ritual/get_breeding_settings

# Check timing using separate effect counter (don't touch main timer!)
# Initialize to -1 on first run to trigger immediate breeding on activation
execute unless score @s rituals.data matches -2147483648.. run scoreboard players set @s rituals.data -1
scoreboard players add @s rituals.data 1

# DEBUG: Show timer and frequency every 5 seconds (100 ticks) - only if debug enabled
execute if score #rituals_debug_mode rituals.data matches 1 run scoreboard players operation #rituals_timer_mod rituals.temp = @s rituals.data
execute if score #rituals_debug_mode rituals.data matches 1 run scoreboard players operation #rituals_timer_mod rituals.temp %= #100 rituals.data
execute if score #rituals_debug_mode rituals.data matches 1 if score #rituals_timer_mod rituals.temp matches 0 run tellraw @a[distance=..10] [{"text":"[DEBUG BREEDING] Timer: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.data"},"color":"yellow"},{"text":" / ","color":"gray"},{"score":{"name":"#current_freq","objective":"rituals.temp"},"color":"yellow"},{"text":" | Range: ","color":"gray"},{"score":{"name":"#current_h_range","objective":"rituals.temp"},"color":"aqua"},{"text":"x","color":"gray"},{"score":{"name":"#current_v_range","objective":"rituals.temp"},"color":"aqua"}]

execute unless score @s rituals.data >= #current_freq rituals.temp run return 0
scoreboard players set @s rituals.data 0

# DEBUG: Breeding attempt happening - only if debug enabled
execute if score #rituals_debug_mode rituals.data matches 1 run tellraw @a[distance=..10] [{"text":"[DEBUG BREEDING] Breeding attempt now!","color":"green","bold":true}]

# Breed animals in tier-based range
# Find pairs of same-type animals and breed them
# Use #current_h_range for distance

# Store horizontal range for distance selector
execute store result storage rituals:temp h_range int 1 run scoreboard players get #current_h_range rituals.temp

# DEBUG: Show what's being stored - only if debug enabled
execute if score #rituals_debug_mode rituals.data matches 1 run tellraw @a[distance=..10] [{"text":"[DEBUG BREEDING] Calling tier-specific breeding","color":"red","bold":true}]

# DIRECT APPROACH: Just call it based on tier instead of macro bullshit
execute if score @s rituals.tier matches 1 run function rituals:ritual/effects/auto_breeding_tier1
execute if score @s rituals.tier matches 2 run function rituals:ritual/effects/auto_breeding_tier2
execute if score @s rituals.tier matches 3 run function rituals:ritual/effects/auto_breeding_tier3
execute if score @s rituals.tier matches 4 run function rituals:ritual/effects/auto_breeding_tier4
execute if score @s rituals.tier matches 5 run function rituals:ritual/effects/auto_breeding_tier5
execute if score @s rituals.tier matches 6 run function rituals:ritual/effects/auto_breeding_tier6

# Ambient particles
particle minecraft:heart ~ ~2 ~ 5 1 5 0.1 5 force
particle minecraft:composter ~ ~1.5 ~ 3 0.5 3 0.05 2 force

