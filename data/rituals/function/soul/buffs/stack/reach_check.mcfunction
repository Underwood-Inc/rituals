# Reach stack check - max level 3
execute store result score #current rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.reach

execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"reach"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buffs append from storage rituals:temp new_buff
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.reach run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.reach set value 1
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.reach run tellraw @a[distance=..16] [{"text":"  🖐️ ","color":"light_purple"},{"text":"Extended Reach I","color":"dark_purple"},{"text":" gained!","color":"green"}]
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.reach run return 1

execute if score #current rituals.soul_temp matches 1 run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.reach set value 2
execute if score #current rituals.soul_temp matches 1 run tellraw @a[distance=..16] [{"text":"  🖐️ ","color":"light_purple"},{"text":"Extended Reach","color":"dark_purple"},{"text":" → II!","color":"green"}]

execute if score #current rituals.soul_temp matches 2 run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.reach set value 3
execute if score #current rituals.soul_temp matches 2 run tellraw @a[distance=..16] [{"text":"  🖐️ ","color":"light_purple"},{"text":"Extended Reach","color":"dark_purple"},{"text":" → III (MAX)!","color":"green","bold":true}]

execute if score #current rituals.soul_temp matches 3.. run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Extended Reach already at max!","color":"gray"}]

