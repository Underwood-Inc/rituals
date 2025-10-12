# ========================================
# Prosperity Ritual Effect
# ========================================
# Attracts items, grants XP and Luck effect (no entity spawning for performance)

# Get tier-based range settings
function rituals:ritual/get_tier_settings

# Get prosperity-specific frequency
function rituals:ritual/get_prosperity_settings

# Check timing using separate effect counter
scoreboard players add @s rituals.data 1
execute unless score @s rituals.data >= #current_freq rituals.temp run return 0
scoreboard players set @s rituals.data 0

# Apply effects in tier-based range
function rituals:ritual/apply_in_tier_range

# Apply prosperity effects based on tier with dynamic range
function rituals:ritual/effects/prosperity_apply with storage rituals:temp

# Ambient particles
particle dust{color:[1.0,0.8,0.0],scale:1.0} ~ ~1 ~ 2 1 2 0.1 5

