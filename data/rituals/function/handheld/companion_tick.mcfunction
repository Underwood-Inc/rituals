# Player is holding a companion totem
# Check if they already have a companion spawned

# Store tier
execute store result score @s rituals.tier run data get entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".companion_tier

# Tag self as having companion totem
tag @s add rituals.has_companion_totem

# Check if companion exists
execute unless entity @e[type=silverfish,tag=rituals.companion,scores={rituals.id=0..},distance=..50] run function rituals:handheld/spawn_companion

# Update existing companion
execute as @e[type=silverfish,tag=rituals.companion,distance=..50] if score @s rituals.id = @p[tag=rituals.has_companion_totem] rituals.id at @s run function rituals:handheld/update_companion

