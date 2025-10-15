# Tier 4 farming - scan 11x13x11 box (h_range=5, v_range=6)
scoreboard players set #scan_x rituals.temp 0
scoreboard players set #max_x rituals.temp 10
scoreboard players set #scan_y rituals.temp 0
scoreboard players set #max_y rituals.temp 12
scoreboard players set #scan_z rituals.temp 0
scoreboard players set #max_z rituals.temp 10
execute positioned ~-5 ~-6 ~-5 run function rituals:ritual/effects/farming_scan_x

