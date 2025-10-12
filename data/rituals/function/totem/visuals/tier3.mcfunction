# Spawn Iron Totem visual (tall variant)
# 3-part totem: wider base, slim middle, wider top

# Base (wider, at bottom)
data modify storage rituals:temp block set value {Name:"minecraft:iron_block"}
data modify storage rituals:temp scale set value 0.8
data modify storage rituals:temp height set value 0.3
data modify storage rituals:temp offset set value -0.4
function rituals:totem/visuals/spawn_display with storage rituals:temp

# Middle pole (slim)
summon block_display ~ ~ ~ {Tags:["rituals.totem_visual","rituals.new_visual"],block_state:{Name:"minecraft:iron_block"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.25f,0.3f,-0.25f],scale:[0.5f,1.4f,0.5f]},brightness:{sky:15,block:15}}
scoreboard players operation @e[type=block_display,tag=rituals.new_visual,limit=1,sort=nearest] rituals.id = @s rituals.id
tag @e[type=block_display,tag=rituals.new_visual,limit=1,sort=nearest] remove rituals.new_visual

# Top cap (wider, at top)
summon block_display ~ ~ ~ {Tags:["rituals.totem_visual","rituals.new_visual"],block_state:{Name:"minecraft:iron_block"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.4f,1.7f,-0.4f],scale:[0.8f,0.3f,0.8f]},brightness:{sky:15,block:15}}
scoreboard players operation @e[type=block_display,tag=rituals.new_visual,limit=1,sort=nearest] rituals.id = @s rituals.id
tag @e[type=block_display,tag=rituals.new_visual,limit=1,sort=nearest] remove rituals.new_visual
