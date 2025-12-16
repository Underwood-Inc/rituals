# ========================================
# Sync Soul Weapon Progress from Totem
# ========================================
# Called when a player with pending sync places a soul weapon on a totem
# Runs AS the player, totem is in context

# Get the accumulated XP from player's score
execute store result score #sync_xp rituals.soul_temp run scoreboard players get @s rituals.soul_xp_gain

# Find the totem display entity and apply XP
# The item was just placed, so use storage
execute store result score #current_xp rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_xp

# Add synced XP
scoreboard players operation #current_xp rituals.soul_temp += #sync_xp rituals.soul_temp

# Store back to item in storage
execute store result storage rituals:temp item.components."minecraft:custom_data".soul_xp int 1 run scoreboard players get #current_xp rituals.soul_temp

# Also update total XP
execute store result score #total_xp rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_xp_total
scoreboard players operation #total_xp rituals.soul_temp += #sync_xp rituals.soul_temp
execute store result storage rituals:temp item.components."minecraft:custom_data".soul_xp_total int 1 run scoreboard players get #total_xp rituals.soul_temp

# Update the item on the totem display entity with the modified data
execute as @e[type=item_display,tag=rituals.totem_display,distance=..3,limit=1] run data modify entity @s item set from storage rituals:temp item

# Check for level up
function rituals:soul/check_totem_level_up

# Clear sync flags
tag @s remove rituals.soul_pending_sync
scoreboard players set @s rituals.soul_xp_gain 0

# Feedback
execute if score #sync_xp rituals.soul_temp matches 1.. run tellraw @s [{"text":"✦ ","color":"dark_purple"},{"text":"Soul synced! ","color":"light_purple"},{"text":"+","color":"green"},{"score":{"name":"#sync_xp","objective":"rituals.soul_temp"},"color":"green"},{"text":" XP applied.","color":"gray"}]
execute if score #sync_xp rituals.soul_temp matches 0 run tellraw @s [{"text":"✦ ","color":"dark_purple"},{"text":"Soul weapon placed. No pending XP.","color":"gray"}]

playsound minecraft:block.enchantment_table.use player @s ~ ~ ~ 0.5 1.5
particle minecraft:enchant ~ ~2 ~ 0.3 0.5 0.3 1 30

