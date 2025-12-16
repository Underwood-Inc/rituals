# Soulfire stack check - max level 2
execute store result score #current rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.soulfire

execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"soulfire"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buffs append from storage rituals:temp new_buff
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.soulfire run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.soulfire set value 1
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.soulfire run tellraw @a[distance=..16] [{"text":"  🔥 ","color":"gold"},{"text":"Soul Flame I","color":"red"},{"text":" gained!","color":"green"}]
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.soulfire run return 1

execute if score #current rituals.soul_temp matches 1 run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.soulfire set value 2
execute if score #current rituals.soul_temp matches 1 run tellraw @a[distance=..16] [{"text":"  🔥 ","color":"gold"},{"text":"Soul Flame","color":"red"},{"text":" → II (MAX)!","color":"green","bold":true}]

execute if score #current rituals.soul_temp matches 2.. run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Soul Flame already at max!","color":"gray"}]

