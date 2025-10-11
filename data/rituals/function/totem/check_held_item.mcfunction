# ========================================
# Check what item player is holding
# ========================================

# Check if holding upgrade slate
execute store result score #is_upgrade rituals.temp run data get entity @s SelectedItem.components."minecraft:custom_data".rituals_upgrade

# Find the nearest totem and process accordingly
execute if score #is_upgrade rituals.temp matches 1 as @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest,distance=..5] at @s run function rituals:totem/upgrade
execute unless score #is_upgrade rituals.temp matches 1 as @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest,distance=..5] at @s run function rituals:totem/process_interaction

