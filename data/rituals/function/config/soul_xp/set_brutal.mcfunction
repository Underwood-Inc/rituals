# Set Soul XP interval to BRUTAL preset (12000 ticks = 10 minutes)
data modify storage rituals:config soul_xp_interval set value 12000
tellraw @s [{"text":"[Rituals] ","color":"gold"},{"text":"XP rate preset: ","color":"green"},{"text":"BRUTAL (10m)","color":"aqua","bold":true}]
scoreboard players set @a rituals.soul_timer 0
