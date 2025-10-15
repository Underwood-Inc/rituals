# Recursive Z scanning
# Check block at this position for fully grown crops

# Check for fully grown crops (age=7 for most crops)
execute if block ~ ~ ~ wheat[age=7] run function rituals:ritual/effects/harvest_wheat
execute if block ~ ~ ~ carrots[age=7] run function rituals:ritual/effects/harvest_carrot
execute if block ~ ~ ~ potatoes[age=7] run function rituals:ritual/effects/harvest_potato
execute if block ~ ~ ~ beetroots[age=3] run function rituals:ritual/effects/harvest_beetroot
execute if block ~ ~ ~ nether_wart[age=3] run function rituals:ritual/effects/harvest_nether_wart

# Fully grown stem crops
execute if block ~ ~ ~ pumpkin_stem[age=7] run function rituals:ritual/effects/harvest_pumpkin
execute if block ~ ~ ~ melon_stem[age=7] run function rituals:ritual/effects/harvest_melon

# Berry bushes (age 3 is fully grown with berries)
execute if block ~ ~ ~ sweet_berry_bush[age=3] run function rituals:ritual/effects/harvest_berry_bush

# Cocoa (age 2 is fully grown)
execute if block ~ ~ ~ cocoa[age=2] run function rituals:ritual/effects/harvest_cocoa

# Increment Z and continue if not done
scoreboard players add #scan_z rituals.temp 1
execute if score #scan_z rituals.temp <= #max_z rituals.temp positioned ~ ~ ~1 run function rituals:ritual/effects/farming_scan_z

