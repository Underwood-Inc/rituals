# ========================================
# Check and activate Healing Ritual
# ========================================
# Requires: 3+ totems with nether stars within range

scoreboard players set #star_count rituals.temp 0
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=0.1..32] at @s run function rituals:ritual/types/count_star

# Count including self
scoreboard players add #star_count rituals.temp 1
execute if score #star_count rituals.temp >= #min_totems rituals.data run function rituals:ritual/activate_healing

