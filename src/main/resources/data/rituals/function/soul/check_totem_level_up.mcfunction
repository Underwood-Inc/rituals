# ========================================
# Check for Level Up on Totem
# ========================================
# Called after syncing XP to check if level increased
# Uses storage rituals:temp item
# Level curve configurable via: /data modify storage rituals:config soul_level_...

# Get current level and XP
execute store result score #current_level rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_level
execute store result score #current_xp rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_xp
execute store result score #level_cap rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_level_cap

# === XP CURVE (from config) ===
# Formula: (level × base) + (level² × scaling)
# Get multipliers from config
execute store result score #base rituals.soul_temp run data get storage rituals:config soul_level_base
execute store result score #scaling rituals.soul_temp run data get storage rituals:config soul_level_scaling

# Calculate: level × base
scoreboard players operation #xp_needed rituals.soul_temp = #current_level rituals.soul_temp
scoreboard players operation #xp_needed rituals.soul_temp *= #base rituals.soul_temp

# Calculate: level² × scaling
scoreboard players operation #level_squared rituals.soul_temp = #current_level rituals.soul_temp
scoreboard players operation #level_squared rituals.soul_temp *= #current_level rituals.soul_temp
scoreboard players operation #level_squared rituals.soul_temp *= #scaling rituals.soul_temp

# Add together
scoreboard players operation #xp_needed rituals.soul_temp += #level_squared rituals.soul_temp

# Check if XP exceeds threshold
execute if score #current_xp rituals.soul_temp >= #xp_needed rituals.soul_temp if score #current_level rituals.soul_temp < #level_cap rituals.soul_temp run function rituals:soul/do_totem_level_up

# Update lore based on new stats
function rituals:soul/update_totem_lore

