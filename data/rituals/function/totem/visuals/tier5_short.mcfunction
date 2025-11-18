# Spawn Diamond Totem visual (short variant)
# 3-part totem: wider base, slim middle, wider top

# Base (wider, at bottom)
data modify storage rituals:temp block set value {Name:"minecraft:diamond_block"}
data modify storage rituals:temp scale set value 0.8
data modify storage rituals:temp height set value 0.2
data modify storage rituals:temp offset set value -0.4
function rituals:totem/visuals/spawn_display with storage rituals:temp

# Middle pole (slim)
summon block_display ~ ~ ~ {Tags:["rituals.totem_visual","rituals.new_visual"],block_state:{Name:"minecraft:diamond_block"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.25f,0.2f,-0.25f],scale:[0.5f,0.6f,0.5f]}}
scoreboard players operation @e[type=block_display,tag=rituals.new_visual,limit=1,sort=nearest] rituals.id = @s rituals.id
tag @e[type=block_display,tag=rituals.new_visual,limit=1,sort=nearest] remove rituals.new_visual

# Top cap (wider, at top)
summon block_display ~ ~ ~ {Tags:["rituals.totem_visual","rituals.new_visual"],block_state:{Name:"minecraft:diamond_block"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.4f,0.8f,-0.4f],scale:[0.8f,0.2f,0.8f]}}
scoreboard players operation @e[type=block_display,tag=rituals.new_visual,limit=1,sort=nearest] rituals.id = @s rituals.id
tag @e[type=block_display,tag=rituals.new_visual,limit=1,sort=nearest] remove rituals.new_visual

