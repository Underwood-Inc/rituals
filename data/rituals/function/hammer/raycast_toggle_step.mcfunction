# Recursive raycast step for ritual toggle
# Check if we hit a totem interaction entity
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.active_ritual,distance=..1.5,limit=1,sort=nearest] at @s run function rituals:hammer/toggle_ritual

# Continue ray if no hit and not at max distance
execute unless entity @e[type=interaction,tag=rituals.totem,distance=..1.5] positioned ^ ^ ^0.5 if entity @s[distance=..10] run function rituals:hammer/raycast_toggle_step

