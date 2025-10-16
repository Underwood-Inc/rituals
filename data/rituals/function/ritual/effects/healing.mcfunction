# ========================================
# Healing Ritual Effect
# ========================================
# Heals nearby players and animals

# Get tier-based range settings
function rituals:ritual/get_tier_settings

# Get healing-specific frequency
function rituals:ritual/get_healing_settings

# Check timing using separate effect counter
scoreboard players add @s rituals.distance 1

# DEBUG: Show timer and frequency every 5 seconds (100 ticks) - only if debug enabled
execute if score #rituals_debug_mode rituals.data matches 1 run scoreboard players operation #rituals_timer_mod rituals.temp = @s rituals.distance
execute if score #rituals_debug_mode rituals.data matches 1 run scoreboard players operation #rituals_timer_mod rituals.temp %= #100 rituals.data
execute if score #rituals_debug_mode rituals.data matches 1 if score #rituals_timer_mod rituals.temp matches 0 run tellraw @a[distance=..10] [{"text":"[DEBUG HEALING] Timer: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.distance"},"color":"yellow"},{"text":" / ","color":"gray"},{"score":{"name":"#current_freq","objective":"rituals.temp"},"color":"yellow"},{"text":" | Range: ","color":"gray"},{"score":{"name":"#current_h_range","objective":"rituals.temp"},"color":"light_purple"},{"text":"x","color":"gray"},{"score":{"name":"#current_v_range","objective":"rituals.temp"},"color":"light_purple"}]

execute unless score @s rituals.distance >= #current_freq rituals.temp run return 0
scoreboard players set @s rituals.distance 0

# DEBUG: Healing attempt happening - only if debug enabled
execute if score #rituals_debug_mode rituals.data matches 1 run tellraw @a[distance=..10] [{"text":"[DEBUG HEALING] Healing attempt now!","color":"green","bold":true}]

# Apply effects in tier-based range
function rituals:ritual/apply_in_tier_range

# Apply healing effects based on tier with dynamic range
function rituals:ritual/effects/healing_apply with storage rituals:temp

# Ambient particles
particle dust{color:[1.0,0.5,0.8],scale:1.5} ~ ~1 ~ 2 1 2 0.1 8

