# Hungry stack check - max level 2
execute store result score #current rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels.hungry

execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"hungry"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_debuffs append from storage rituals:temp new_debuff
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels.hungry run data modify storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels.hungry set value 1
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels.hungry run tellraw @a[distance=..16] [{"text":"  🍖 ","color":"dark_red"},{"text":"Ravenous Soul I","color":"red"},{"text":" afflicted!","color":"red"}]
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels.hungry run return 1

execute if score #current rituals.soul_temp matches 1 run data modify storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels.hungry set value 2
execute if score #current rituals.soul_temp matches 1 run tellraw @a[distance=..16] [{"text":"  🍖 ","color":"dark_red"},{"text":"Ravenous Soul","color":"red"},{"text":" → II (MAX)!","color":"red","bold":true}]

execute if score #current rituals.soul_temp matches 2.. run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Ravenous Soul already at max!","color":"gray"}]

