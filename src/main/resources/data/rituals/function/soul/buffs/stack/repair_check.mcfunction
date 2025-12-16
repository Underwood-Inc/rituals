# Repair stack check - max level 3
execute store result score #current rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.repair

execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"repair"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buffs append from storage rituals:temp new_buff
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.repair run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.repair set value 1
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.repair run tellraw @a[distance=..16] [{"text":"  🔧 ","color":"green"},{"text":"Soul Mending I","color":"dark_green"},{"text":" gained!","color":"green"}]
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.repair run return 1

execute if score #current rituals.soul_temp matches 1 run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.repair set value 2
execute if score #current rituals.soul_temp matches 1 run tellraw @a[distance=..16] [{"text":"  🔧 ","color":"green"},{"text":"Soul Mending","color":"dark_green"},{"text":" → II!","color":"green"}]

execute if score #current rituals.soul_temp matches 2 run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.repair set value 3
execute if score #current rituals.soul_temp matches 2 run tellraw @a[distance=..16] [{"text":"  🔧 ","color":"green"},{"text":"Soul Mending","color":"dark_green"},{"text":" → III (MAX)!","color":"green","bold":true}]

execute if score #current rituals.soul_temp matches 3.. run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Soul Mending already at max!","color":"gray"}]

