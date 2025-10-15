# Tier 1 farming - scan 5x7x5 box (h_range=2, v_range=3)
tellraw @a[distance=..10] [{"text":"[DEBUG FARM] Scanning tier 1 area (5x7x5)","color":"aqua"}]

# Set up counters for recursive scanning
scoreboard players set #scan_x rituals.temp 0
scoreboard players set #max_x rituals.temp 4

scoreboard players set #scan_y rituals.temp 0
scoreboard players set #max_y rituals.temp 6

scoreboard players set #scan_z rituals.temp 0
scoreboard players set #max_z rituals.temp 4

# Position to starting corner (-2, -3, -2) and start scanning
execute positioned ~-2 ~-3 ~-2 run function rituals:ritual/effects/farming_scan_x

