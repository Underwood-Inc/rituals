# Set Soul XP interval to STANDARD preset (2400 ticks = 2 minutes)
data modify storage rituals:config soul_xp_interval set value 2400
tellraw @s [{"text":"[Rituals] ","color":"gold"},{"text":"XP rate preset: ","color":"green"},{"text":"STANDARD (2m)","color":"aqua","bold":true}]
scoreboard players set @a rituals.soul_timer 0
