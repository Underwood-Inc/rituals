# XP Boost stack check - max level 2
execute store result score #current rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.xpboost

execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"xpboost"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buffs append from storage rituals:temp new_buff
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.xpboost run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.xpboost set value 1
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.xpboost run tellraw @a[distance=..16] [{"text":"  📚 ","color":"green"},{"text":"Soul Wisdom I","color":"dark_green"},{"text":" gained!","color":"green"}]
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.xpboost run return 1

execute if score #current rituals.soul_temp matches 1 run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.xpboost set value 2
execute if score #current rituals.soul_temp matches 1 run tellraw @a[distance=..16] [{"text":"  📚 ","color":"green"},{"text":"Soul Wisdom","color":"dark_green"},{"text":" → II (MAX)!","color":"green","bold":true}]

execute if score #current rituals.soul_temp matches 2.. run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Soul Wisdom already at max!","color":"gray"}]

