# ========================================
# Scrying Glass - Do Level Up (Storage)
# ========================================
# Processes level up, modifies storage item (not entity!)

# Subtract XP cost
scoreboard players operation #current_xp rituals.soul_temp -= #xp_needed rituals.soul_temp

# Increase level
scoreboard players add #current_level rituals.soul_temp 1

# Store back to STORAGE item
execute store result storage rituals:temp scrying_item.components."minecraft:custom_data".soul_xp int 1 run scoreboard players get #current_xp rituals.soul_temp
execute store result storage rituals:temp scrying_item.components."minecraft:custom_data".soul_level int 1 run scoreboard players get #current_level rituals.soul_temp

# Announcement
tellraw @s [{"text":"  ","color":"gray"},{"text":"⚡ LEVEL UP! ","color":"gold","bold":true},{"text":"Now Level ","color":"light_purple"},{"score":{"name":"#current_level","objective":"rituals.soul_temp"},"color":"yellow","bold":true}]

# Effects
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 0.8 1.2
particle minecraft:totem_of_undying ~ ~1 ~ 0.3 0.5 0.3 0.1 20

# Roll for buff - item is already in storage under scrying_item, copy to temp.item for buff system
data modify storage rituals:temp item set from storage rituals:temp scrying_item
function rituals:soul/buffs/roll_on_levelup
# Copy buff changes back to scrying_item
data modify storage rituals:temp scrying_item set from storage rituals:temp item

# Update lore with all buffs/debuffs
execute store result score #cap rituals.soul_temp run data get storage rituals:temp scrying_item.components."minecraft:custom_data".soul_level_cap
scoreboard players operation #xp_needed rituals.soul_temp = #current_level rituals.soul_temp
scoreboard players add #xp_needed rituals.soul_temp 1
scoreboard players operation #xp_needed rituals.soul_temp *= #100 rituals.data
execute store result storage rituals:temp lore_level int 1 run scoreboard players get #current_level rituals.soul_temp
execute store result storage rituals:temp lore_xp int 1 run scoreboard players get #current_xp rituals.soul_temp
execute store result storage rituals:temp lore_cap int 1 run scoreboard players get #cap rituals.soul_temp
execute store result storage rituals:temp lore_xp_needed int 1 run scoreboard players get #xp_needed rituals.soul_temp

# Apply lore to storage item
data modify storage rituals:temp item set from storage rituals:temp scrying_item
function rituals:soul/lore/apply_full with storage rituals:temp
data modify storage rituals:temp scrying_item set from storage rituals:temp item

# Check for more level ups (recalculate XP needed for next level)
scoreboard players operation #next_level rituals.soul_temp = #current_level rituals.soul_temp
scoreboard players add #next_level rituals.soul_temp 1
scoreboard players operation #xp_needed rituals.soul_temp = #next_level rituals.soul_temp
scoreboard players operation #xp_needed rituals.soul_temp *= #100 rituals.data
execute if score #current_xp rituals.soul_temp >= #xp_needed rituals.soul_temp if score #current_level rituals.soul_temp < #level_cap rituals.soul_temp run function rituals:soul/scrying_do_levelup_storage

