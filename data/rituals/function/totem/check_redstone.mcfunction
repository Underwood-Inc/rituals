# Check if totem is receiving redstone power
tag @s remove rituals.redstone_powered

# Check immediate adjacent blocks - simple and direct
execute if block ~ ~-1 ~ redstone_block run tag @s add rituals.redstone_powered
execute if block ~1 ~ ~ redstone_block run tag @s add rituals.redstone_powered
execute if block ~-1 ~ ~ redstone_block run tag @s add rituals.redstone_powered
execute if block ~ ~ ~1 redstone_block run tag @s add rituals.redstone_powered
execute if block ~ ~ ~-1 redstone_block run tag @s add rituals.redstone_powered

# Check for any powered lever nearby
execute if block ~1 ~ ~ lever[powered=true] run tag @s add rituals.redstone_powered
execute if block ~-1 ~ ~ lever[powered=true] run tag @s add rituals.redstone_powered
execute if block ~ ~ ~1 lever[powered=true] run tag @s add rituals.redstone_powered
execute if block ~ ~ ~-1 lever[powered=true] run tag @s add rituals.redstone_powered
execute if block ~ ~-1 ~ lever[powered=true] run tag @s add rituals.redstone_powered

# Show range if powered
execute if entity @s[tag=rituals.redstone_powered] run function rituals:totem/show_range
execute if entity @s[tag=rituals.redstone_powered] run particle dust{color:[1.0,1.0,0.0],scale:1.5} ~ ~2 ~ 0.2 0.2 0.2 0 1
