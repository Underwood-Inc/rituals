# Set Soul XP interval to HARD preset (3600 ticks = 3 minutes) — default
data modify storage rituals:config soul_xp_interval set value 3600
tellraw @s [{"text":"[Rituals] ","color":"gold"},{"text":"XP rate preset: ","color":"green"},{"text":"HARD (3m)","color":"aqua","bold":true},{"text":" (default)","color":"gray"}]
scoreboard players set @a rituals.soul_timer 0
