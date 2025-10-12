# Single animation step for item display
# Runs as the item_display entity

# Store current game time for rotation calculation
execute store result score #anim_time rituals.temp run time query gametime

# Calculate rotation angle (cycles every 120 ticks = 6 seconds for full rotation)
scoreboard players set #120 rituals.temp 120
scoreboard players operation #rotation rituals.temp = #anim_time rituals.temp
scoreboard players operation #rotation rituals.temp %= #120 rituals.temp

# CONTINUOUS rotation + bobbing (sine wave pattern)
# Rotation keeps going in ONE direction (never reverses)
# Bob: smooth up/down sine wave
execute if score #rotation rituals.temp matches 0..9 run data merge entity @s {start_interpolation:0,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.1f,0f],scale:[0.5f,0.5f,0.5f]}}
execute if score #rotation rituals.temp matches 10..19 run data merge entity @s {start_interpolation:0,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0.259f,0f,0.966f],translation:[0f,0.07f,0f],scale:[0.5f,0.5f,0.5f]}}
execute if score #rotation rituals.temp matches 20..29 run data merge entity @s {start_interpolation:0,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0.5f,0f,0.866f],translation:[0f,0.03f,0f],scale:[0.5f,0.5f,0.5f]}}
execute if score #rotation rituals.temp matches 30..39 run data merge entity @s {start_interpolation:0,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0.707f,0f,0.707f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]}}
execute if score #rotation rituals.temp matches 40..49 run data merge entity @s {start_interpolation:0,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0.866f,0f,0.5f],translation:[0f,-0.03f,0f],scale:[0.5f,0.5f,0.5f]}}
execute if score #rotation rituals.temp matches 50..59 run data merge entity @s {start_interpolation:0,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0.966f,0f,0.259f],translation:[0f,-0.07f,0f],scale:[0.5f,0.5f,0.5f]}}
execute if score #rotation rituals.temp matches 60..69 run data merge entity @s {start_interpolation:0,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,1f,0f,0f],translation:[0f,-0.1f,0f],scale:[0.5f,0.5f,0.5f]}}
execute if score #rotation rituals.temp matches 70..79 run data merge entity @s {start_interpolation:0,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0.966f,0f,-0.259f],translation:[0f,-0.07f,0f],scale:[0.5f,0.5f,0.5f]}}
execute if score #rotation rituals.temp matches 80..89 run data merge entity @s {start_interpolation:0,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0.866f,0f,-0.5f],translation:[0f,-0.03f,0f],scale:[0.5f,0.5f,0.5f]}}
execute if score #rotation rituals.temp matches 90..99 run data merge entity @s {start_interpolation:0,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0.707f,0f,-0.707f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]}}
execute if score #rotation rituals.temp matches 100..109 run data merge entity @s {start_interpolation:0,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0.5f,0f,-0.866f],translation:[0f,0.03f,0f],scale:[0.5f,0.5f,0.5f]}}
execute if score #rotation rituals.temp matches 110..119 run data merge entity @s {start_interpolation:0,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0.259f,0f,-0.966f],translation:[0f,0.07f,0f],scale:[0.5f,0.5f,0.5f]}}

