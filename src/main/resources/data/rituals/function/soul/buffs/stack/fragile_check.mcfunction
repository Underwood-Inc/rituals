# Fragile stack check - max level 2
execute store result score #current rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels.fragile

execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"fragile"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_debuffs append from storage rituals:temp new_debuff
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels.fragile run data modify storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels.fragile set value 1
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels.fragile run tellraw @a[distance=..16] [{"text":"  💔 ","color":"gray"},{"text":"Brittle Edge I","color":"white"},{"text":" afflicted!","color":"red"}]
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels.fragile run return 1

execute if score #current rituals.soul_temp matches 1 run data modify storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels.fragile set value 2
execute if score #current rituals.soul_temp matches 1 run tellraw @a[distance=..16] [{"text":"  💔 ","color":"gray"},{"text":"Brittle Edge","color":"white"},{"text":" → II (MAX)!","color":"red","bold":true}]

execute if score #current rituals.soul_temp matches 2.. run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Brittle Edge already at max!","color":"gray"}]

