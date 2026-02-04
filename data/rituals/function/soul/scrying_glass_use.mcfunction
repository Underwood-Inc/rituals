# ========================================
# Scrying Glass - Use Handler
# ========================================
# Called when player looks through Scrying Glass (mainhand)
# Syncs soul weapon held in OFFHAND

# Cooldown check - prevent spam (1 second)
execute if score @s rituals.scrying_cd matches 1.. run return 0
scoreboard players set @s rituals.scrying_cd 20

# === Copy offhand item using item_display workaround (1.21.11 compatible) ===
data remove storage rituals:temp scrying_item

# Spawn temporary item_display to hold offhand item
summon item_display ~ ~ ~ {Tags:["rituals.temp_offhand"],item:{id:"minecraft:air",count:1}}

# Copy offhand to the item_display using item command (this works in 1.21!)
item replace entity @e[type=item_display,tag=rituals.temp_offhand,limit=1] contents from entity @s weapon.offhand

# Now read from the item_display entity into storage
data modify storage rituals:temp scrying_item set from entity @e[type=item_display,tag=rituals.temp_offhand,limit=1] item

# Kill the temporary entity
kill @e[type=item_display,tag=rituals.temp_offhand]

# Check if we got an item with soul_embodied
execute unless data storage rituals:temp scrying_item.components."minecraft:custom_data".soul_embodied run function rituals:soul/scrying_glass_no_weapon
execute unless data storage rituals:temp scrying_item.components."minecraft:custom_data".soul_embodied run return 0

# Check if they have pending XP to sync
execute unless entity @s[tag=rituals.soul_pending_sync] unless score @s rituals.soul_xp_gain matches 1.. run function rituals:soul/scrying_glass_no_pending
execute unless entity @s[tag=rituals.soul_pending_sync] unless score @s rituals.soul_xp_gain matches 1.. run return 0

# === PERFORM THE SYNC ===

# Get accumulated XP to sync
execute store result score #sync_xp rituals.soul_temp run scoreboard players get @s rituals.soul_xp_gain

# Item already in storage from detection above

# === STEP 2: GET AND UPDATE XP IN STORAGE ===
execute store result score #current_xp rituals.soul_temp run data get storage rituals:temp scrying_item.components."minecraft:custom_data".soul_xp
execute unless score #current_xp rituals.soul_temp matches 0.. run scoreboard players set #current_xp rituals.soul_temp 0

# Add synced XP
scoreboard players operation #current_xp rituals.soul_temp += #sync_xp rituals.soul_temp

# Store new XP back to storage
execute store result storage rituals:temp scrying_item.components."minecraft:custom_data".soul_xp int 1 run scoreboard players get #current_xp rituals.soul_temp

# Update total XP in storage
execute store result score #total_xp rituals.soul_temp run data get storage rituals:temp scrying_item.components."minecraft:custom_data".soul_xp_total
execute unless score #total_xp rituals.soul_temp matches 0.. run scoreboard players set #total_xp rituals.soul_temp 0
scoreboard players operation #total_xp rituals.soul_temp += #sync_xp rituals.soul_temp
execute store result storage rituals:temp scrying_item.components."minecraft:custom_data".soul_xp_total int 1 run scoreboard players get #total_xp rituals.soul_temp

# === STEP 3: CHECK FOR LEVEL UP ===
function rituals:soul/scrying_check_levelup_direct

# === STEP 4: UPDATE LORE ===
# CRITICAL: apply_full expects data in rituals:temp item, not scrying_item!
data modify storage rituals:temp item set from storage rituals:temp scrying_item

execute store result storage rituals:temp lore_level int 1 run data get storage rituals:temp item.components."minecraft:custom_data".soul_level
execute store result storage rituals:temp lore_cap int 1 run data get storage rituals:temp item.components."minecraft:custom_data".soul_level_cap
execute store result storage rituals:temp lore_xp int 1 run data get storage rituals:temp item.components."minecraft:custom_data".soul_xp

execute store result score #current_level rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_level
scoreboard players operation #next_level rituals.soul_temp = #current_level rituals.soul_temp
scoreboard players add #next_level rituals.soul_temp 1
scoreboard players operation #xp_needed rituals.soul_temp = #next_level rituals.soul_temp
scoreboard players operation #xp_needed rituals.soul_temp *= #100 rituals.data
execute store result storage rituals:temp lore_xp_needed int 1 run scoreboard players get #xp_needed rituals.soul_temp

function rituals:soul/lore/apply_full with storage rituals:temp

# Copy updated item back to scrying_item for return
data modify storage rituals:temp scrying_item set from storage rituals:temp item

# === STEP 5: REPLACE OFFHAND WITH UPDATED ITEM ===
# Clear offhand first
item replace entity @s weapon.offhand with air

# Spawn item entity with modified item - instant pickup
summon item ~ ~0.5 ~ {Tags:["rituals.scrying_return"],PickupDelay:0,Item:{id:"minecraft:stone",count:1}}
data modify entity @e[type=item,tag=rituals.scrying_return,limit=1] Item set from storage rituals:temp scrying_item
execute as @e[type=item,tag=rituals.scrying_return,limit=1] run tp @s @p
tag @e[type=item,tag=rituals.scrying_return] remove rituals.scrying_return

# === STEP 6: CLEAR SYNC FLAGS ===
tag @s remove rituals.soul_pending_sync
scoreboard players set @s rituals.soul_xp_gain 0

# === STEP 7: DECREMENT SCRYING GLASS USES ===
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
