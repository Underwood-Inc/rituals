# ========================================
# Inline Level Up - Immediate
# ========================================
# Called from award_xp.mcfunction when XP >= threshold
# Operates on scores already set by award_xp:
#   #current_xp, #current_level, #level_cap, #xp_needed

# === SUBTRACT XP THRESHOLD (carry over remainder) ===
scoreboard players operation #current_xp rituals.soul_temp -= #xp_needed rituals.soul_temp

# === INCREMENT LEVEL ===
scoreboard players add #current_level rituals.soul_temp 1

# === CHECK IF HIT LEVEL CAP ===
execute if score #current_level rituals.soul_temp >= #level_cap rituals.soul_temp run scoreboard players operation #current_level rituals.soul_temp = #level_cap rituals.soul_temp
execute if score #current_level rituals.soul_temp >= #level_cap rituals.soul_temp run scoreboard players set #current_xp rituals.soul_temp 0

# === RECALCULATE XP NEEDED (for display and next check) ===
scoreboard players operation #xp_needed rituals.soul_temp = #current_level rituals.soul_temp
scoreboard players add #xp_needed rituals.soul_temp 1
scoreboard players operation #xp_needed rituals.soul_temp *= #100 rituals.data

# === LEVEL UP FEEDBACK ===
title @s title [{"text":"","color":"dark_purple"},{"text":"LEVEL UP!","color":"gold","bold":true}]
title @s subtitle [{"text":"Soul Level ","color":"gray"},{"score":{"name":"#current_level","objective":"rituals.soul_temp"},"color":"light_purple","bold":true}]
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.0 1.2
playsound minecraft:block.beacon.activate player @s ~ ~ ~ 0.5 2.0
particle minecraft:totem_of_undying ~ ~1 ~ 0.5 1.0 0.5 0.3 50

# Notify chat
tellraw @a[distance=..32] [{"text":"✦ ","color":"dark_purple"},{"selector":"@s","color":"white"},{"text":"'s soul weapon reached ","color":"gray"},{"text":"Level ","color":"light_purple"},{"score":{"name":"#current_level","objective":"rituals.soul_temp"},"color":"gold","bold":true},{"text":"!","color":"gray"}]

# === CHECK FOR ANOTHER LEVEL UP (recursive, handles multi-level jumps) ===
execute if score #current_level rituals.soul_temp < #level_cap rituals.soul_temp if score #current_xp rituals.soul_temp >= #xp_needed rituals.soul_temp run function rituals:soul/inline_level_up
