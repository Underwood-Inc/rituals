# Check if this totem has Book (Position 2 requirement)
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify storage rituals:temp check_pentagon_item set from entity @s item.id

# Validate item is Book
execute if data storage rituals:temp {check_pentagon_item:"minecraft:book"} run scoreboard players set #found_2 rituals.temp 1
execute if data storage rituals:temp {check_pentagon_item:"minecraft:book"} run tag @s add rituals.pattern_totem

