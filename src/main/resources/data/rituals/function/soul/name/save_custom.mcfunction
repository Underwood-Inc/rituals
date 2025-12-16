# ========================================
# Save Player's Custom Name
# ========================================
# Stores the player's anvil rename as the new soul_display_name

# Get the raw text from the name component
data modify storage rituals:temp player_name set from storage rituals:temp item.components."minecraft:custom_name".text

# Check if it's not empty and not our default format
execute store success score #has_name rituals.temp run data get storage rituals:temp player_name

# Only save if we got a name
execute if score #has_name rituals.temp matches 1 run data modify storage rituals:temp item.components."minecraft:custom_data".soul_display_name set from storage rituals:temp player_name

# Notify player their custom name was preserved
execute if score #has_name rituals.temp matches 1 run tellraw @a[distance=..16] [{"text":"  ✎ ","color":"yellow"},{"text":"Custom name preserved: ","color":"gray"},{"storage":"rituals:temp","nbt":"player_name","color":"light_purple"}]

# Cleanup
data remove storage rituals:temp player_name


