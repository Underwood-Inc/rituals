# Update sentry projectiles - move toward target and check collision
# Runs as each projectile marker every tick

# Get config values
execute store result score #target_range rituals.temp run data get storage rituals:config sentry_target_range
execute store result score #max_dist rituals.temp run data get storage rituals:config sentry_max_distance

# Move toward nearest hostile mob (homing behavior) using stored speed
execute store result score #has_target rituals.temp if entity @e[type=#rituals:hostile_mobs,distance=..30,limit=1]

# Calculate movement distance (speed / 10 since we stored it as x10)
scoreboard players operation #move_speed rituals.temp = @s rituals.distance

# Move toward target using tier-based speed
execute if score #has_target rituals.temp matches 1.. if score @s rituals.tier matches 1 facing entity @e[type=#rituals:hostile_mobs,distance=..30,limit=1,sort=nearest] eyes run tp @s ^ ^ ^0.4
execute if score #has_target rituals.temp matches 1.. if score @s rituals.tier matches 2 facing entity @e[type=#rituals:hostile_mobs,distance=..30,limit=1,sort=nearest] eyes run tp @s ^ ^ ^0.5
execute if score #has_target rituals.temp matches 1.. if score @s rituals.tier matches 3 facing entity @e[type=#rituals:hostile_mobs,distance=..30,limit=1,sort=nearest] eyes run tp @s ^ ^ ^0.6
execute if score #has_target rituals.temp matches 1.. if score @s rituals.tier matches 4 facing entity @e[type=#rituals:hostile_mobs,distance=..30,limit=1,sort=nearest] eyes run tp @s ^ ^ ^0.7
execute if score #has_target rituals.temp matches 1.. if score @s rituals.tier matches 5 facing entity @e[type=#rituals:hostile_mobs,distance=..30,limit=1,sort=nearest] eyes run tp @s ^ ^ ^0.9
execute if score #has_target rituals.temp matches 1.. if score @s rituals.tier matches 6 facing entity @e[type=#rituals:hostile_mobs,distance=..30,limit=1,sort=nearest] eyes run tp @s ^ ^ ^1.2

# Visual trail
execute if score @s rituals.tier matches 1..2 run particle flame ~ ~ ~ 0.05 0.05 0.05 0 1 force
execute if score @s rituals.tier matches 3..4 run particle flame ~ ~ ~ 0.05 0.05 0.05 0 2 force
execute if score @s rituals.tier matches 5..6 run particle soul_fire_flame ~ ~ ~ 0.05 0.05 0.05 0 2 force
particle electric_spark ~ ~ ~ 0.1 0.1 0.1 0 1 force

# Check for collision with hostile mobs (only one at a time)
execute positioned ~-0.5 ~-0.5 ~-0.5 if entity @e[type=#rituals:hostile_mobs,dx=1,dy=1,dz=1] as @e[type=#rituals:hostile_mobs,dx=1,dy=1,dz=1,limit=1,sort=nearest] run tag @s add rituals.projectile_hit

# Store if we hit something BEFORE calling sentry_hit (which removes the tag)
execute store result score #hit_mob rituals.temp if entity @e[tag=rituals.projectile_hit,limit=1]

# If hit a mob, apply damage
execute if score #hit_mob rituals.temp matches 1.. run function rituals:ritual/effects/sentry_hit

# Kill projectile if it hit something
execute if score #hit_mob rituals.temp matches 1.. run kill @s
execute unless block ~ ~ ~ #rituals:air run particle explosion ~ ~ ~ 0.1 0.1 0.1 0 1 force
execute unless block ~ ~ ~ #rituals:air run playsound entity.generic.explode block @a ~ ~ ~ 0.3 1.5
execute unless block ~ ~ ~ #rituals:air run kill @s

# Kill if no target nearby or too far from any totem (using config values)
execute unless score #has_target rituals.temp matches 1.. run kill @s
execute unless entity @e[type=interaction,tag=rituals.totem,distance=..50] run kill @s

