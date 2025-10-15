# Tier 3 farming - scan 9x11x9 box (h_range=4, v_range=5)
scoreboard players set #scan_x rituals.temp 0
scoreboard players set #max_x rituals.temp 8
scoreboard players set #scan_y rituals.temp 0
scoreboard players set #max_y rituals.temp 10
scoreboard players set #scan_z rituals.temp 0
scoreboard players set #max_z rituals.temp 8
execute positioned ~-4 ~-5 ~-4 run function rituals:ritual/effects/farming_scan_x

