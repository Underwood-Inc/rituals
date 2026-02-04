# Apply Soul Data to held item
# Injects custom_data component with soul properties

# Get the soul name and type from storage
# We'll use item modify with a function

# Create the custom data compound
data modify storage rituals:temp soul_data set value {soul_embodied:1b,soul_level:1,soul_xp:0,soul_xp_total:0,soul_level_cap:15,soul_ascension_tier:1,soul_bonus_enchants:0,soul_ready_ascend:0b,soul_kills:0,soul_blocks_broken:0}

# Add soul name from storage
data modify storage rituals:temp soul_data.soul_name set from storage rituals:temp soul_name

# Add soul type from storage
data modify storage rituals:temp soul_data.soul_type set from storage rituals:temp soul_type

# Merge with existing custom_data if any
execute store success score @s rituals.soul_temp run data get entity @s SelectedItem.components."minecraft:custom_data"
execute if score @s rituals.soul_temp matches 1 run data modify storage rituals:temp existing_data set from entity @s SelectedItem.components."minecraft:custom_data"
execute if score @s rituals.soul_temp matches 1 run data modify storage rituals:temp existing_data merge from storage rituals:temp soul_data
execute if score @s rituals.soul_temp matches 1 run data modify storage rituals:temp soul_data set from storage rituals:temp existing_data

# Apply the custom data using item modify
item modify entity @s weapon.mainhand rituals:inject_soul_data

