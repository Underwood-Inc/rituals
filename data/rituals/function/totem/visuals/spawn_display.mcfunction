# Helper function to spawn a totem block display with standard settings
# Parameters: $block (block state), $scale (size), $height (Y scale), $offset (translation)
# Call with: function rituals:totem/visuals/spawn_display with storage rituals:temp

# Summon block display with proper lighting and centering
$summon block_display ~ ~ ~ {Tags:["rituals.totem_visual","rituals.new_visual"],block_state:$(block),transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[$(offset)f,0f,$(offset)f],scale:[$(scale)f,$(height)f,$(scale)f]},brightness:{sky:15,block:15}}

# Link visual to totem
scoreboard players operation @e[type=block_display,tag=rituals.new_visual,limit=1,sort=nearest] rituals.id = @s rituals.id
tag @e[type=block_display,tag=rituals.new_visual,limit=1,sort=nearest] remove rituals.new_visual

