# ========================================
# Strength Ritual Effect
# ========================================
# Grants strength and resistance to nearby players

# Get tier-based range settings
function rituals:ritual/get_tier_settings

# Get strength-specific frequency
function rituals:ritual/get_strength_settings

# Check timing using separate effect counter
scoreboard players add @s rituals.data 1
execute unless score @s rituals.data >= #current_freq rituals.temp run return 0
scoreboard players set @s rituals.data 0

# Apply effects in tier-based range
function rituals:ritual/apply_in_tier_range

# Apply effects based on tier with dynamic range
function rituals:ritual/effects/strength_apply with storage rituals:temp

# Ambient particles
particle crit ~ ~1 ~ 2 1 2 0.1 5

