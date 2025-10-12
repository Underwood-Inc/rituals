# ========================================
# Respawn missing barriers
# ========================================
# Called when barriers should exist but don't (mod interference)

# Get tier-based range settings
function rituals:ritual/get_tier_settings

# Store totem ID for linking displays
scoreboard players operation #barrier_id rituals.temp = @s rituals.id

# Calculate range values for display positioning
function rituals:ritual/apply_in_tier_range

# Spawn barrier displays (6 faces of the box)
function rituals:totem/spawn_barrier_faces with storage rituals:temp

# Note in logs (for debugging modpack issues)
# Commented out to avoid spam: tellraw @a[tag=!,tag=!] [{"text":"[Rituals] Respawned barriers for totem","color":"yellow"}]


