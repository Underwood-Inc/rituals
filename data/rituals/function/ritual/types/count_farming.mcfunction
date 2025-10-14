# Check if this totem has a diamond hoe displayed
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id store result score #has_hoe rituals.temp run data get entity @s item.components."minecraft:custom_data".farming_ritual

# Also check by item ID directly
execute unless score #has_hoe rituals.temp matches 1.. as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id if data entity @s {item:{id:"minecraft:diamond_hoe"}} run scoreboard players add #farming_count rituals.temp 1

