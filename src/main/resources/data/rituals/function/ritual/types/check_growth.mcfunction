# ========================================
# Check and activate Growth Ritual
# ========================================
# Requires: 3+ totems with emeralds within range

# Count totems with emeralds (including self)
scoreboard players set #emerald_count rituals.temp 1

# Check all nearby totems
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=0.1..32] at @s run function rituals:ritual/types/count_emerald

# Check if we have enough totems (use config value)
execute if score #emerald_count rituals.temp >= #min_totems rituals.data run function rituals:ritual/activate_growth

