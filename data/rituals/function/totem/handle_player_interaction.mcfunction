# ========================================
# Handle the player's interaction with a totem
# ========================================
# Runs as the player who interacted

# Find the nearest totem
execute as @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest,distance=..5] at @s run function rituals:totem/process_interaction

