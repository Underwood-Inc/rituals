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

# Show/hide range barrier based on power state
execute if entity @s[tag=rituals.redstone_powered,tag=!rituals.barrier_shown] run function rituals:totem/show_range_barrier
execute if entity @s[tag=!rituals.redstone_powered,tag=rituals.barrier_shown] run function rituals:totem/hide_range_barrier

# Glow particle at top when powered (subtle indicator)
execute if entity @s[tag=rituals.redstone_powered] run particle electric_spark ~ ~2 ~ 0.1 0.1 0.1 0 1
