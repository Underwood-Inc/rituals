# Set Soul XP interval to EASY preset (600 ticks = 30 seconds)
data modify storage rituals:config soul_xp_interval set value 600
tellraw @s [{"text":"[Rituals] ","color":"gold"},{"text":"XP rate preset: ","color":"green"},{"text":"EASY (30s)","color":"aqua","bold":true}]
scoreboard players set @a rituals.soul_timer 0
