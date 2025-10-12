# ========================================
# Redstone power turned ON
# ========================================
# Only called when state changes from OFF to ON

# Set the persistent powered tag
tag @s add rituals.redstone_powered

# Mark barrier as shown
tag @s add rituals.barrier_shown

# Spawn range markers (corners + mid-points)
function rituals:totem/markers/spawn

# Sound and particle feedback
playsound block.beacon.activate block @a ~ ~ ~ 0.3 2.0
particle end_rod ~ ~2 ~ 0.3 0.3 0.3 0.05 20


