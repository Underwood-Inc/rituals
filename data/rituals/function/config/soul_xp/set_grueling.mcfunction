# Set Soul XP interval to GRUELING preset (9600 ticks = 8 minutes)
data modify storage rituals:config soul_xp_interval set value 9600
tellraw @s [{"text":"[Rituals] ","color":"gold"},{"text":"XP rate preset: ","color":"green"},{"text":"GRUELING (8m)","color":"aqua","bold":true}]
scoreboard players set @a rituals.soul_timer 0
