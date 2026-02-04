# ========================================
# Apply Full Lore with Values (Macro)
# ========================================
# Injects level/XP values and applies lore to item
# Called with storage containing: lore_level, lore_xp, lore_cap, lore_xp_needed

# === CHECK FOR ANVIL RENAME FIRST ===
# Must detect before we overwrite the custom_name!
function rituals:soul/name/detect_anvil_rename

# === ENSURE SOUL_DISPLAY_NAME EXISTS ===
# Migration: If no soul_display_name, copy from soul_name (the true identity)
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_display_name if data storage rituals:temp item.components."minecraft:custom_data".soul_name run data modify storage rituals:temp item.components."minecraft:custom_data".soul_display_name set from storage rituals:temp item.components."minecraft:custom_data".soul_name

# Fallback: If still no display name, use "Soulbound Weapon"
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_display_name run data modify storage rituals:temp item.components."minecraft:custom_data".soul_display_name set value "Soulbound Weapon"

# Build the base lore structure
function rituals:soul/lore/build_full

# Now replace placeholders with actual values using macro
# CRITICAL: Use unquoted JSON for proper text components in 1.21+
$data modify storage rituals:temp new_lore[1] set value {"text":"Soul Level: $(lore_level)/$(lore_cap)","color":"gray"}
$data modify storage rituals:temp new_lore[2] set value {"text":"Soul XP: $(lore_xp)/$(lore_xp_needed)","color":"gray"}

# Apply lore to item
data modify storage rituals:temp item.components."minecraft:lore" set from storage rituals:temp new_lore

# === PREPARE DISPLAY NAME DATA FOR MACRO ===
# CRITICAL: Macros substitute BEFORE function runs, so we must set these BEFORE calling!

# Get soul_display_name (priority: soul_display_name > soul_name > fallback)
data modify storage rituals:temp soul_display_name set from storage rituals:temp item.components."minecraft:custom_data".soul_display_name
execute unless data storage rituals:temp soul_display_name run data modify storage rituals:temp soul_display_name set from storage rituals:temp item.components."minecraft:custom_data".soul_name
execute unless data storage rituals:temp soul_display_name run data modify storage rituals:temp soul_display_name set value "Soulbound Weapon"

# Get display_level from the item (already set by level up logic)
execute store result storage rituals:temp display_level int 1 run data get storage rituals:temp item.components."minecraft:custom_data".soul_level

# Now call the macro function with all values prepared
function rituals:soul/name/apply_display with storage rituals:temp

# Clean up temp values
data remove storage rituals:temp new_lore
data remove storage rituals:temp soul_display_name
data remove storage rituals:temp display_level

