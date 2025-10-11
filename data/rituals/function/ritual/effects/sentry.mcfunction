# ========================================
# Sentry Totem Effect
# ========================================
# Fires magical projectiles at nearby hostile mobs
# Range: Double the normal range (10x10 horizontal, 6 up, 6 down)

# Get fire rate from config (default 40 ticks = 2 seconds)
execute store result score #sentry_fire_rate rituals.temp run data get storage rituals:config sentry_fire_rate

# Only fire every N ticks based on config
execute store result score #fire_check rituals.temp run scoreboard players operation @s rituals.timer %= #sentry_fire_rate rituals.temp
execute unless score #fire_check rituals.temp matches 0 run return 0

# Find nearest hostile mob in DOUBLE range (10 blocks horizontal, 6 up/down)
execute positioned ~-10 ~-6 ~-10 as @e[type=#rituals:hostile_mobs,dx=20,dy=12,dz=20,limit=1,sort=nearest] run tag @s add rituals.sentry_target

# If we found a target, fire at it
execute if entity @e[tag=rituals.sentry_target] run function rituals:ritual/effects/sentry_fire

# Clean up target tag
tag @e[tag=rituals.sentry_target] remove rituals.sentry_target

# Ambient particles
particle dust{color:[1.0,0.3,0.3],scale:1.0} ~ ~1.5 ~ 0.3 0.5 0.3 0 2

