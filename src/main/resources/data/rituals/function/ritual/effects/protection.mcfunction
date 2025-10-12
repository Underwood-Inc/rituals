# ========================================
# Protection Ritual Effect
# ========================================
# Damages hostile mobs in range

# Get tier-based range settings
function rituals:ritual/get_tier_settings

# Get protection-specific frequency
function rituals:ritual/get_protection_settings

# Check timing using separate effect counter
scoreboard players add @s rituals.distance 1
execute unless score @s rituals.distance >= #current_freq rituals.temp run return 0
scoreboard players set @s rituals.distance 0

# Calculate range box (same as sentry but simpler)
scoreboard players operation #neg_h rituals.temp = #current_h_range rituals.temp
scoreboard players operation #neg_h rituals.temp *= #-1 rituals.data
scoreboard players operation #neg_v rituals.temp = #current_v_range rituals.temp
scoreboard players operation #neg_v rituals.temp *= #-1 rituals.data

scoreboard players operation #box_h rituals.temp = #current_h_range rituals.temp
scoreboard players operation #box_h rituals.temp *= #2 rituals.data

scoreboard players operation #box_v rituals.temp = #current_v_range rituals.temp
scoreboard players operation #box_v rituals.temp *= #2 rituals.data

# Store damage based on tier
execute if score @s rituals.tier matches 1 run scoreboard players set #protection_damage rituals.temp 2
execute if score @s rituals.tier matches 2 run scoreboard players set #protection_damage rituals.temp 3
execute if score @s rituals.tier matches 3 run scoreboard players set #protection_damage rituals.temp 4
execute if score @s rituals.tier matches 4 run scoreboard players set #protection_damage rituals.temp 5
execute if score @s rituals.tier matches 5 run scoreboard players set #protection_damage rituals.temp 7
execute if score @s rituals.tier matches 6 run scoreboard players set #protection_damage rituals.temp 10

# Store for macro
execute store result storage rituals:temp neg_h int 1 run scoreboard players get #neg_h rituals.temp
execute store result storage rituals:temp neg_v int 1 run scoreboard players get #neg_v rituals.temp
execute store result storage rituals:temp box_h int 1 run scoreboard players get #box_h rituals.temp
execute store result storage rituals:temp box_v int 1 run scoreboard players get #box_v rituals.temp

# Damage all hostile mobs in range
function rituals:ritual/effects/protection_damage with storage rituals:temp

# Ambient particles
particle dust{color:[0.5,0.7,1.0],scale:1.5} ~ ~1 ~ 2 1 2 0.1 5
