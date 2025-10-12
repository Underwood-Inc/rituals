# ========================================
# Handle totem interaction
# ========================================
# Runs as and at the totem being interacted with

# Clear interaction data first
data remove entity @s interaction
data remove entity @s attack

# Find the nearest player and process
execute as @p[distance=..5] run function rituals:totem/check_held_item_simple
