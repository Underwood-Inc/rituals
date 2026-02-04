# ========================================
# Scrying Glass - Check Level Up (Storage-based)
# ========================================
# Checks if synced XP causes level up
# Item data is already in storage at rituals:temp scrying_item

# Get current level and cap from STORAGE
execute store result score #current_level rituals.soul_temp run data get storage rituals:temp scrying_item.components."minecraft:custom_data".soul_level
execute store result score #level_cap rituals.soul_temp run data get storage rituals:temp scrying_item.components."minecraft:custom_data".soul_level_cap
execute store result score #current_xp rituals.soul_temp run data get storage rituals:temp scrying_item.components."minecraft:custom_data".soul_xp

# Calculate XP needed for next level (next_level * 100)
scoreboard players operation #next_level rituals.soul_temp = #current_level rituals.soul_temp
scoreboard players add #next_level rituals.soul_temp 1
scoreboard players operation #xp_needed rituals.soul_temp = #next_level rituals.soul_temp
scoreboard players operation #xp_needed rituals.soul_temp *= #100 rituals.data

# Check if level up needed
execute if score #current_xp rituals.soul_temp >= #xp_needed rituals.soul_temp if score #current_level rituals.soul_temp < #level_cap rituals.soul_temp run function rituals:soul/scrying_do_levelup_storage

