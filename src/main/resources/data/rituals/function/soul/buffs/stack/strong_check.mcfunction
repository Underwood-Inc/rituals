# Strong stack check - max level 4
execute store result score #current rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.strong

execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"strong"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buffs append from storage rituals:temp new_buff
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.strong run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.strong set value 1
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.strong run tellraw @a[distance=..16] [{"text":"  💪 ","color":"red"},{"text":"Soul Strength I","color":"dark_red"},{"text":" gained!","color":"green"}]
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.strong run return 1

execute if score #current rituals.soul_temp matches 1 run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.strong set value 2
execute if score #current rituals.soul_temp matches 1 run tellraw @a[distance=..16] [{"text":"  💪 ","color":"red"},{"text":"Soul Strength","color":"dark_red"},{"text":" → II!","color":"green"}]

execute if score #current rituals.soul_temp matches 2 run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.strong set value 3
execute if score #current rituals.soul_temp matches 2 run tellraw @a[distance=..16] [{"text":"  💪 ","color":"red"},{"text":"Soul Strength","color":"dark_red"},{"text":" → III!","color":"green"}]

execute if score #current rituals.soul_temp matches 3 run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.strong set value 4
execute if score #current rituals.soul_temp matches 3 run tellraw @a[distance=..16] [{"text":"  💪 ","color":"red"},{"text":"Soul Strength","color":"dark_red"},{"text":" → IV (MAX)!","color":"green","bold":true}]

execute if score #current rituals.soul_temp matches 4.. run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Soul Strength already at max!","color":"gray"}]

