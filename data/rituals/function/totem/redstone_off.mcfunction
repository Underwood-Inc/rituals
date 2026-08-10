# ========================================
# Redstone power turned OFF
# ========================================
# Only called when state changes from ON to OFF

# Remove the persistent powered tag
tag @s remove rituals.redstone_powered

# Remove barrier shown tag
tag @s remove rituals.barrier_shown

# Kill range markers and any range-barrier block_displays
function rituals:totem/markers/kill
function rituals:totem/hide_range_barrier

# Sound and particle feedback
playsound block.beacon.deactivate block @a ~ ~ ~ 0.3 2.0
particle smoke ~ ~2 ~ 0.3 0.3 0.3 0.02 10


