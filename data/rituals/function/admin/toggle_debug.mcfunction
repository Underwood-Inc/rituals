# ========================================
# Toggle Debug Mode
# ========================================
# Toggles debug mode on/off for the entire datapack

# First, ensure config is loaded
function rituals:config/load

# Load current state into scoreboard
execute store result score #debug_mode rituals.data if data storage rituals:config {debug_mode:true}

# Toggle the scoreboard value (0 becomes 1, 1 becomes 0)
execute if score #debug_mode rituals.data matches 0 run scoreboard players set #debug_mode rituals.data 1
execute if score #debug_mode rituals.data matches 1 run scoreboard players set #debug_mode rituals.data 0

# Now sync the scoreboard back to storage
execute if score #debug_mode rituals.data matches 1 run data modify storage rituals:config debug_mode set value true
execute if score #debug_mode rituals.data matches 0 run data modify storage rituals:config debug_mode set value false

# Feedback
execute if score #debug_mode rituals.data matches 1 run tellraw @a [{"text":"🔧 ","color":"aqua"},{"text":"Debug Mode ENABLED","color":"green","bold":true}]
execute if score #debug_mode rituals.data matches 1 run playsound block.note_block.bell master @a ~ ~ ~ 0.5 2.0

execute if score #debug_mode rituals.data matches 0 run tellraw @a [{"text":"🔧 ","color":"gray"},{"text":"Debug Mode DISABLED","color":"red","bold":true}]
execute if score #debug_mode rituals.data matches 0 run playsound block.note_block.bass master @a ~ ~ ~ 0.5 0.5

# Visual effect
particle minecraft:enchant ~ ~2 ~ 0.3 0.5 0.3 1 15 force
