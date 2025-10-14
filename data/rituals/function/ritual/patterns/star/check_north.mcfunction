# Check if this totem has Seeds (North cardinal requirement)
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify storage rituals:temp check_cardinal_item set from entity @s item.id

# Validate item is Seeds (wheat seeds)
execute if data storage rituals:temp {check_cardinal_item:"minecraft:wheat_seeds"} run scoreboard players set #found_n rituals.temp 1
execute if data storage rituals:temp {check_cardinal_item:"minecraft:wheat_seeds"} run tag @s add rituals.pattern_totem


