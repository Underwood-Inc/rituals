# ========================================
# Set Soul XP Interval (Datapack-Only)
# ========================================
# For server admins without ModMenu.
#
# USAGE (pick one — run as OP from chat or console):
#
#   Presets:
#     /function rituals:config/soul_xp/set_easy
#     /function rituals:config/soul_xp/set_medium
#     /function rituals:config/soul_xp/set_hard
#
#   Custom (two steps):
#     /data modify storage rituals:config soul_xp_interval set value <TICKS>
#     /function rituals:config/soul_xp/set_interval
#
#   Examples:
#     /data modify storage rituals:config soul_xp_interval set value 100
#     /function rituals:config/soul_xp/set_interval
#
# 20 ticks = 1 second. Minimum recommended: 20.
# ========================================

# Read the current interval and display it
execute store result score #xp_seconds rituals.soul_temp run data get storage rituals:config soul_xp_interval
scoreboard players operation #xp_display rituals.soul_temp = #xp_seconds rituals.soul_temp
scoreboard players operation #xp_seconds rituals.soul_temp /= #20 rituals.data
scoreboard players operation #xp_minutes rituals.soul_temp = #xp_seconds rituals.soul_temp
scoreboard players operation #xp_minutes rituals.soul_temp /= #60 rituals.data
scoreboard players operation #xp_rem_sec rituals.soul_temp = #xp_seconds rituals.soul_temp
scoreboard players operation #xp_rem_sec rituals.soul_temp %= #60 rituals.data

execute if score #xp_seconds rituals.soul_temp matches 60.. run tellraw @s [{"text":"[Rituals] ","color":"gold"},{"text":"Soul XP interval set to ","color":"green"},{"score":{"name":"#xp_display","objective":"rituals.soul_temp"},"color":"aqua","bold":true},{"text":" ticks (","color":"green"},{"score":{"name":"#xp_minutes","objective":"rituals.soul_temp"},"color":"aqua","bold":true},{"text":"m ","color":"green"},{"score":{"name":"#xp_rem_sec","objective":"rituals.soul_temp"},"color":"aqua","bold":true},{"text":"s)","color":"green"}]
execute unless score #xp_seconds rituals.soul_temp matches 60.. run tellraw @s [{"text":"[Rituals] ","color":"gold"},{"text":"Soul XP interval set to ","color":"green"},{"score":{"name":"#xp_display","objective":"rituals.soul_temp"},"color":"aqua","bold":true},{"text":" ticks (","color":"green"},{"score":{"name":"#xp_seconds","objective":"rituals.soul_temp"},"color":"aqua","bold":true},{"text":"s)","color":"green"}]

# Reset all player timers so the new interval takes effect cleanly
scoreboard players set @a rituals.soul_timer 0
tellraw @s [{"text":"[Rituals] ","color":"gold"},{"text":"All player XP timers reset.","color":"yellow"}]
