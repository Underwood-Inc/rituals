# Toggle ritual on/off (pause/unpause)
# Toggle paused state
execute if entity @s[tag=!rituals.paused] run tag @s add rituals.paused
execute if entity @s[tag=rituals.paused] run tag @s remove rituals.paused

# Feedback
execute if entity @s[tag=rituals.paused] run tellraw @a[distance=..10] [{"text":"🔨 ","color":"gold"},{"text":"Ritual PAUSED","color":"red","bold":true}]
execute if entity @s[tag=rituals.paused] run playsound block.anvil.place master @a[distance=..10] ~ ~ ~ 0.5 1.5

execute if entity @s[tag=!rituals.paused] run tellraw @a[distance=..10] [{"text":"🔨 ","color":"gold"},{"text":"Ritual RESUMED","color":"green","bold":true}]
execute if entity @s[tag=!rituals.paused] run playsound block.anvil.use master @a[distance=..10] ~ ~ ~ 0.5 2.0

# Visual effect
particle minecraft:crit ~ ~2 ~ 0.3 0.5 0.3 0.1 10 force

