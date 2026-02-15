# ========================================
# Process Level Up
# ========================================
# Checks if the item has enough XP to level up
# Works with storage rituals:temp item

# Get current stats from storage
execute store result score #current_xp rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_xp
execute store result score #current_level rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_level
execute store result score #level_cap rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_level_cap

# Calculate target level: every 100 XP = 1 level (starting at level 1 with 0 XP)
# Level 1: 0-99 XP, Level 2: 100-199 XP, etc.
scoreboard players operation #target_level rituals.soul_temp = #current_xp rituals.soul_temp
scoreboard players operation #target_level rituals.soul_temp /= #100 rituals.data
scoreboard players add #target_level rituals.soul_temp 1

# Cap at level cap
execute if score #target_level rituals.soul_temp > #level_cap rituals.soul_temp run scoreboard players operation #target_level rituals.soul_temp = #level_cap rituals.soul_temp

# Check if we leveled up
execute if score #target_level rituals.soul_temp > #current_level rituals.soul_temp run function rituals:soul/do_level_up
