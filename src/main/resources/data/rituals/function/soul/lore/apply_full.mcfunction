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
$data modify storage rituals:temp new_lore[1] set value [{"text":"⬥ Level: ","color":"gray","italic":false},{"text":"$(lore_level)/$(lore_cap)","color":"yellow","italic":false}]
$data modify storage rituals:temp new_lore[2] set value [{"text":"⬥ XP: ","color":"gray","italic":false},{"text":"$(lore_xp)/$(lore_xp_needed)","color":"green","italic":false}]

# === PROPORTIONAL XP BAR ===
# Both lore_xp and lore_xp_needed are already in storage (set by caller).
# Pull them into scores for math, calculate percentage, render visual bar.
execute store result score #bar_xp rituals.soul_temp run data get storage rituals:temp lore_xp
execute store result score #bar_xp_needed rituals.soul_temp run data get storage rituals:temp lore_xp_needed

# Guard: prevent division by zero (corrupt data edge case)
execute if score #bar_xp_needed rituals.soul_temp matches ..0 run scoreboard players set #bar_xp_needed rituals.soul_temp 1

# percent = (xp * 100) / xp_needed
scoreboard players operation #bar_percent rituals.soul_temp = #bar_xp rituals.soul_temp
scoreboard players operation #bar_percent rituals.soul_temp *= #100 rituals.data
scoreboard players operation #bar_percent rituals.soul_temp /= #bar_xp_needed rituals.soul_temp

# Clamp to 0-100
execute if score #bar_percent rituals.soul_temp matches ..-1 run scoreboard players set #bar_percent rituals.soul_temp 0
execute if score #bar_percent rituals.soul_temp matches 101.. run scoreboard players set #bar_percent rituals.soul_temp 100

# filled segments = percent / 10 (0-10 for a 10-segment bar)
scoreboard players operation #bar_filled rituals.soul_temp = #bar_percent rituals.soul_temp
scoreboard players operation #bar_filled rituals.soul_temp /= #10 rituals.data

# Store percent into storage so render_xp_bar can use it as a macro param
execute store result storage rituals:temp bar_percent int 1 run scoreboard players get #bar_percent rituals.soul_temp

# Insert proportional bar at lore index 3 (shifts buffs/debuffs down)
function rituals:soul/lore/render_xp_bar with storage rituals:temp

# Clean up bar temp values
data remove storage rituals:temp bar_percent

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

