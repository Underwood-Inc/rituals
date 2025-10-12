# Raycast forward to find placement location
scoreboard players add @s rituals.distance 1

# If we hit a non-air block, place on top of it
execute unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:cave_air unless block ~ ~ ~ minecraft:void_air run return run function rituals:totem/place_on_surface

# Continue raycast (max 10 steps = 5 blocks)
execute if score @s rituals.distance matches ..10 positioned ^ ^ ^0.5 run function rituals:totem/raycast_placement

# If max distance reached, place at feet
execute if score @s rituals.distance matches 11.. at @s run function rituals:totem/place_at_target

