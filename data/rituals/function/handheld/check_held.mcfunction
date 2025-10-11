# Player is holding a handheld totem in offhand
# Get the tier from the item

# Store tier in scoreboard
execute store result score @s rituals.tier run data get entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".handheld_tier

# Check what item they have on the totem (display item stored in custom_data)
# For now, we'll cycle through effects or use a default effect per tier
# This will apply the effect based on tier

# Apply effects to self and nearby players (1/4 radius of placed totems)
function rituals:handheld/apply_effects

