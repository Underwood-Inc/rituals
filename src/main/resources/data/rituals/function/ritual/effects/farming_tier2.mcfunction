# Tier 2 farming - scan 7x9x7 box (h_range=3, v_range=4)
scoreboard players set #scan_x rituals.temp 0
scoreboard players set #max_x rituals.temp 6
scoreboard players set #scan_y rituals.temp 0
scoreboard players set #max_y rituals.temp 8
scoreboard players set #scan_z rituals.temp 0
scoreboard players set #max_z rituals.temp 6
execute positioned ~-3 ~-4 ~-3 run function rituals:ritual/effects/farming_scan_x

