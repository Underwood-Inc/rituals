# Check if this totem has Quartz (Position 4 requirement)
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify storage rituals:temp check_pentagon_item set from entity @s item.id

# Validate item is Quartz
execute if data storage rituals:temp {check_pentagon_item:"minecraft:quartz"} run scoreboard players set #found_4 rituals.temp 1
execute if data storage rituals:temp {check_pentagon_item:"minecraft:quartz"} run tag @s add rituals.pattern_totem

