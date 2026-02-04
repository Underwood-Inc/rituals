# ========================================
# Check Player Action for Soul XP
# ========================================
# Runs as player holding a soul weapon
# Tracks ALL blocks mined + combat kills

# === INITIALIZE PLAYER SCORES (first time holding soul weapon) ===
execute unless score @s rituals.soul_xp_gain matches 0.. run scoreboard players set @s rituals.soul_xp_gain 0

# === BLOCKS: Track ALL blocks mined (unified system) ===
function rituals:soul/track_all_blocks

# === COMBAT: Track kills via statistics ===
function rituals:soul/track_combat

