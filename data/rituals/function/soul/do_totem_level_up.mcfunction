# ========================================
# Do Level Up on Totem
# ========================================
# Increases level and subtracts XP cost

# Subtract XP cost
scoreboard players operation #current_xp rituals.soul_temp -= #xp_needed rituals.soul_temp

# Increase level
scoreboard players add #current_level rituals.soul_temp 1

# Store back to item storage
execute store result storage rituals:temp item.components."minecraft:custom_data".soul_xp int 1 run scoreboard players get #current_xp rituals.soul_temp
execute store result storage rituals:temp item.components."minecraft:custom_data".soul_level int 1 run scoreboard players get #current_level rituals.soul_temp

# Feedback
tellraw @a[distance=..10] [{"text":"✦ ","color":"dark_purple"},{"text":"LEVEL UP! ","color":"gold","bold":true},{"text":"Soul weapon is now ","color":"light_purple","bold":false},{"text":"Level ","color":"gray"},{"score":{"name":"#current_level","objective":"rituals.soul_temp"},"color":"yellow","bold":true}]

# Epic effects
playsound minecraft:entity.player.levelup player @a[distance=..10] ~ ~ ~ 1.0 1.0
playsound minecraft:block.beacon.power_select player @a[distance=..10] ~ ~ ~ 0.5 1.5
particle minecraft:totem_of_undying ~ ~2 ~ 0.5 1 0.5 0.2 50
particle minecraft:soul_fire_flame ~ ~2 ~ 0.3 0.5 0.3 0.05 30

# === ROLL FOR NEW BUFF/DEBUFF ===
function rituals:soul/buffs/roll_on_levelup

# === UPDATE LORE WITH ALL BUFFS/DEBUFFS ===
execute store result score #cap rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_level_cap
scoreboard players operation #xp_needed rituals.soul_temp = #current_level rituals.soul_temp
scoreboard players operation #xp_needed rituals.soul_temp *= #10 rituals.data
execute store result storage rituals:temp lore_level int 1 run scoreboard players get #current_level rituals.soul_temp
execute store result storage rituals:temp lore_xp int 1 run scoreboard players get #current_xp rituals.soul_temp
execute store result storage rituals:temp lore_cap int 1 run scoreboard players get #cap rituals.soul_temp
execute store result storage rituals:temp lore_xp_needed int 1 run scoreboard players get #xp_needed rituals.soul_temp
function rituals:soul/lore/apply_full with storage rituals:temp

# Apply updated item to display entity
execute as @e[type=item_display,tag=rituals.totem_display,distance=..3,limit=1] run data modify entity @s item set from storage rituals:temp item

# Check for more levels (if lots of XP accumulated)
execute if score #current_xp rituals.soul_temp >= #xp_needed rituals.soul_temp if score #current_level rituals.soul_temp < #level_cap rituals.soul_temp run function rituals:soul/do_totem_level_up

# Check if hit level cap
execute if score #current_level rituals.soul_temp >= #level_cap rituals.soul_temp run tellraw @a[distance=..10] [{"text":"✦ ","color":"dark_purple"},{"text":"MAX LEVEL! ","color":"red","bold":true},{"text":"Perform the ritual again to ascend!","color":"light_purple","bold":false}]

