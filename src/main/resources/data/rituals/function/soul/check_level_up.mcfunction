# ========================================
# Check for Level Up
# ========================================
# Runs when XP is gained - checks if sync is needed
# Only notifies occasionally, not on every XP gain

# Mark player as having pending sync
tag @s add rituals.soul_pending_sync

# Only show notification once per 30 seconds (600 ticks)
# Use a cooldown score
execute unless score @s rituals.soul_notify_cd matches 1.. run title @s actionbar [{"text":"✦ ","color":"dark_purple"},{"text":"Soul XP gained! ","color":"light_purple"},{"text":"Place on totem to sync.","color":"gray"}]
execute unless score @s rituals.soul_notify_cd matches 1.. run playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 0.3 1.8
execute unless score @s rituals.soul_notify_cd matches 1.. run scoreboard players set @s rituals.soul_notify_cd 600
