# Check if this totem has Potato (SW corner requirement)
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify storage rituals:temp check_corner_item set from entity @s item.id

# Validate item is Potato
execute if data storage rituals:temp {check_corner_item:"minecraft:potato"} run scoreboard players set #found_sw rituals.temp 1
execute if data storage rituals:temp {check_corner_item:"minecraft:potato"} run tag @s add rituals.pattern_totem
