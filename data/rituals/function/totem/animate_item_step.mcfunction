# Single animation step for item display
# Runs as the item_display entity

# Store current game time for rotation calculation
execute store result score #anim_time rituals.temp run time query gametime

# Calculate rotation angle (cycles every 120 ticks = 6 seconds for full rotation)
scoreboard players set #120 rituals.temp 120
scoreboard players operation #rotation rituals.temp = #anim_time rituals.temp
scoreboard players operation #rotation rituals.temp %= #120 rituals.temp

# CONTINUOUS rotation + bobbing (sine wave pattern)
# Simplified to 6 keyframes with 30-tick interpolation for TPS-independent smoothness
# Each keyframe covers 20 ticks, client interpolates smoothly between them
# Rotation keeps going in ONE direction (never reverses)
# Bob: smooth up/down sine wave
execute if score #rotation rituals.temp matches 0..19 run data merge entity @s {interpolation_duration:30,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.1f,0f],scale:[0.5f,0.5f,0.5f]}}
execute if score #rotation rituals.temp matches 20..39 run data merge entity @s {interpolation_duration:30,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0.5f,0f,0.866f],translation:[0f,0.05f,0f],scale:[0.5f,0.5f,0.5f]}}
execute if score #rotation rituals.temp matches 40..59 run data merge entity @s {interpolation_duration:30,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0.866f,0f,0.5f],translation:[0f,-0.05f,0f],scale:[0.5f,0.5f,0.5f]}}
execute if score #rotation rituals.temp matches 60..79 run data merge entity @s {interpolation_duration:30,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,1f,0f,0f],translation:[0f,-0.1f,0f],scale:[0.5f,0.5f,0.5f]}}
execute if score #rotation rituals.temp matches 80..99 run data merge entity @s {interpolation_duration:30,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0.866f,0f,-0.5f],translation:[0f,-0.05f,0f],scale:[0.5f,0.5f,0.5f]}}
execute if score #rotation rituals.temp matches 100..119 run data merge entity @s {interpolation_duration:30,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0.5f,0f,-0.866f],translation:[0f,0.05f,0f],scale:[0.5f,0.5f,0.5f]}}

