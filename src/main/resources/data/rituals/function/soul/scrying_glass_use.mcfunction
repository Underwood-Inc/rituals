# ========================================
# Scrying Glass - Use Handler
# ========================================
# Called when player looks through Scrying Glass
# Syncs soul weapon if holding one in offhand

# Cooldown check - prevent spam (1 second)
execute if score @s rituals.scrying_cd matches 1.. run return 0
scoreboard players set @s rituals.scrying_cd 20

# Check if player has a soul weapon in offhand
execute unless data entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".soul_embodied run function rituals:soul/scrying_glass_no_weapon
execute unless data entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".soul_embodied run return 0

# Check if they have pending XP to sync
execute unless entity @s[tag=rituals.soul_pending_sync] unless score @s rituals.soul_xp_gain matches 1.. run function rituals:soul/scrying_glass_no_pending
execute unless entity @s[tag=rituals.soul_pending_sync] unless score @s rituals.soul_xp_gain matches 1.. run return 0

# === PERFORM THE SYNC ===

# Get accumulated XP
execute store result score #sync_xp rituals.soul_temp run scoreboard players get @s rituals.soul_xp_gain

# Get current XP from offhand item
execute store result score #current_xp rituals.soul_temp run data get entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".soul_xp

# Add synced XP
scoreboard players operation #current_xp rituals.soul_temp += #sync_xp rituals.soul_temp

# Apply new XP directly to offhand item
execute store result entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".soul_xp int 1 run scoreboard players get #current_xp rituals.soul_temp

# Update total XP
execute store result score #total_xp rituals.soul_temp run data get entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".soul_xp_total
scoreboard players operation #total_xp rituals.soul_temp += #sync_xp rituals.soul_temp
execute store result entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".soul_xp_total int 1 run scoreboard players get #total_xp rituals.soul_temp

# Check for level up
function rituals:soul/scrying_check_levelup_direct

# Clear sync flags
tag @s remove rituals.soul_pending_sync
scoreboard players set @s rituals.soul_xp_gain 0

# === DECREMENT SCRYING GLASS USES ===
function rituals:soul/scrying_use_charge

# Visual effects
particle minecraft:enchant ~ ~1 ~ 0.5 0.5 0.5 1 50
particle minecraft:reverse_portal ~ ~1.5 ~ 0.3 0.3 0.3 0.1 30
particle minecraft:soul ~ ~1 ~ 0.2 0.3 0.2 0.02 15

# Sound
playsound minecraft:block.enchantment_table.use player @s ~ ~ ~ 1.0 1.2
playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.8 1.5

# Feedback
tellraw @s [{"text":"✦ ","color":"dark_purple"},{"text":"The Scrying Glass shimmers...","color":"light_purple","italic":true}]
tellraw @s [{"text":"  Soul synced! ","color":"green"},{"text":"+","color":"yellow"},{"score":{"name":"#sync_xp","objective":"rituals.soul_temp"},"color":"yellow"},{"text":" XP applied.","color":"gray"}]
