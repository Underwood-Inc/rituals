# ========================================
# Process a mining hit on the totem
# ========================================
# Runs as player, at totem

# Get the totem entity for checking progress
execute as @e[type=interaction,tag=rituals.totem,sort=nearest,limit=1,distance=..6] at @s run function rituals:totem/increment_mine_progress

