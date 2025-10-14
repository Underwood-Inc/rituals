# ========================================
# Redstone power turned ON
# ========================================
# Only called when state changes from OFF to ON

# Set the persistent powered tag
tag @s add rituals.redstone_powered

# Mark barrier as shown
tag @s add rituals.barrier_shown

# Spawn range markers (corners + mid-points) - normal tier-based range
function rituals:totem/markers/spawn

# Check if this totem has an item that's part of a multi-totem pattern ritual
# If so, show pattern visualization instead of (or in addition to) range markers
execute if entity @s[tag=rituals.has_item] run function rituals:totem/patterns/visualize_pattern

# Sound and particle feedback
playsound block.beacon.activate block @a ~ ~ ~ 0.3 2.0
particle end_rod ~ ~2 ~ 0.3 0.3 0.3 0.05 20


