# Check if this totem has Iron Ingot (NE hex requirement for vacuum - magnet)
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify storage rituals:temp check_hex_item set from entity @s item.id

execute if data storage rituals:temp {check_hex_item:"minecraft:iron_ingot"} run scoreboard players set #found_ne rituals.temp 1
execute if data storage rituals:temp {check_hex_item:"minecraft:iron_ingot"} run tag @s add rituals.pattern_totem


