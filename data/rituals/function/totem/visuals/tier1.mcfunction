# ========================================
# Spawn visual for Tier 1 (Wood) totem
# ========================================

# Main totem pole (cobblestone wall - looks like stone with runes)
summon block_display ~ ~ ~ {Tags:["rituals.totem_visual","rituals.new_visual"],block_state:{Name:"minecraft:cobblestone_wall",Properties:{up:"true",north:"none",south:"none",east:"none",west:"none"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.2f,0f,-0.2f],scale:[0.4f,2.0f,0.4f]},brightness:{sky:15,block:15}}

# Link visual to totem
scoreboard players operation @e[type=block_display,tag=rituals.new_visual,limit=1,sort=nearest] rituals.id = @s rituals.id
tag @e[type=block_display,tag=rituals.new_visual,limit=1,sort=nearest] remove rituals.new_visual

