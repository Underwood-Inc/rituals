# Scan box area for crops using tier-based range
# Called with macro parameters: neg_h, neg_v, box_h, box_v

# Use recursive X scanning starting from negative offset
scoreboard players operation #scan_x rituals.temp = #neg_h rituals.temp
scoreboard players operation #max_x rituals.temp = #current_h_range rituals.temp

function rituals:ritual/effects/growth_scan_x

