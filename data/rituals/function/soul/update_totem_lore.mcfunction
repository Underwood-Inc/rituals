# ========================================
# Update Soul Weapon Lore on Totem
# ========================================
# Updates the item's lore to reflect current stats, buffs, and debuffs

# Get current stats from storage
execute store result score #level rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_level
execute store result score #xp rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_xp
execute store result score #cap rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_level_cap

# Calculate XP needed for display (from config)
# Formula: (level × base) + (level² × scaling)
execute store result score #base rituals.soul_temp run data get storage rituals:config soul_level_base
execute store result score #scaling rituals.soul_temp run data get storage rituals:config soul_level_scaling

scoreboard players operation #xp_needed rituals.soul_temp = #level rituals.soul_temp
scoreboard players operation #xp_needed rituals.soul_temp *= #base rituals.soul_temp

scoreboard players operation #level_sq rituals.soul_temp = #level rituals.soul_temp
scoreboard players operation #level_sq rituals.soul_temp *= #level rituals.soul_temp
scoreboard players operation #level_sq rituals.soul_temp *= #scaling rituals.soul_temp

scoreboard players operation #xp_needed rituals.soul_temp += #level_sq rituals.soul_temp

# Store values to storage for macro
execute store result storage rituals:temp lore_level int 1 run scoreboard players get #level rituals.soul_temp
execute store result storage rituals:temp lore_xp int 1 run scoreboard players get #xp rituals.soul_temp
execute store result storage rituals:temp lore_cap int 1 run scoreboard players get #cap rituals.soul_temp
execute store result storage rituals:temp lore_xp_needed int 1 run scoreboard players get #xp_needed rituals.soul_temp

# Build and apply full lore with all buffs/debuffs
function rituals:soul/lore/apply_full with storage rituals:temp

# Apply updated item back to display entity
execute as @e[type=item_display,tag=rituals.totem_display,distance=..3,limit=1] run data modify entity @s item set from storage rituals:temp item

