# ========================================
# Increment mining progress on this totem
# ========================================
# Runs as and at totem

# Initialize NBT if not present
execute unless data entity @s data.rituals.mine_progress run data modify entity @s data.rituals.mine_progress set value 0
execute unless data entity @s data.rituals.mine_decay run data modify entity @s data.rituals.mine_decay set value 0

# Increment progress
execute store result score #current_progress rituals.temp run data get entity @s data.rituals.mine_progress
scoreboard players add #current_progress rituals.temp 1
execute store result entity @s data.rituals.mine_progress int 1 run scoreboard players get #current_progress rituals.temp

# Reset decay timer (2 seconds = 40 ticks)
data modify entity @s data.rituals.mine_decay set value 40

# Check if broken
function rituals:totem/check_mine_progress


