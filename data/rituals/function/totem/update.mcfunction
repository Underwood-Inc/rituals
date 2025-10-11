# ========================================
# Update totem state
# ========================================
# Runs as and at each totem interaction entity

# Check if totem has been attacked (left-clicked/punched) to remove it
execute if data entity @s attack run function rituals:totem/break

# Check if totem has been right-clicked
execute if data entity @s interaction run function rituals:totem/handle_interaction

# Check for redstone power and visualize range
function rituals:totem/check_redstone

