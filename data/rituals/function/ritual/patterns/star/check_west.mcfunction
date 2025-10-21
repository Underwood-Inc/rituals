# Check if this totem has Beetroot Seeds (West cardinal requirement)
scoreboard players operation #check_totem_id rituals.temp = @s rituals.id
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #check_totem_id rituals.temp run data modify storage rituals:temp check_cardinal_item set from entity @s item.id

# Validate item is Beetroot Seeds
execute if data storage rituals:temp {check_cardinal_item:"minecraft:beetroot_seeds"} run scoreboard players set #found_w rituals.temp 1
execute if data storage rituals:temp {check_cardinal_item:"minecraft:beetroot_seeds"} run tag @s add rituals.pattern_totem


