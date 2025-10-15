# Check if this totem has Carrot (SE corner requirement)
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify storage rituals:temp check_corner_item set from entity @s item.id

# Validate item is Carrot
execute if data storage rituals:temp {check_corner_item:"minecraft:carrot"} run scoreboard players set #found_se rituals.temp 1
execute if data storage rituals:temp {check_corner_item:"minecraft:carrot"} run tag @s add rituals.pattern_totem
