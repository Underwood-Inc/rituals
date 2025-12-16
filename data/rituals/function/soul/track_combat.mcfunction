# ========================================
# Track Combat Kills - Unified XP System
# ========================================
# Tracks ALL mob kills regardless of weapon type

# === SUM ALL KILLS ===
scoreboard players set #kills rituals.soul_temp 0

# Get total mob kills from vanilla stat
execute store result score #kills rituals.soul_temp run scoreboard players get @s rituals.mob_kills

# === CALCULATE KILL DELTA ===
execute unless score @s rituals.prev_kills matches -2147483648.. run scoreboard players set @s rituals.prev_kills 0

scoreboard players operation #kill_gain rituals.soul_temp = #kills rituals.soul_temp
scoreboard players operation #kill_gain rituals.soul_temp -= @s rituals.prev_kills

# Each kill = 5 XP base
scoreboard players operation #kill_gain rituals.soul_temp *= #5 rituals.data

# === SHOW POPUP IF KILLS ===
execute if score #kill_gain rituals.soul_temp matches 1.. run title @s actionbar [{"text":"✦ +","color":"light_purple"},{"score":{"name":"#kill_gain","objective":"rituals.soul_temp"},"color":"red"},{"text":" Soul XP (kill)","color":"gray"}]

# === AWARD XP IF ANY ===
execute if score #kill_gain rituals.soul_temp matches 1.. run scoreboard players operation #xp_gain rituals.soul_temp = #kill_gain rituals.soul_temp
execute if score #kill_gain rituals.soul_temp matches 1.. run function rituals:soul/award_xp

# Update previous count
execute store result score @s rituals.prev_kills run scoreboard players get @s rituals.mob_kills

