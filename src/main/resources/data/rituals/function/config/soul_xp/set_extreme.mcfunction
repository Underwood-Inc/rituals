# Set Soul XP interval to EXTREME preset (24000 ticks = 20 minutes)
data modify storage rituals:config soul_xp_interval set value 24000
tellraw @s [{"text":"[Rituals] ","color":"gold"},{"text":"XP rate preset: ","color":"green"},{"text":"EXTREME (20m)","color":"aqua","bold":true}]
scoreboard players set @a rituals.soul_timer 0
