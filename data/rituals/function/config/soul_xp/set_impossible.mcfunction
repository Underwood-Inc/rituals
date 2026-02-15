# Set Soul XP interval to IMPOSSIBLE preset (72000 ticks = 60 minutes)
data modify storage rituals:config soul_xp_interval set value 72000
tellraw @s [{"text":"[Rituals] ","color":"gold"},{"text":"XP rate preset: ","color":"green"},{"text":"IMPOSSIBLE (60m)","color":"aqua","bold":true}]
scoreboard players set @a rituals.soul_timer 0
