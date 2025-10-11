# Recursive Z scanning
# Check block at this position and apply growth
execute if block ~ ~ ~ #minecraft:crops if predicate rituals:random_10_percent run function rituals:ritual/effects/apply_growth_here

# Increment Z and continue if not done
scoreboard players add #scan_z rituals.temp 1
execute if score #scan_z rituals.temp <= #max_z rituals.temp positioned ~ ~ ~1 run function rituals:ritual/effects/growth_scan_z

