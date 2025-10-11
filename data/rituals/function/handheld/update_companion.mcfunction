# Update companion behavior
# This runs as and at the companion silverfish

# Find owner
execute store result score #owner_x rituals.temp run data get entity @p[tag=rituals.has_companion_totem,scores={rituals.id=0..}] Pos[0] 100
execute store result score #owner_y rituals.temp run data get entity @p[tag=rituals.has_companion_totem,scores={rituals.id=0..}] Pos[1] 100
execute store result score #owner_z rituals.temp run data get entity @p[tag=rituals.has_companion_totem,scores={rituals.id=0..}] Pos[2] 100
execute store result score #self_x rituals.temp run data get entity @s Pos[0] 100
execute store result score #self_y rituals.temp run data get entity @s Pos[1] 100
execute store result score #self_z rituals.temp run data get entity @s Pos[2] 100

# Calculate distance
scoreboard players operation #dist_x rituals.temp = #owner_x rituals.temp
scoreboard players operation #dist_x rituals.temp -= #self_x rituals.temp
scoreboard players operation #dist_y rituals.temp = #owner_y rituals.temp
scoreboard players operation #dist_y rituals.temp -= #self_y rituals.temp
scoreboard players operation #dist_z rituals.temp = #owner_z rituals.temp
scoreboard players operation #dist_z rituals.temp -= #self_z rituals.temp

# Make absolute values
execute if score #dist_x rituals.temp matches ..-1 run scoreboard players operation #dist_x rituals.temp *= #-1 rituals.data
execute if score #dist_y rituals.temp matches ..-1 run scoreboard players operation #dist_y rituals.temp *= #-1 rituals.data
execute if score #dist_z rituals.temp matches ..-1 run scoreboard players operation #dist_z rituals.temp *= #-1 rituals.data

# If too far from owner (>20 blocks), teleport to owner
execute if score #dist_x rituals.temp matches 2000.. run tp @s @p[tag=rituals.has_companion_totem,scores={rituals.id=0..}]
execute if score #dist_z rituals.temp matches 2000.. run tp @s @p[tag=rituals.has_companion_totem,scores={rituals.id=0..}]

# Visual particles based on tier
execute if score @s rituals.tier matches 1..2 run particle dust{color:[0.7,0.7,0.7],scale:0.5} ~ ~0.3 ~ 0.2 0.2 0.2 0 1
execute if score @s rituals.tier matches 3 run particle dust{color:[0.9,0.9,0.9],scale:0.6} ~ ~0.3 ~ 0.2 0.2 0.2 0 1
execute if score @s rituals.tier matches 4 run particle dust{color:[1.0,0.84,0.0],scale:0.7} ~ ~0.3 ~ 0.2 0.2 0.2 0 1
execute if score @s rituals.tier matches 5 run particle dust{color:[0.0,1.0,1.0],scale:0.8} ~ ~0.3 ~ 0.2 0.2 0.2 0 1
execute if score @s rituals.tier matches 6 run particle dust{color:[0.5,0.0,0.5],scale:1.0} ~ ~0.3 ~ 0.2 0.2 0.2 0 2

# Heal companion slowly
effect give @s regeneration 2 0 true

