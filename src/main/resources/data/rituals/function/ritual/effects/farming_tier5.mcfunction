# Tier 5 farming - scan 13x15x13 box (h_range=6, v_range=7)
scoreboard players set #scan_x rituals.temp 0
scoreboard players set #max_x rituals.temp 12
scoreboard players set #scan_y rituals.temp 0
scoreboard players set #max_y rituals.temp 14
scoreboard players set #scan_z rituals.temp 0
scoreboard players set #max_z rituals.temp 12
execute positioned ~-6 ~-7 ~-6 run function rituals:ritual/effects/farming_scan_x

