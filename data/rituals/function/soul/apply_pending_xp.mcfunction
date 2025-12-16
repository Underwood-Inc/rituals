# ========================================
# Apply Pending XP to Soul Item
# ========================================
# Modifies the item in storage rituals:temp item
# Runs as player with pending XP sync

# Get current XP from storage
execute store result score #item_xp rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_xp

# Add 100 XP per sync event (simplified - real implementation would track actual usage)
scoreboard players add #item_xp rituals.soul_temp 100
scoreboard players set #xp_applied rituals.soul_temp 100

# Apply back to storage
data modify storage rituals:temp item.components."minecraft:custom_data".soul_xp set value 0
execute store result storage rituals:temp item.components."minecraft:custom_data".soul_xp int 1 run scoreboard players get #item_xp rituals.soul_temp

# Also update total XP
execute store result score #total_xp rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_xp_total
scoreboard players add #total_xp rituals.soul_temp 100
execute store result storage rituals:temp item.components."minecraft:custom_data".soul_xp_total int 1 run scoreboard players get #total_xp rituals.soul_temp

# Remove pending sync tag from player
tag @s remove rituals.soul_pending_sync

