# ========================================
# Protection Ritual Effect
# ========================================
# Damages hostile mobs in range

# Get tier-based settings from config
function rituals:ritual/get_tier_settings

# Check if enough time has passed based on frequency
execute unless score @s rituals.timer >= #current_freq rituals.temp run return 0
scoreboard players operation @s rituals.timer -= #current_freq rituals.temp

# Apply effects in tier-based range
function rituals:ritual/apply_in_tier_range

# Apply protection effects based on tier with dynamic range
function rituals:ritual/effects/protection_apply with storage rituals:temp

# Ambient particles
particle dust{color:[0.5,0.7,1.0],scale:1.5} ~ ~1 ~ 2 1 2 0.1 5
