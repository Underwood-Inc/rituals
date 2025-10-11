# ========================================
# Process the interaction between player and totem
# ========================================
# Runs as the totem, at the totem's position

# Check if totem already has an item
execute if entity @s[tag=rituals.has_item] run function rituals:totem/remove_item
execute if entity @s[tag=!rituals.has_item] run function rituals:totem/add_item

