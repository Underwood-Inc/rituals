# Set Soul XP interval to TRIVIAL preset (200 ticks = 10 seconds)
data modify storage rituals:config soul_xp_interval set value 200
tellraw @s [{"text":"[Rituals] ","color":"gold"},{"text":"XP rate preset: ","color":"green"},{"text":"TRIVIAL (10s)","color":"aqua","bold":true}]
scoreboard players set @a rituals.soul_timer 0
