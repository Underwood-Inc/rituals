# Check if this totem has the correct item for NE corner of Enchanting Nexus
# NE corner requires: Lapis Lazuli Block
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify storage rituals:temp check_corner_item set from entity @s item.id

# Validate item is lapis lazuli block
execute if data storage rituals:temp {check_corner_item:"minecraft:lapis_block"} run scoreboard players set #found_ne rituals.temp 1
execute if data storage rituals:temp {check_corner_item:"minecraft:lapis_block"} run tag @s add rituals.pattern_totem


