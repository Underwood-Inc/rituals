# Set Soul XP interval to NIGHTMARE preset (54000 ticks = 45 minutes)
data modify storage rituals:config soul_xp_interval set value 54000
tellraw @s [{"text":"[Rituals] ","color":"gold"},{"text":"XP rate preset: ","color":"green"},{"text":"NIGHTMARE (45m)","color":"aqua","bold":true}]
scoreboard players set @a rituals.soul_timer 0
