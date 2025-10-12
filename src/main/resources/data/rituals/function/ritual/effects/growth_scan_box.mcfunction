# Scan box area for crops using tier-based range
# Called with macro parameters: neg_h, neg_v, box_h, box_v

# Set up counters for recursive scanning (scan from 0 to box size)
scoreboard players set #scan_x rituals.temp 0
scoreboard players operation #max_x rituals.temp = #box_h rituals.temp

scoreboard players set #scan_y rituals.temp 0
scoreboard players operation #max_y rituals.temp = #box_v rituals.temp

scoreboard players set #scan_z rituals.temp 0
scoreboard players operation #max_z rituals.temp = #box_h rituals.temp

# Position to starting corner and start scanning
$execute positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run function rituals:ritual/effects/growth_scan_x

