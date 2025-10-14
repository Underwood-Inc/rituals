# ========================================
# Decay mine progress if player stops mining
# ========================================
# Runs as and at totem

# Skip if no progress data
execute unless data entity @s data.rituals.mine_progress run return 0

# Get current decay timer
execute store result score #decay_timer rituals.temp run data get entity @s data.rituals.mine_decay

# Decrement decay timer if > 0
execute if score #decay_timer rituals.temp matches 1.. run scoreboard players remove #decay_timer rituals.temp 1
execute if score #decay_timer rituals.temp matches 1.. run execute store result entity @s data.rituals.mine_decay int 1 run scoreboard players get #decay_timer rituals.temp

# If decay timer reaches 0, reset progress
execute if score #decay_timer rituals.temp matches 0 run data modify entity @s data.rituals.mine_progress set value 0
execute if score #decay_timer rituals.temp matches 0 run particle smoke ~ ~1 ~ 0.2 0.2 0.2 0.01 5

