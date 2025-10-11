# ========================================
# Check and activate Prosperity Ritual
# ========================================
# Requires: 3+ totems with gold ingots within range

scoreboard players set #gold_count rituals.temp 0
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=0.1..32] at @s run function rituals:ritual/types/count_gold

# Count including self
scoreboard players add #gold_count rituals.temp 1
execute if score #gold_count rituals.temp >= #min_totems rituals.data run function rituals:ritual/activate_prosperity

