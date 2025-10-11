# Recursive Y scanning
# Start Z scan at this Y position
scoreboard players operation #scan_z rituals.temp = #neg_h rituals.temp
scoreboard players operation #max_z rituals.temp = #current_h_range rituals.temp
function rituals:ritual/effects/growth_scan_z

# Increment Y and continue if not done
scoreboard players add #scan_y rituals.temp 1
execute if score #scan_y rituals.temp <= #max_y rituals.temp positioned ~ ~1 ~ run function rituals:ritual/effects/growth_scan_y

