# Recursive X scanning
# Start Y scan at this X position
scoreboard players set #scan_y rituals.temp 0
function rituals:ritual/effects/farming_scan_y

# Increment X and continue if not done
scoreboard players add #scan_x rituals.temp 1
execute if score #scan_x rituals.temp <= #max_x rituals.temp positioned ~1 ~ ~ run function rituals:ritual/effects/farming_scan_x

