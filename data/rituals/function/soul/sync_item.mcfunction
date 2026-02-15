# ========================================
# Totem Conduit — Channel Soul Energy into Weapon
# ========================================
# Called when a soul item is placed on a totem.
# The totem acts as a conduit: it channels the wielder's stored
# soul energy into the weapon, strengthening the bond.
# Runs as the item_display entity (@s)
# Player UUID in rituals:temp interacting_uuid (macro)

# === STEP 1: COPY ITEM TO STORAGE ===
data modify storage rituals:temp item set from entity @s item

# Get current stats to scoreboards for calculations
execute store result score #soul_current_xp rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_xp
execute store result score #soul_current_level rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_level
execute store result score #soul_level_cap rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_level_cap

# === STEP 2: CHANNEL PENDING SOUL ENERGY (if any) ===
scoreboard players set #did_level_up rituals.soul_temp 0
scoreboard players set #xp_applied rituals.soul_temp 0
scoreboard players set #xp_to_apply rituals.soul_temp 0
$execute if entity @a[nbt={UUID:$(interacting_uuid)},tag=rituals.soul_pending_sync] run function rituals:soul/apply_pending_xp with storage rituals:temp
scoreboard players operation #xp_applied rituals.soul_temp = #xp_to_apply rituals.soul_temp

# === STEP 3: CHECK FOR LEVEL UP ===
execute if score #xp_applied rituals.soul_temp matches 1.. run function rituals:soul/process_level_up

# === STEP 4: CHECK FOR ASCENSION READINESS ===
execute store result score #current_level rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_level
execute if score #current_level rituals.soul_temp = #soul_level_cap rituals.soul_temp run function rituals:soul/mark_ready_ascend

# === STEP 5: UPDATE LORE AND NAME ===
execute store result storage rituals:temp lore_level int 1 run data get storage rituals:temp item.components."minecraft:custom_data".soul_level
execute store result storage rituals:temp lore_cap int 1 run data get storage rituals:temp item.components."minecraft:custom_data".soul_level_cap
execute store result storage rituals:temp lore_xp int 1 run data get storage rituals:temp item.components."minecraft:custom_data".soul_xp

# Calculate XP needed for next level
scoreboard players operation #next_level rituals.soul_temp = #current_level rituals.soul_temp
scoreboard players add #next_level rituals.soul_temp 1
scoreboard players operation #xp_needed rituals.soul_temp = #next_level rituals.soul_temp
scoreboard players operation #xp_needed rituals.soul_temp *= #100 rituals.data
execute store result storage rituals:temp lore_xp_needed int 1 run scoreboard players get #xp_needed rituals.soul_temp

# Apply full lore update (includes name with colors)
function rituals:soul/lore/apply_full with storage rituals:temp

# === STEP 6: WRITE UPDATED ITEM BACK TO ENTITY ===
data modify entity @s item set from storage rituals:temp item

# === STEP 7: NOTIFY PLAYER ===
$execute if score #xp_applied rituals.soul_temp matches 1.. run tellraw @a[nbt={UUID:$(interacting_uuid)}] [{"text":"✦ ","color":"dark_purple"},{"text":"Soul synced! ","color":"light_purple"},{"text":"+","color":"green"},{"score":{"name":"#xp_applied","objective":"rituals.soul_temp"},"color":"green"},{"text":" XP applied.","color":"green"}]
$execute if score #xp_applied rituals.soul_temp matches 0 run tellraw @a[nbt={UUID:$(interacting_uuid)}] [{"text":"✦ ","color":"dark_purple"},{"text":"Soul weapon placed. No pending XP.","color":"gray"}]
