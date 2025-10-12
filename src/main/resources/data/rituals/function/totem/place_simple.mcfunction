# Place totem where player is looking
scoreboard players set @s rituals.use_count 0

# Store data
execute store result score @s rituals.tier run data get entity @s SelectedItem.components."minecraft:custom_data".totem_tier
execute store result score @s rituals.temp run data get entity @s SelectedItem.components."minecraft:custom_data".totem_short

# Start raycast from eyes
scoreboard players set @s rituals.distance 0
execute anchored eyes positioned ^ ^ ^0.5 run function rituals:totem/raycast_placement
