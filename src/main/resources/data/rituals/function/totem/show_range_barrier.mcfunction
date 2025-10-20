# ========================================
# Show translucent barrier using block_display entities
# ========================================
# Runs as and at the totem

# Store totem ID for linking displays
scoreboard players operation #barrier_id rituals.temp = @s rituals.id

# Calculate range values for display positioning
# Use sentry-specific range if this is a sentry ritual (effect 6)
execute if score @s rituals.effect matches 6 run function rituals:ritual/apply_in_tier_range_sentry
execute unless score @s rituals.effect matches 6 run function rituals:ritual/apply_in_tier_range

# Spawn barrier displays (6 faces of the box)
function rituals:totem/spawn_barrier_faces with storage rituals:temp

# Mark that barrier is shown
tag @s add rituals.barrier_shown

# Sound and particle feedback
playsound block.beacon.activate block @a ~ ~ ~ 0.3 2.0
particle end_rod ~ ~2 ~ 0.3 0.3 0.3 0.05 20

