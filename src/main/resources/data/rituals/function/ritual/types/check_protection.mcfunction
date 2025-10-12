# ========================================
# Check and activate Protection Ritual
# ========================================
# Requires: 3+ totems with iron ingots within range

scoreboard players set #iron_count rituals.temp 0
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=0.1..32] at @s run function rituals:ritual/types/count_iron

# Count including self
scoreboard players add #iron_count rituals.temp 1
execute if score #iron_count rituals.temp >= #min_totems rituals.data run function rituals:ritual/activate_protection

