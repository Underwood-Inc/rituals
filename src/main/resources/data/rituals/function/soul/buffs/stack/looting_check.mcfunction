# Looting stack check - max level 2
execute store result score #current rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.looting

execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"looting"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buffs append from storage rituals:temp new_buff
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.looting run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.looting set value 1
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.looting run tellraw @a[distance=..16] [{"text":"  💰 ","color":"gold"},{"text":"Soul Harvest I","color":"yellow"},{"text":" gained!","color":"green"}]
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.looting run return 1

execute if score #current rituals.soul_temp matches 1 run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.looting set value 2
execute if score #current rituals.soul_temp matches 1 run tellraw @a[distance=..16] [{"text":"  💰 ","color":"gold"},{"text":"Soul Harvest","color":"yellow"},{"text":" → II (MAX)!","color":"green","bold":true}]

execute if score #current rituals.soul_temp matches 2.. run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Soul Harvest already at max!","color":"gray"}]

