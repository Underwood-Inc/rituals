# Check if totem is receiving redstone power
# Use a temporary tag for detection to avoid interference from other mods
tag @s remove rituals.redstone_check

# Check for redstone blocks (adjacent and 2 blocks down)
execute if block ~ ~-1 ~ redstone_block run tag @s add rituals.redstone_check
execute if block ~ ~-2 ~ redstone_block run tag @s add rituals.redstone_check
execute if block ~1 ~ ~ redstone_block run tag @s add rituals.redstone_check
execute if block ~-1 ~ ~ redstone_block run tag @s add rituals.redstone_check
execute if block ~ ~ ~1 redstone_block run tag @s add rituals.redstone_check
execute if block ~ ~ ~-1 redstone_block run tag @s add rituals.redstone_check

# Check for powered levers (totem level and on block below totem)
execute if block ~1 ~ ~ lever[powered=true] run tag @s add rituals.redstone_check
execute if block ~-1 ~ ~ lever[powered=true] run tag @s add rituals.redstone_check
execute if block ~ ~ ~1 lever[powered=true] run tag @s add rituals.redstone_check
execute if block ~ ~ ~-1 lever[powered=true] run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~ lever[powered=true] run tag @s add rituals.redstone_check
execute if block ~1 ~-1 ~ lever[powered=true] run tag @s add rituals.redstone_check
execute if block ~-1 ~-1 ~ lever[powered=true] run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~1 lever[powered=true] run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~-1 lever[powered=true] run tag @s add rituals.redstone_check

# Check for powered redstone wire (power level > 0)
execute if block ~ ~-1 ~ redstone_wire[power=1] run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~ redstone_wire[power=2] run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~ redstone_wire[power=3] run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~ redstone_wire[power=4] run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~ redstone_wire[power=5] run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~ redstone_wire[power=6] run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~ redstone_wire[power=7] run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~ redstone_wire[power=8] run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~ redstone_wire[power=9] run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~ redstone_wire[power=10] run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~ redstone_wire[power=11] run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~ redstone_wire[power=12] run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~ redstone_wire[power=13] run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~ redstone_wire[power=14] run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~ redstone_wire[power=15] run tag @s add rituals.redstone_check
execute if block ~ ~-2 ~ redstone_wire[power=1] run tag @s add rituals.redstone_check
execute if block ~ ~-2 ~ redstone_wire[power=2] run tag @s add rituals.redstone_check
execute if block ~ ~-2 ~ redstone_wire[power=3] run tag @s add rituals.redstone_check
execute if block ~ ~-2 ~ redstone_wire[power=4] run tag @s add rituals.redstone_check
execute if block ~ ~-2 ~ redstone_wire[power=5] run tag @s add rituals.redstone_check
execute if block ~ ~-2 ~ redstone_wire[power=6] run tag @s add rituals.redstone_check
execute if block ~ ~-2 ~ redstone_wire[power=7] run tag @s add rituals.redstone_check
execute if block ~ ~-2 ~ redstone_wire[power=8] run tag @s add rituals.redstone_check
execute if block ~ ~-2 ~ redstone_wire[power=9] run tag @s add rituals.redstone_check
execute if block ~ ~-2 ~ redstone_wire[power=10] run tag @s add rituals.redstone_check
execute if block ~ ~-2 ~ redstone_wire[power=11] run tag @s add rituals.redstone_check
execute if block ~ ~-2 ~ redstone_wire[power=12] run tag @s add rituals.redstone_check
execute if block ~ ~-2 ~ redstone_wire[power=13] run tag @s add rituals.redstone_check
execute if block ~ ~-2 ~ redstone_wire[power=14] run tag @s add rituals.redstone_check
execute if block ~ ~-2 ~ redstone_wire[power=15] run tag @s add rituals.redstone_check

# Check for redstone torches (totem level and on block below totem)
execute if block ~1 ~ ~ redstone_torch run tag @s add rituals.redstone_check
execute if block ~-1 ~ ~ redstone_torch run tag @s add rituals.redstone_check
execute if block ~ ~ ~1 redstone_torch run tag @s add rituals.redstone_check
execute if block ~ ~ ~-1 redstone_torch run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~ redstone_torch run tag @s add rituals.redstone_check
execute if block ~ ~-2 ~ redstone_torch run tag @s add rituals.redstone_check
execute if block ~1 ~ ~ redstone_wall_torch run tag @s add rituals.redstone_check
execute if block ~-1 ~ ~ redstone_wall_torch run tag @s add rituals.redstone_check
execute if block ~ ~ ~1 redstone_wall_torch run tag @s add rituals.redstone_check
execute if block ~ ~ ~-1 redstone_wall_torch run tag @s add rituals.redstone_check
execute if block ~1 ~-1 ~ redstone_wall_torch run tag @s add rituals.redstone_check
execute if block ~-1 ~-1 ~ redstone_wall_torch run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~1 redstone_wall_torch run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~-1 redstone_wall_torch run tag @s add rituals.redstone_check

# Check for pressed buttons (totem level and on block below totem)
execute if block ~1 ~ ~ #buttons[powered=true] run tag @s add rituals.redstone_check
execute if block ~-1 ~ ~ #buttons[powered=true] run tag @s add rituals.redstone_check
execute if block ~ ~ ~1 #buttons[powered=true] run tag @s add rituals.redstone_check
execute if block ~ ~ ~-1 #buttons[powered=true] run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~ #buttons[powered=true] run tag @s add rituals.redstone_check
execute if block ~1 ~-1 ~ #buttons[powered=true] run tag @s add rituals.redstone_check
execute if block ~-1 ~-1 ~ #buttons[powered=true] run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~1 #buttons[powered=true] run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~-1 #buttons[powered=true] run tag @s add rituals.redstone_check

# Check for pressure plates (adjacent horizontally at totem level and one block below)
function rituals:totem/check_redstone_plates

# State change detection - only update when power state actually changes
# Detect state transitions (prevents mod interference and flickering)
execute if entity @s[tag=rituals.redstone_check,tag=!rituals.redstone_powered] run function rituals:totem/redstone_on
execute if entity @s[tag=!rituals.redstone_check,tag=rituals.redstone_powered] run function rituals:totem/redstone_off

# Clean up temporary check tag
tag @s remove rituals.redstone_check

# Glow particle at top when powered (subtle indicator)
execute if entity @s[tag=rituals.redstone_powered] run particle electric_spark ~ ~2 ~ 0.1 0.1 0.1 0 1
