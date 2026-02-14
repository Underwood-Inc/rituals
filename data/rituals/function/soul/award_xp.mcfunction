# ========================================
# Award XP to Soul Weapon
# ========================================
# Runs as player holding soul weapon
# #xp_gain rituals.soul_temp contains the XP amount to add
# Accumulates XP in scoreboard, syncs to item on totem placement

# Add to player's pending XP
scoreboard players operation @s rituals.soul_xp_gain += #xp_gain rituals.soul_temp

# Mark player as needing sync
tag @s add rituals.soul_pending_sync

# Show feedback with actual XP amount (cooldown from config)
execute unless score @s rituals.soul_notify_cd matches 1.. run title @s actionbar [{"text":"✦ +","color":"light_purple"},{"score":{"name":"#xp_gain","objective":"rituals.soul_temp"},"color":"aqua"},{"text":" Soul XP (","color":"gray"},{"score":{"name":"@s","objective":"rituals.soul_xp_gain"},"color":"green"},{"text":" pending)","color":"gray"}]
execute unless score @s rituals.soul_notify_cd matches 1.. run playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 0.3 1.8
execute unless score @s rituals.soul_notify_cd matches 1.. store result score @s rituals.soul_notify_cd run data get storage rituals:config soul_notify_cooldown
