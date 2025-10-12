# ========================================
# Healing Ritual Effect
# ========================================
# Heals nearby players and animals

# Get tier-based range settings
function rituals:ritual/get_tier_settings

# Get healing-specific frequency
function rituals:ritual/get_healing_settings

# Check timing using separate effect counter
scoreboard players add @s rituals.distance 1
execute unless score @s rituals.distance >= #current_freq rituals.temp run return 0
scoreboard players set @s rituals.distance 0

# Apply effects in tier-based range
function rituals:ritual/apply_in_tier_range

# Apply healing effects based on tier with dynamic range
function rituals:ritual/effects/healing_apply with storage rituals:temp

# Ambient particles
particle dust{color:[1.0,0.5,0.8],scale:1.5} ~ ~1 ~ 2 1 2 0.1 8

