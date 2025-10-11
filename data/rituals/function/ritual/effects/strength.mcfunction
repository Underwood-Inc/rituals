# ========================================
# Strength Ritual Effect
# ========================================
# Grants strength and resistance to nearby players

# Get tier-based settings from config
function rituals:ritual/get_tier_settings

# Check if enough time has passed based on frequency
execute unless score @s rituals.timer >= #current_freq rituals.temp run return 0
scoreboard players operation @s rituals.timer -= #current_freq rituals.temp

# Apply effects in tier-based range
function rituals:ritual/apply_in_tier_range

# Apply effects based on tier with dynamic range
function rituals:ritual/effects/strength_apply with storage rituals:temp

# Ambient particles
particle crit ~ ~1 ~ 2 1 2 0.1 5

