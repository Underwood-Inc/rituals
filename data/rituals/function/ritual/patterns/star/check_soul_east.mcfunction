# Check if this totem has Ender Pearl (East cardinal requirement for Soul Embodiment)
scoreboard players operation #check_totem_id rituals.temp = @s rituals.id
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #check_totem_id rituals.temp run data modify storage rituals:temp check_cardinal_item set from entity @s item.id

execute if data storage rituals:temp {check_cardinal_item:"minecraft:ender_pearl"} run scoreboard players set #found_e rituals.temp 1
execute if data storage rituals:temp {check_cardinal_item:"minecraft:ender_pearl"} run tag @s add rituals.pattern_totem
