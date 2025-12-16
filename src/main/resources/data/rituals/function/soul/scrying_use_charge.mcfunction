# ========================================
# Scrying Glass - Use a Charge
# ========================================
# Decrements uses and breaks glass when empty

# Get current uses from mainhand item
execute store result score #uses rituals.soul_temp run data get entity @s SelectedItem.components."minecraft:custom_data".scrying_uses

# Decrement
scoreboard players remove #uses rituals.soul_temp 1

# Check if broken (0 uses left)
execute if score #uses rituals.soul_temp matches ..0 run function rituals:soul/scrying_break
execute if score #uses rituals.soul_temp matches ..0 run return 0

# Update the item with new use count
# Store new uses to storage
execute store result storage rituals:temp new_uses int 1 run scoreboard players get #uses rituals.soul_temp

# Replace mainhand with updated scrying glass
function rituals:soul/scrying_update_uses with storage rituals:temp

