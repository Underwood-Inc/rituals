# ========================================
# Sentry Totem Effect
# ========================================
# Fires magical projectiles at nearby hostile mobs
# Range: Double the normal range (10x10 horizontal, 6 up, 6 down)

# Get tier-based range settings
function rituals:ritual/get_tier_settings

# Get sentry-specific settings (fire rate, damage, projectile speed)
function rituals:ritual/get_sentry_settings

# Check timing using separate effect counter (don't touch main timer!)
scoreboard players add @s rituals.distance 1

# DEBUG: Show timer and frequency every 5 seconds (100 ticks) - only if debug enabled
execute if score #rituals_debug_mode rituals.data matches 1 run scoreboard players operation #rituals_timer_mod rituals.temp = @s rituals.distance
execute if score #rituals_debug_mode rituals.data matches 1 run scoreboard players operation #rituals_timer_mod rituals.temp %= #100 rituals.data
execute if score #rituals_debug_mode rituals.data matches 1 if score #rituals_timer_mod rituals.temp matches 0 run tellraw @a[distance=..10] [{"text":"[DEBUG SENTRY] Timer: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.distance"},"color":"yellow"},{"text":" / ","color":"gray"},{"score":{"name":"#current_freq","objective":"rituals.temp"},"color":"yellow"},{"text":" | Range: ","color":"gray"},{"score":{"name":"#current_h_range","objective":"rituals.temp"},"color":"dark_red"},{"text":"x","color":"gray"},{"score":{"name":"#current_v_range","objective":"rituals.temp"},"color":"dark_red"}]

execute unless score @s rituals.distance >= #current_freq rituals.temp run return 0
scoreboard players set @s rituals.distance 0

# DEBUG: Sentry attempt happening - only if debug enabled
execute if score #rituals_debug_mode rituals.data matches 1 run tellraw @a[distance=..10] [{"text":"[DEBUG SENTRY] Sentry attempt now!","color":"green","bold":true}]

# ONLY the totem with the lowest ID in this ritual should fire (prevents multiple totems from all firing)
# Get this totem's stored item for comparison
execute store result score #min_id rituals.temp run scoreboard players get @s rituals.id
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.active_ritual,distance=..32] if score @s rituals.effect = @e[type=interaction,tag=rituals.totem,tag=rituals.active_ritual,limit=1,sort=nearest] rituals.effect if score @s rituals.id < #min_id rituals.temp run scoreboard players operation #min_id rituals.temp = @s rituals.id
execute unless score @s rituals.id = #min_id rituals.temp run return 0

# Calculate sentry range (multiplier from config, default 2x normal range)
scoreboard players operation #sentry_h_range rituals.temp = #current_h_range rituals.temp
scoreboard players operation #sentry_h_range rituals.temp *= #sentry_range_mult rituals.data

scoreboard players operation #sentry_v_range rituals.temp = #current_v_range rituals.temp
scoreboard players operation #sentry_v_range rituals.temp *= #sentry_range_mult rituals.data

# Calculate negative offsets for box selection (move back by range)
scoreboard players operation #neg_h rituals.temp = #sentry_h_range rituals.temp
scoreboard players operation #neg_h rituals.temp *= #-1 rituals.data

scoreboard players operation #neg_v rituals.temp = #sentry_v_range rituals.temp
scoreboard players operation #neg_v rituals.temp *= #-1 rituals.data

# Calculate box size for dx/dy/dz (2x range)
scoreboard players operation #box_h rituals.temp = #sentry_h_range rituals.temp
scoreboard players operation #box_h rituals.temp *= #2 rituals.data

scoreboard players operation #box_v rituals.temp = #sentry_v_range rituals.temp
scoreboard players operation #box_v rituals.temp *= #2 rituals.data

# Store values for macro
execute store result storage rituals:temp neg_h int 1 run scoreboard players get #neg_h rituals.temp
execute store result storage rituals:temp neg_v int 1 run scoreboard players get #neg_v rituals.temp
execute store result storage rituals:temp box_h int 1 run scoreboard players get #box_h rituals.temp
execute store result storage rituals:temp box_v int 1 run scoreboard players get #box_v rituals.temp

# Find and fire at target using calculated range
function rituals:ritual/effects/sentry_find_target with storage rituals:temp

# Ambient particles
particle dust{color:[1.0,0.3,0.3],scale:1.0} ~ ~1.5 ~ 0.3 0.5 0.3 0 2

