# ========================================
# Progress Particles for Active Rituals
# ========================================
# Shows glittering particles above powered active rituals
# Particles shrink as the timer approaches trigger point

# Get the ritual's frequency settings
execute if score @s rituals.effect matches 1 run function rituals:ritual/get_growth_settings
execute if score @s rituals.effect matches 2 run function rituals:ritual/get_strength_settings
execute if score @s rituals.effect matches 3 run function rituals:ritual/get_prosperity_settings
execute if score @s rituals.effect matches 4 run function rituals:ritual/get_protection_settings
execute if score @s rituals.effect matches 5 run function rituals:ritual/get_healing_settings
execute if score @s rituals.effect matches 6 run function rituals:ritual/get_sentry_settings
execute if score @s rituals.effect matches 11 run function rituals:ritual/get_breeding_settings

# Calculate remaining time until trigger
scoreboard players operation #time_remaining rituals.temp = #current_freq rituals.temp
scoreboard players operation #time_remaining rituals.temp -= @s rituals.data

# Calculate percentage remaining (0-100)
# percentage = (remaining * 100) / frequency
scoreboard players set #100 rituals.temp 100
scoreboard players operation #percentage rituals.temp = #time_remaining rituals.temp
scoreboard players operation #percentage rituals.temp *= #100 rituals.temp
scoreboard players operation #percentage rituals.temp /= #current_freq rituals.temp

# Calculate height offset (2.0 blocks at 100%, 0.3 blocks at 0%)
# height_ticks = percentage * 17 / 100  (ranges from 0 to 17, representing 0.0 to 1.7 blocks offset)
scoreboard players set #17 rituals.temp 17
scoreboard players operation #height_offset rituals.temp = #percentage rituals.temp
scoreboard players operation #height_offset rituals.temp *= #17 rituals.temp
scoreboard players operation #height_offset rituals.temp /= #100 rituals.temp

# Store the height offset (in tenths of blocks, range 0-17 = 0.0-1.7 blocks)
data modify storage rituals:temp progress_height set value 0.0f
execute if score #height_offset rituals.temp matches 0 run data modify storage rituals:temp progress_height set value 0.3f
execute if score #height_offset rituals.temp matches 1..2 run data modify storage rituals:temp progress_height set value 0.5f
execute if score #height_offset rituals.temp matches 3..5 run data modify storage rituals:temp progress_height set value 0.8f
execute if score #height_offset rituals.temp matches 6..8 run data modify storage rituals:temp progress_height set value 1.1f
execute if score #height_offset rituals.temp matches 9..11 run data modify storage rituals:temp progress_height set value 1.4f
execute if score #height_offset rituals.temp matches 12..14 run data modify storage rituals:temp progress_height set value 1.7f
execute if score #height_offset rituals.temp matches 15.. run data modify storage rituals:temp progress_height set value 2.0f

# Calculate particle count (5 at 100%, 1 at near 0%)
scoreboard players set #particle_count rituals.temp 1
execute if score #percentage rituals.temp matches 20.. run scoreboard players set #particle_count rituals.temp 2
execute if score #percentage rituals.temp matches 40.. run scoreboard players set #particle_count rituals.temp 3
execute if score #percentage rituals.temp matches 60.. run scoreboard players set #particle_count rituals.temp 4
execute if score #percentage rituals.temp matches 80.. run scoreboard players set #particle_count rituals.temp 5

# Display particles with macro for dynamic height
function rituals:ritual/progress_particles_display with storage rituals:temp

