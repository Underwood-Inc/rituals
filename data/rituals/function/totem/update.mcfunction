# ========================================
# Update totem state
# ========================================
# Runs as and at each totem interaction entity

# Check if totem has been attacked (left-clicked) and verify correct tool before breaking
execute if data entity @s attack run function rituals:totem/check_tool_and_break_progressive

# Check if totem has been right-clicked
execute if data entity @s interaction run function rituals:totem/handle_interaction

# Check for redstone power and visualize range/pattern (using particles)
function rituals:totem/check_redstone

# If redstone powered, continuously show pattern visualization
execute if entity @s[tag=rituals.redstone_powered,tag=rituals.has_item] run function rituals:totem/patterns/visualize_pattern

# Animate item display (rotation and bobbing) if item is present
execute if entity @s[tag=rituals.has_item] run function rituals:totem/animate_item_display

# Decay mine progress if player stops mining
function rituals:totem/decay_mine_progress

