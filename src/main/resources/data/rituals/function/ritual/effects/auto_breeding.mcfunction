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
execute unless score @s rituals.data >= #current_freq rituals.temp run return 0
scoreboard players set @s rituals.data 0

# Breed animals in tier-based range
# Find pairs of same-type animals and breed them
# Use #current_h_range for distance

# Store horizontal range for distance selector
execute store result storage rituals:temp h_range int 1 run scoreboard players get #current_h_range rituals.temp

# Breed using macro function to handle dynamic distance
function rituals:ritual/effects/auto_breeding_apply with storage rituals:temp

# Ambient particles
particle minecraft:heart ~ ~2 ~ 5 1 5 0.1 5 force
particle minecraft:composter ~ ~1.5 ~ 3 0.5 3 0.05 2 force


