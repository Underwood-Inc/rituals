# ========================================
# Spawn range markers (corners + mid-points)
# ========================================
# Called when totem is powered ON
# Uses tier to determine range and color

# Store totem ID for linking markers
scoreboard players operation #marker_id rituals.temp = @s rituals.id

# Store display tier (for sentry rituals, show them with red markers at doubled range)
scoreboard players operation #display_tier rituals.temp = @s rituals.tier
scoreboard players set #is_sentry rituals.temp 0

# If sentry ritual (effect 6), mark it and use doubled range visualization
execute if score @s rituals.effect matches 6 run scoreboard players set #is_sentry rituals.temp 1

# Call tier-specific marker placement
execute if score @s rituals.tier matches 1 run function rituals:totem/markers/tier1
execute if score @s rituals.tier matches 2 run function rituals:totem/markers/tier2
execute if score @s rituals.tier matches 3 run function rituals:totem/markers/tier3
execute if score @s rituals.tier matches 4 run function rituals:totem/markers/tier4
execute if score @s rituals.tier matches 5 run function rituals:totem/markers/tier5
execute if score @s rituals.tier matches 6 run function rituals:totem/markers/tier6


