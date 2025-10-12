# ========================================
# Spawn range markers (corners + mid-points)
# ========================================
# Called when totem is powered ON
# Uses tier to determine range and color

# Store totem ID for linking markers
scoreboard players operation #marker_id rituals.temp = @s rituals.id

# Call tier-specific marker placement
execute if score @s rituals.tier matches 1 run function rituals:totem/markers/tier1
execute if score @s rituals.tier matches 2 run function rituals:totem/markers/tier2
execute if score @s rituals.tier matches 3 run function rituals:totem/markers/tier3
execute if score @s rituals.tier matches 4 run function rituals:totem/markers/tier4
execute if score @s rituals.tier matches 5 run function rituals:totem/markers/tier5
execute if score @s rituals.tier matches 6 run function rituals:totem/markers/tier6


