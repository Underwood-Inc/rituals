# ========================================
# Check and activate Strength Ritual
# ========================================
# Requires: 3+ totems with diamonds within range

scoreboard players set #diamond_count rituals.temp 0
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=0.1..32] at @s run function rituals:ritual/types/count_diamond

# Count including self
scoreboard players add #diamond_count rituals.temp 1
execute if score #diamond_count rituals.temp >= #min_totems rituals.data run function rituals:ritual/activate_strength

