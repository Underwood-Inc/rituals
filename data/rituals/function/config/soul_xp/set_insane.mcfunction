# Set Soul XP interval to INSANE preset (36000 ticks = 30 minutes)
data modify storage rituals:config soul_xp_interval set value 36000
tellraw @s [{"text":"[Rituals] ","color":"gold"},{"text":"XP rate preset: ","color":"green"},{"text":"INSANE (30m)","color":"aqua","bold":true}]
scoreboard players set @a rituals.soul_timer 0
