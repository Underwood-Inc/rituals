# Set Soul XP interval to PUNISHING preset (18000 ticks = 15 minutes)
data modify storage rituals:config soul_xp_interval set value 18000
tellraw @s [{"text":"[Rituals] ","color":"gold"},{"text":"XP rate preset: ","color":"green"},{"text":"PUNISHING (15m)","color":"aqua","bold":true}]
scoreboard players set @a rituals.soul_timer 0
