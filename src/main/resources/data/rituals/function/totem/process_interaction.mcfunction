# ========================================
# Process the interaction between player and totem
# ========================================
# Runs as the totem, at the totem's position
# Player UUID stored in rituals:temp interacting_uuid
# Player held item stored in rituals:temp player_selected_item

# ACTIVE RITUAL PROTECTION: Block ANY item changes on active rituals
execute if entity @s[tag=rituals.active_ritual] run return run function rituals:totem/warn_ritual_locked with storage rituals:temp

# Check if player is holding an item (not empty hand) - read from storage
execute store result score #has_item rituals.temp if data storage rituals:temp player_selected_item.id

# Normal interaction (inactive totems only past this point)
# If player has an item:
#   - If totem has item: SWAP (remove old, add new)
#   - If totem empty: ADD
# If player has no item (empty hand):
#   - If totem has item: REMOVE
#   - If totem empty: do nothing

execute if score #has_item rituals.temp matches 1.. if entity @s[tag=rituals.has_item] run function rituals:totem/swap_item with storage rituals:temp
execute if score #has_item rituals.temp matches 1.. if entity @s[tag=!rituals.has_item] run function rituals:totem/add_item with storage rituals:temp
execute unless score #has_item rituals.temp matches 1.. if entity @s[tag=rituals.has_item] run function rituals:totem/remove_item with storage rituals:temp
