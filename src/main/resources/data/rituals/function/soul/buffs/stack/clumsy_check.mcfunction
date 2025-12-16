# Clumsy stack check - max level 2
execute store result score #current rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels.clumsy

execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"clumsy"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_debuffs append from storage rituals:temp new_debuff
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels.clumsy run data modify storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels.clumsy set value 1
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels.clumsy run tellraw @a[distance=..16] [{"text":"  🦶 ","color":"yellow"},{"text":"Clumsy Grip I","color":"gold"},{"text":" afflicted!","color":"red"}]
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels.clumsy run return 1

execute if score #current rituals.soul_temp matches 1 run data modify storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels.clumsy set value 2
execute if score #current rituals.soul_temp matches 1 run tellraw @a[distance=..16] [{"text":"  🦶 ","color":"yellow"},{"text":"Clumsy Grip","color":"gold"},{"text":" → II (MAX)!","color":"red","bold":true}]

execute if score #current rituals.soul_temp matches 2.. run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Clumsy Grip already at max!","color":"gray"}]

