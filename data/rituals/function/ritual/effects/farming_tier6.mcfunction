# Tier 6 farming - scan 15x17x15 box (h_range=7, v_range=8)
scoreboard players set #scan_x rituals.temp 0
scoreboard players set #max_x rituals.temp 14
scoreboard players set #scan_y rituals.temp 0
scoreboard players set #max_y rituals.temp 16
scoreboard players set #scan_z rituals.temp 0
scoreboard players set #max_z rituals.temp 14
execute positioned ~-7 ~-8 ~-7 run function rituals:ritual/effects/farming_scan_x

