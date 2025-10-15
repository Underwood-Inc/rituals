# Toggle debug mode for this totem
# Toggle debug state
execute if entity @s[tag=!rituals.debug] run tag @s add rituals.debug
execute if entity @s[tag=rituals.debug] run tag @s remove rituals.debug

# Feedback
execute if entity @s[tag=rituals.debug] run tellraw @a[distance=..10] [{"text":"🔧 ","color":"aqua"},{"text":"Debug Mode ENABLED","color":"green","bold":true}]
execute if entity @s[tag=rituals.debug] run playsound block.note_block.bell master @a[distance=..10] ~ ~ ~ 0.5 2.0

execute if entity @s[tag=!rituals.debug] run tellraw @a[distance=..10] [{"text":"🔧 ","color":"gray"},{"text":"Debug Mode DISABLED","color":"red","bold":true}]
execute if entity @s[tag=!rituals.debug] run playsound block.note_block.bass master @a[distance=..10] ~ ~ ~ 0.5 0.5

# Visual effect
particle minecraft:enchant ~ ~2 ~ 0.3 0.5 0.3 1 15 force

