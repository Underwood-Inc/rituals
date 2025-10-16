# ========================================
# Check what item player is holding (runs as player)
# ========================================

# Check if holding ritual hammer - if so, skip totem interaction entirely (DISABLED)
# execute store result score #is_hammer rituals.temp run data get entity @s SelectedItem.components."minecraft:custom_data".rituals_hammer
# execute if score #is_hammer rituals.temp matches 1.. run return fail

# Check if holding upgrade slate
execute store result score #is_upgrade rituals.temp run data get entity @s SelectedItem.components."minecraft:custom_data".rituals_upgrade

# Process upgrade or item placement at nearest totem
execute if score #is_upgrade rituals.temp matches 1.. at @s as @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest,distance=..5] at @s run function rituals:totem/upgrade
execute unless score #is_upgrade rituals.temp matches 1.. at @s as @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest,distance=..5] at @s run function rituals:totem/process_interaction

