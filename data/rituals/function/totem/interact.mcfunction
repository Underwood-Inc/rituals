# ========================================
# Handle totem interaction (placing/removing items)
# ========================================
# Runs as and at the totem being interacted with

# Get the player who interacted
execute store result score #player_id rituals.temp run data get entity @s interaction.player[0]

# Clear interaction data
data remove entity @s interaction

# Check if player is holding an item
execute as @a if score @s rituals.temp = #player_id rituals.temp at @s run function rituals:totem/handle_player_interaction

