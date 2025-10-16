# ========================================
# XP Harvester Ritual Effect
# ========================================
# Generates XP over time based on tier (1-6 XP per second)
# Tier 1: 1 XP/sec | Tier 2: 2 XP/sec | Tier 3: 3 XP/sec
# Tier 4: 4 XP/sec | Tier 5: 5 XP/sec | Tier 6: 6 XP/sec
# REQUIRES REDSTONE POWER to operate (performance optimization)

# Check if totem is powered by redstone - if not, skip entirely
execute unless entity @s[tag=rituals.redstone_powered] run return 0

# Get tier-based range settings
function rituals:ritual/get_tier_settings

# Get xp_harvester-specific frequency
function rituals:ritual/get_xp_harvester_settings

# Check timing using separate effect counter
scoreboard players add @s rituals.distance 1

# DEBUG: Show timer and frequency every 5 seconds (100 ticks) - only if debug enabled
execute if entity @s[tag=rituals.debug] run scoreboard players operation #timer_mod rituals.temp = @s rituals.distance
execute if entity @s[tag=rituals.debug] run scoreboard players operation #timer_mod rituals.temp %= #100 rituals.data
execute if entity @s[tag=rituals.debug] if score #timer_mod rituals.temp matches 0 run tellraw @a[distance=..10] [{"text":"[DEBUG XP HARVESTER] Timer: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.distance"},"color":"yellow"},{"text":" / ","color":"gray"},{"score":{"name":"#current_freq","objective":"rituals.temp"},"color":"yellow"},{"text":" | Range: ","color":"gray"},{"score":{"name":"#current_h_range","objective":"rituals.temp"},"color":"dark_purple"},{"text":"x","color":"gray"},{"score":{"name":"#current_v_range","objective":"rituals.temp"},"color":"dark_purple"}]

execute unless score @s rituals.distance >= #current_freq rituals.temp run return 0
scoreboard players set @s rituals.distance 0

# Apply effects in tier-based range
function rituals:ritual/apply_in_tier_range

# Set XP amount based on tier (1-6 XP per second)
execute if score @s rituals.tier matches 1 run data modify storage rituals:temp xp_amount set value 1
execute if score @s rituals.tier matches 2 run data modify storage rituals:temp xp_amount set value 2
execute if score @s rituals.tier matches 3 run data modify storage rituals:temp xp_amount set value 3
execute if score @s rituals.tier matches 4 run data modify storage rituals:temp xp_amount set value 4
execute if score @s rituals.tier matches 5 run data modify storage rituals:temp xp_amount set value 5
execute if score @s rituals.tier matches 6 run data modify storage rituals:temp xp_amount set value 6

# Apply XP harvester effects based on tier with dynamic range
function rituals:ritual/effects/xp_harvester_apply with storage rituals:temp

# Ambient particles (purple/enchanting theme)
particle dust{color:[0.6,0.3,1.0],scale:1.0} ~ ~1 ~ 2 1 2 0.1 5
particle minecraft:enchant ~ ~1.5 ~ 1 0.5 1 0.3 3


