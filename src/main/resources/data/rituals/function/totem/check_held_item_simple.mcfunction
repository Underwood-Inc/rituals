# ========================================
# Check what item player is holding (runs as player)
# ========================================

# Store this player's UUID for multiplayer-safe targeting
data modify storage rituals:temp interacting_uuid set from entity @s UUID

# Store their held item so downstream functions read from storage, not @p
data modify storage rituals:temp player_selected_item set from entity @s SelectedItem

# Process item placement at nearest totem
execute at @s as @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest,distance=..5] at @s run function rituals:totem/process_interaction
