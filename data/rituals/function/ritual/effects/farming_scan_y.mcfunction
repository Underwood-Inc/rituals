# Recursive Y scanning
# Start Z scan at this Y position
scoreboard players set #scan_z rituals.temp 0
function rituals:ritual/effects/farming_scan_z

# Increment Y and continue if not done
scoreboard players add #scan_y rituals.temp 1
execute if score #scan_y rituals.temp <= #max_y rituals.temp positioned ~ ~1 ~ run function rituals:ritual/effects/farming_scan_y

