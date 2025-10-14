# Check if this totem has Blaze Rod (North hex requirement for smelting)
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify storage rituals:temp check_hex_item set from entity @s item.id

execute if data storage rituals:temp {check_hex_item:"minecraft:blaze_rod"} run scoreboard players set #found_n rituals.temp 1
execute if data storage rituals:temp {check_hex_item:"minecraft:blaze_rod"} run tag @s add rituals.pattern_totem


