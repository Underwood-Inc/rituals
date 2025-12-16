# ========================================
# Scrying Glass - Do Level Up (Direct)
# ========================================
# Processes level up, modifies offhand item directly

# Subtract XP cost
scoreboard players operation #current_xp rituals.soul_temp -= #xp_needed rituals.soul_temp

# Increase level
scoreboard players add #current_level rituals.soul_temp 1

# Store back to offhand item
execute store result entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".soul_xp int 1 run scoreboard players get #current_xp rituals.soul_temp
execute store result entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".soul_level int 1 run scoreboard players get #current_level rituals.soul_temp

# Announcement
tellraw @s [{"text":"  ","color":"gray"},{"text":"⚡ LEVEL UP! ","color":"gold","bold":true},{"text":"Now Level ","color":"light_purple"},{"score":{"name":"#current_level","objective":"rituals.soul_temp"},"color":"yellow","bold":true}]

# Effects
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 0.8 1.2
particle minecraft:totem_of_undying ~ ~1 ~ 0.3 0.5 0.3 0.1 20

# Roll for buff - copy item to storage first for buff system
data modify storage rituals:temp item set from entity @s Inventory[{Slot:-106b}]
function rituals:soul/buffs/roll_on_levelup

# Update lore with all buffs/debuffs
execute store result score #cap rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_level_cap
scoreboard players operation #xp_needed rituals.soul_temp = #current_level rituals.soul_temp
scoreboard players operation #xp_needed rituals.soul_temp *= #10 rituals.data
execute store result storage rituals:temp lore_level int 1 run scoreboard players get #current_level rituals.soul_temp
execute store result storage rituals:temp lore_xp int 1 run scoreboard players get #current_xp rituals.soul_temp
execute store result storage rituals:temp lore_cap int 1 run scoreboard players get #cap rituals.soul_temp
execute store result storage rituals:temp lore_xp_needed int 1 run scoreboard players get #xp_needed rituals.soul_temp
function rituals:soul/lore/apply_full with storage rituals:temp

# Apply any buff changes back to offhand
data modify entity @s Inventory[{Slot:-106b}] set from storage rituals:temp item

# Check for more level ups
execute if score #current_xp rituals.soul_temp >= #xp_needed rituals.soul_temp if score #current_level rituals.soul_temp < #level_cap rituals.soul_temp run function rituals:soul/scrying_do_levelup_direct

