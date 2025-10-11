# ========================================
# Add an item to the totem display
# ========================================
# Runs as and at the totem

# Check if player is holding a valid item
execute store result score #has_item rituals.temp run data get entity @p[distance=..5] SelectedItem.id

# If player has an item, transfer it to the totem
execute if score #has_item rituals.temp matches 1.. run function rituals:totem/transfer_item_to_totem

