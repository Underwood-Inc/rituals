# Set Soul XP interval to TOUGH preset (6000 ticks = 5 minutes)
data modify storage rituals:config soul_xp_interval set value 6000
tellraw @s [{"text":"[Rituals] ","color":"gold"},{"text":"XP rate preset: ","color":"green"},{"text":"TOUGH (5m)","color":"aqua","bold":true}]
scoreboard players set @a rituals.soul_timer 0
