# ========================================
# Add an item to the totem display
# ========================================
# Runs as and at the totem
# Player UUID in rituals:temp interacting_uuid (macro)

# Check if player is holding a valid item (from storage)
execute store result score #has_item rituals.temp if data storage rituals:temp player_selected_item.id

# If player has an item, transfer it to the totem
execute if score #has_item rituals.temp matches 1.. run function rituals:totem/transfer_item_to_totem with storage rituals:temp
