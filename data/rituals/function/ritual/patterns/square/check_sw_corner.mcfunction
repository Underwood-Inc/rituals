# Check if this totem has the correct item for SW corner of Enchanting Nexus
# SW corner requires: Amethyst Shard
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify storage rituals:temp check_corner_item set from entity @s item.id

# Validate item is amethyst shard
execute if data storage rituals:temp {check_corner_item:"minecraft:amethyst_shard"} run scoreboard players set #found_sw rituals.temp 1
execute if data storage rituals:temp {check_corner_item:"minecraft:amethyst_shard"} run tag @s add rituals.pattern_totem


