# Check if this totem has the correct item for NW corner of Enchanting Nexus
# NW corner requires: Experience Bottle
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify storage rituals:temp check_corner_item set from entity @s item.id

# Validate item is experience bottle
execute if data storage rituals:temp {check_corner_item:"minecraft:experience_bottle"} run scoreboard players set #found_nw rituals.temp 1
execute if data storage rituals:temp {check_corner_item:"minecraft:experience_bottle"} run tag @s add rituals.pattern_totem


