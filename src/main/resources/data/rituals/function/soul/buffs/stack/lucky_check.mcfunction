# Lucky stack check - max level 2
execute store result score #current rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.lucky

execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"lucky"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buffs append from storage rituals:temp new_buff
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.lucky run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.lucky set value 1
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.lucky run tellraw @a[distance=..16] [{"text":"  🍀 ","color":"green"},{"text":"Fortune's Favor I","color":"gold"},{"text":" gained!","color":"green"}]
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.lucky run return 1

execute if score #current rituals.soul_temp matches 1 run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.lucky set value 2
execute if score #current rituals.soul_temp matches 1 run tellraw @a[distance=..16] [{"text":"  🍀 ","color":"green"},{"text":"Fortune's Favor","color":"gold"},{"text":" → II (MAX)!","color":"green","bold":true}]

execute if score #current rituals.soul_temp matches 2.. run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Fortune's Favor already at max!","color":"gray"}]

