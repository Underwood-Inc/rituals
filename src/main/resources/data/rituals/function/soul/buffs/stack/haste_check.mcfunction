# Haste stack check - max level 3
execute store result score #current rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.haste

# If doesn't exist, add it at level 1
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"haste"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buffs append from storage rituals:temp new_buff
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.haste run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.haste set value 1
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.haste run tellraw @a[distance=..16] [{"text":"  ⛏️ ","color":"yellow"},{"text":"Soul Haste I","color":"gold"},{"text":" gained!","color":"green"}]
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.haste run return 1

# If exists but below max, upgrade
execute if score #current rituals.soul_temp matches 1 run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.haste set value 2
execute if score #current rituals.soul_temp matches 1 run tellraw @a[distance=..16] [{"text":"  ⛏️ ","color":"yellow"},{"text":"Soul Haste","color":"gold"},{"text":" → II!","color":"green"}]

execute if score #current rituals.soul_temp matches 2 run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.haste set value 3
execute if score #current rituals.soul_temp matches 2 run tellraw @a[distance=..16] [{"text":"  ⛏️ ","color":"yellow"},{"text":"Soul Haste","color":"gold"},{"text":" → III (MAX)!","color":"green","bold":true}]

# If at max (3), notify wasted roll
execute if score #current rituals.soul_temp matches 3.. run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Soul Haste already at max!","color":"gray"}]

