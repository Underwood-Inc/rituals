# Apply damage when projectile hits a mob
# Runs as the projectile

# Get stored damage value
execute store result score #damage rituals.temp run scoreboard players get @s rituals.data

# Apply damage to ONLY the hit mob (limit=1 for safety)
execute as @e[tag=rituals.projectile_hit,limit=1,sort=nearest] run function rituals:ritual/effects/sentry_apply_damage

# Visual and sound effects at hit location
execute at @e[tag=rituals.projectile_hit,limit=1] run particle explosion ~ ~1 ~ 0.3 0.3 0.3 0 3 force
execute at @e[tag=rituals.projectile_hit,limit=1] run particle dust{color:[1.0,0.3,0.0],scale:1.5} ~ ~1 ~ 0.3 0.5 0.3 0.1 15 force
execute at @e[tag=rituals.projectile_hit,limit=1] run playsound entity.generic.explode hostile @a ~ ~ ~ 0.5 1.5
execute at @e[tag=rituals.projectile_hit,limit=1] run playsound entity.blaze.hurt hostile @a ~ ~ ~ 0.3 0.8

# Clean up tag
tag @e[tag=rituals.projectile_hit] remove rituals.projectile_hit

