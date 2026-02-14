# ========================================
# Track Mob Kills - Weighted XP System
# ========================================
# Orchestrator: calls per-category kill tracking sub-files
# Uses tier-based weighted scoring for different mob values
# Runs as player holding a soul weapon
# Minecraft 1.21.11

# === SAFETY CHECK: Must be holding soul weapon ===
scoreboard players set #has_soul rituals.soul_temp 0
execute store result score #has_soul rituals.soul_temp run data get entity @s SelectedItem.components."minecraft:custom_data".soul_embodied
execute unless score #has_soul rituals.soul_temp matches 1 run return fail

# === RESET WEIGHTED TOTAL ===
scoreboard players set #total rituals.soul_temp 0

# === SUM KILLS BY CATEGORY (each adds weighted values to #total) ===
function rituals:soul/track_kills/common
function rituals:soul/track_kills/nether
function rituals:soul/track_kills/end_and_bosses
function rituals:soul/track_kills/passive

# === CALCULATE KILL DELTA ===
# Ensure player score exists (defensive)
execute unless score @s rituals.prev_kills matches -2147483648.. run scoreboard players set @s rituals.prev_kills 0

# First time detection using tag (prevents huge XP dump from lifetime stats)
execute unless entity @s[tag=rituals.kills_initialized] store result score @s rituals.prev_kills run scoreboard players get #total rituals.soul_temp
execute unless entity @s[tag=rituals.kills_initialized] run tag @s add rituals.kills_initialized

scoreboard players operation #xp_gain rituals.soul_temp = #total rituals.soul_temp
scoreboard players operation #xp_gain rituals.soul_temp -= @s rituals.prev_kills

# === AWARD XP IF ANY (applies directly to held item) ===
execute if score #xp_gain rituals.soul_temp matches 1.. run function rituals:soul/award_xp

# Update previous weighted count
scoreboard players operation @s rituals.prev_kills = #total rituals.soul_temp
