# ========================================
# Process Level Up
# ========================================
# Checks if the item has enough XP to level up
# Works with storage rituals:temp item

# Get current stats from storage
execute store result score #current_xp rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_xp
execute store result score #current_level rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_level
execute store result score #level_cap rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_level_cap

# === GLUTTONY (Soul Hunger) PENALTY ===
# If the item has the gluttony debuff, increase the XP divisor.
# Effective formula: target_level = xp / (100 * (1 + 0.2*gluttony_level)) + 1
# Level 1: 120 XP per level (+20%), Level 2: 140 XP per level (+40%)
scoreboard players set #xp_divisor rituals.soul_temp 100
execute store result score #gluttony_lvl rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels.gluttony
execute if score #gluttony_lvl rituals.soul_temp matches 1 run scoreboard players set #xp_divisor rituals.soul_temp 120
execute if score #gluttony_lvl rituals.soul_temp matches 2.. run scoreboard players set #xp_divisor rituals.soul_temp 140

# Calculate target level: xp / divisor + 1
scoreboard players operation #target_level rituals.soul_temp = #current_xp rituals.soul_temp
scoreboard players operation #target_level rituals.soul_temp /= #xp_divisor rituals.soul_temp
scoreboard players add #target_level rituals.soul_temp 1

# Cap at level cap
execute if score #target_level rituals.soul_temp > #level_cap rituals.soul_temp run scoreboard players operation #target_level rituals.soul_temp = #level_cap rituals.soul_temp

# Check if we leveled up
execute if score #target_level rituals.soul_temp > #current_level rituals.soul_temp run function rituals:soul/do_level_up

