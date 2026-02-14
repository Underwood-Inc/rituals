# ========================================
# Check Player Action for Soul XP
# ========================================
# Runs as player holding a soul weapon
# Tracks blocks mined + combat kills via weighted tier system
# XP accumulates in scoreboard, syncs to item on totem placement

# === INITIALIZE PLAYER SCORES (first time holding soul weapon) ===
execute unless score @s rituals.soul_xp_gain matches 0.. run scoreboard players set @s rituals.soul_xp_gain 0

# === BLOCKS: Track blocks mined via weighted tier system ===
function rituals:soul/track_blocks

# === COMBAT: Track kills via weighted tier system ===
function rituals:soul/track_kills
