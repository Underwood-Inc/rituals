# ========================================
# Extract Player's Anvil Rename
# ========================================
# Called when we detect an anvil rename (italic:true at root)
# Extracts the player's custom name and saves it to soul_display_name

# Get the text from the anvil rename
execute store success score #has_text rituals.temp run data get storage rituals:temp item.components."minecraft:custom_name".text

# Only proceed if we got valid text
execute unless score #has_text rituals.temp matches 1 run return 0

# Extract the player's name
data modify storage rituals:temp extracted_name set from storage rituals:temp item.components."minecraft:custom_name".text

# Validate: make sure it's not empty
execute store result score #name_length rituals.temp run data get storage rituals:temp extracted_name
execute if score #name_length rituals.temp matches 0 run return 0

# Save to soul_display_name in the item's custom_data
data modify storage rituals:temp item.components."minecraft:custom_data".soul_display_name set from storage rituals:temp extracted_name

# Notify player their name was preserved
tellraw @a[distance=..16] [{"text":"  ✎ ","color":"yellow"},{"text":"Custom name preserved: ","color":"gray"},{"storage":"rituals:temp","nbt":"extracted_name","color":"light_purple"}]

# Cleanup
data remove storage rituals:temp extracted_name


