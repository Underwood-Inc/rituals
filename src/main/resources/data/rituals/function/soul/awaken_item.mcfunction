# ========================================
# Awaken Item - Soul Embodiment Ritual
# ========================================
# Transforms a tool into a living soul weapon
# Called AS the item_display entity by activate_soul_embodiment.mcfunction

# Generate a random soul name based on type (soul_type already set by activate_soul_embodiment)
function rituals:soul/names/generate

# Create the soul data compound
data modify storage rituals:temp soul_data set value {soul_embodied:1b,soul_level:1,soul_xp:0,soul_xp_total:0,soul_level_cap:15,soul_ascension_tier:1,soul_bonus_enchants:0,soul_ready_ascend:0b,soul_kills:0,soul_blocks_broken:0}

# Add soul name from storage (the lore/identity name like "Vexbane")
data modify storage rituals:temp soul_data.soul_name set from storage rituals:temp soul_name

# Add display name (the customizable name shown in item title - defaults to generated name)
data modify storage rituals:temp soul_data.soul_display_name set from storage rituals:temp soul_name

# Add soul type from storage  
data modify storage rituals:temp soul_data.soul_type set from storage rituals:temp soul_type

# === APPLY CUSTOM DATA TO ITEM ===
# Apply custom_data component - merge or set
execute store success score #has_custom rituals.temp run data get entity @s item.components."minecraft:custom_data"
execute if score #has_custom rituals.temp matches 1 run data modify entity @s item.components."minecraft:custom_data" merge from storage rituals:temp soul_data
execute if score #has_custom rituals.temp matches 0 run data modify entity @s item.components."minecraft:custom_data" set from storage rituals:temp soul_data

# === APPLY CUSTOM NAME (using generated name + level) ===
# Store to temp for macro
data modify storage rituals:temp item set from entity @s item

# CRITICAL: Macros need these values SET before function call!
# soul_name is already in storage from generate function, copy it as soul_display_name
data modify storage rituals:temp soul_display_name set from storage rituals:temp soul_name
# Level is 1 for newly awakened items
data modify storage rituals:temp display_level set value 1

function rituals:soul/name/apply_display with storage rituals:temp
data modify entity @s item set from storage rituals:temp item

# === APPLY LORE (Initial values: Level 1, XP 0, Cap 15) ===
data modify entity @s item.components."minecraft:lore" set value [{"text":"━━━━━━━━━━━━━━━━━━━━","color":"dark_purple"},{"text":"Soul Level: 1/15","color":"gray"},{"text":"Soul XP: 0/10","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━","color":"dark_purple"},{"text":"\"I awaken...\"","color":"gray","italic":true},{"text":"✦ Soul-Bound Weapon ✦","color":"light_purple"}]

# Cleanup temp values
data remove storage rituals:temp soul_data
data remove storage rituals:temp soul_name
data remove storage rituals:temp soul_display_name
data remove storage rituals:temp display_level

# Debug: confirm soul was properly awakened
execute if entity @a[tag=rituals.debug] run tellraw @a[tag=rituals.debug] [{"text":"[Soul Awaken] ","color":"gold"},{"text":"Item awakened with name: ","color":"gray"},{"nbt":"item.components.\"minecraft:custom_name\"","entity":"@s","interpret":true}]

