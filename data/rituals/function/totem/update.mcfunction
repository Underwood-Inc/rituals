# ========================================
# Update totem state
# ========================================
# Runs as and at each totem interaction entity

# Check if totem has been attacked (left-clicked) and verify correct tool before breaking
execute if data entity @s attack run function rituals:totem/check_tool_and_break_progressive

# Check if totem has been right-clicked
execute if data entity @s interaction run function rituals:totem/handle_interaction

# Check for redstone power (poll slot 0 — once per 20-tick cycle)
execute if score #rituals_global_tick rituals.data matches 0 run function rituals:totem/check_redstone

# Pattern preview particles (poll slot 8; not for active rituals)
execute if score #rituals_global_tick rituals.data matches 8 if entity @s[tag=rituals.redstone_powered,tag=rituals.has_item,tag=!rituals.active_ritual] run function rituals:totem/patterns/visualize_pattern

# Animate item display (rotation and bobbing) if item is present
execute if entity @s[tag=rituals.has_item] run function rituals:totem/animate_item_display

# Decay mine progress if player stops mining
function rituals:totem/decay_mine_progress

