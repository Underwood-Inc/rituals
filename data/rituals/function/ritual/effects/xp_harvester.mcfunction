# ========================================
# XP Harvester Ritual Effect
# ========================================
# Generates XP orbs slowly over time (1 XP per second)
# REQUIRES REDSTONE POWER to operate (performance optimization)

# Check if totem is powered by redstone - if not, skip entirely
execute unless entity @s[tag=rituals.redstone_powered] run return 0

# Get tier-based range settings
function rituals:ritual/get_tier_settings

# Get xp_harvester-specific frequency
function rituals:ritual/get_xp_harvester_settings

# Check timing using separate effect counter
scoreboard players add @s rituals.distance 1
execute unless score @s rituals.distance >= #current_freq rituals.temp run return 0
scoreboard players set @s rituals.distance 0

# Apply effects in tier-based range
function rituals:ritual/apply_in_tier_range

# Apply XP harvester effects based on tier with dynamic range
function rituals:ritual/effects/xp_harvester_apply with storage rituals:temp

# Ambient particles (purple/enchanting theme)
particle dust{color:[0.6,0.3,1.0],scale:1.0} ~ ~1 ~ 2 1 2 0.1 5
particle minecraft:enchant ~ ~1.5 ~ 1 0.5 1 0.3 3


