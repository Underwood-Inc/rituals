# ========================================
# Check what item player is holding (runs as player)
# ========================================


# Process item placement at nearest totem
execute at @s as @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest,distance=..5] at @s run function rituals:totem/process_interaction

