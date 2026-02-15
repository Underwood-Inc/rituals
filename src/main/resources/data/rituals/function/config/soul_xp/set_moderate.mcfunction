# Set Soul XP interval to MODERATE preset (1200 ticks = 1 minute)
data modify storage rituals:config soul_xp_interval set value 1200
tellraw @s [{"text":"[Rituals] ","color":"gold"},{"text":"XP rate preset: ","color":"green"},{"text":"MODERATE (1m)","color":"aqua","bold":true}]
scoreboard players set @a rituals.soul_timer 0
