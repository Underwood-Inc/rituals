# Raycast to find totem for toggling debug mode
# Raycast up to 10 blocks
execute anchored eyes positioned ^ ^ ^0.5 run function rituals:hammer/raycast_debug_step

# Reset scoreboard after
scoreboard players reset @s rituals.hammer_use

