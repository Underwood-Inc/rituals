# ========================================
# Show translucent barrier using block_display entities
# ========================================
# Runs as and at the totem

# Get tier-based range settings
function rituals:ritual/get_tier_settings

# Store totem ID for linking displays
scoreboard players operation #barrier_id rituals.temp = @s rituals.id

# Calculate range values for display positioning
function rituals:ritual/apply_in_tier_range

# Spawn barrier displays (6 faces of the box)
function rituals:totem/spawn_barrier_faces with storage rituals:temp

# Mark that barrier is shown
tag @s add rituals.barrier_shown

# Sound and particle feedback
playsound block.beacon.activate block @a ~ ~ ~ 0.3 2.0
particle end_rod ~ ~2 ~ 0.3 0.3 0.3 0.05 20

