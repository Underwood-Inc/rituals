# ========================================
# Check what item player is holding
# ========================================

# Find the nearest totem and process interaction
execute as @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest,distance=..5] at @s run function rituals:totem/process_interaction

