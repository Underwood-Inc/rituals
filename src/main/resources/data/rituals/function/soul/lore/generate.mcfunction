# Generate Soul Weapon Lore (Datapack method)
# Creates the initial lore for a newly awakened soul weapon
# Called by soul/awaken_item.mcfunction

# Get soul data from the item
execute store result score @s rituals.soul_level run data get entity @s SelectedItem.components."minecraft:custom_data".soul_level
execute store result score @s rituals.soul_xp run data get entity @s SelectedItem.components."minecraft:custom_data".soul_xp
execute store result score @s rituals.soul_level_cap run data get entity @s SelectedItem.components."minecraft:custom_data".soul_level_cap
execute store result score @s rituals.soul_tier run data get entity @s SelectedItem.components."minecraft:custom_data".soul_ascension_tier

# Copy soul name to storage for text generation
data modify storage rituals:temp soul_name set from entity @s SelectedItem.components."minecraft:custom_data".soul_name

# Build the lore array in storage
data modify storage rituals:temp lore set value []

# Line 1: Soul name
data modify storage rituals:temp lore append value '{"text":"✦ Soul: ","color":"dark_purple","extra":[{"storage":"rituals:temp","nbt":"soul_name","color":"white","bold":true}]}'

# Line 2: Level (will be dynamically updated)
# This is a placeholder - actual value inserted below
data modify storage rituals:temp lore append value '{"text":"Level: ","color":"gray","extra":[{"score":{"name":"@s","objective":"rituals.soul_level"},"color":"yellow"},{"text":"/","color":"gray"},{"score":{"name":"@s","objective":"rituals.soul_level_cap"},"color":"yellow"},{"text":" (Tier ","color":"dark_gray"},{"score":{"name":"@s","objective":"rituals.soul_tier"},"color":"dark_gray"},{"text":")","color":"dark_gray"}]}'

# Line 3: XP bar placeholder
data modify storage rituals:temp lore append value '{"text":"XP: ","color":"gray","extra":[{"score":{"name":"@s","objective":"rituals.soul_xp"},"color":"green"},{"text":" ▓▓▓▓▓░░░░░","color":"dark_green"}]}'

# Line 4: Spacer
data modify storage rituals:temp lore append value '{"text":""}'

# Line 5: Soul Embodied marker
data modify storage rituals:temp lore append value '{"text":"Soul Embodied","color":"dark_purple","italic":false}'

# Apply lore to the item
# Note: In 1.21+ we use the lore component
item modify entity @s weapon.mainhand rituals:apply_soul_lore

