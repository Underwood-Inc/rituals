# ========================================
# Scrying Glass - Use a Charge (Offhand)
# ========================================
# Decrements uses from offhand scrying glass

# Get current uses from offhand item
execute store result score #uses rituals.soul_temp run data get entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".scrying_uses

# Decrement
scoreboard players remove #uses rituals.soul_temp 1

# Check if broken (0 uses left)
execute if score #uses rituals.soul_temp matches ..0 run function rituals:soul/scrying_break_offhand
execute if score #uses rituals.soul_temp matches ..0 run return 0

# Update the offhand item with new use count
execute store result storage rituals:temp new_uses int 1 run scoreboard players get #uses rituals.soul_temp

# Replace offhand with updated scrying glass
function rituals:soul/scrying_update_uses_offhand with storage rituals:temp
