# ========================================
# Process the interaction between player and totem
# ========================================
# Runs as the totem, at the totem's position

# Check if player is holding an item (not empty hand)
execute store result score #has_item rituals.temp if data entity @p[distance=..5] SelectedItem.id

# If player has an item:
#   - If totem has item: SWAP (remove old, add new)
#   - If totem empty: ADD
# If player has no item (empty hand):
#   - If totem has item: REMOVE
#   - If totem empty: do nothing

execute if score #has_item rituals.temp matches 1.. if entity @s[tag=rituals.has_item] run function rituals:totem/swap_item
execute if score #has_item rituals.temp matches 1.. if entity @s[tag=!rituals.has_item] run function rituals:totem/add_item
execute unless score #has_item rituals.temp matches 1.. if entity @s[tag=rituals.has_item] run function rituals:totem/remove_item

