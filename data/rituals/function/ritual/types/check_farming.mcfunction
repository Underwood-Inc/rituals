# ========================================
# Check and activate Auto-Farming Ritual
# ========================================
# Requires: 4+ totems with diamond hoes within range

# Count totems with diamond hoes (including self)
scoreboard players set #farming_count rituals.temp 1

# Check all nearby totems
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=0.1..32] at @s run function rituals:ritual/types/count_farming

# Check if we have enough totems (minimum 4 for farming)
execute if score #farming_count rituals.temp matches 4.. run function rituals:ritual/activate_farming

