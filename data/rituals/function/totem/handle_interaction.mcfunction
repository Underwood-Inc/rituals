# ========================================
# Handle totem interaction
# ========================================
# Runs as and at the totem being interacted with

# Clear interaction data first
data remove entity @s interaction
data remove entity @s attack

# Store interacting player item — process on THIS totem (@s), not nearest to player
data modify storage rituals:temp interacting_uuid set from entity @p[distance=..5,limit=1] UUID
data remove storage rituals:temp player_selected_item
execute as @p[distance=..5,limit=1] run data modify storage rituals:temp player_selected_item set from entity @s SelectedItem

function rituals:totem/process_interaction
