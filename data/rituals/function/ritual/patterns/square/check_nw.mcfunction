# Check if this totem has Beetroot (NW corner requirement)
scoreboard players operation #check_totem_id rituals.temp = @s rituals.id
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #check_totem_id rituals.temp run data modify storage rituals:temp check_corner_item set from entity @s item.id

# Validate item is Beetroot
execute if data storage rituals:temp {check_corner_item:"minecraft:beetroot"} run scoreboard players set #found_nw rituals.temp 1
execute if data storage rituals:temp {check_corner_item:"minecraft:beetroot"} run tag @s add rituals.pattern_totem
