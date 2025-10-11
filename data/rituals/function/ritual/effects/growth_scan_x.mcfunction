# Recursive X scanning
# Start Y scan at this X position
scoreboard players operation #scan_y rituals.temp = #neg_v rituals.temp
scoreboard players operation #max_y rituals.temp = #current_v_range rituals.temp
function rituals:ritual/effects/growth_scan_y

# Increment X and continue if not done
scoreboard players add #scan_x rituals.temp 1
execute if score #scan_x rituals.temp <= #max_x rituals.temp positioned ~1 ~ ~ run function rituals:ritual/effects/growth_scan_x

