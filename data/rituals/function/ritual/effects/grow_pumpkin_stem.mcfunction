# Grow pumpkin stem to next stage
execute if block ~ ~ ~ pumpkin_stem[age=0] run setblock ~ ~ ~ pumpkin_stem[age=1] replace
execute if block ~ ~ ~ pumpkin_stem[age=1] run setblock ~ ~ ~ pumpkin_stem[age=2] replace
execute if block ~ ~ ~ pumpkin_stem[age=2] run setblock ~ ~ ~ pumpkin_stem[age=3] replace
execute if block ~ ~ ~ pumpkin_stem[age=3] run setblock ~ ~ ~ pumpkin_stem[age=4] replace
execute if block ~ ~ ~ pumpkin_stem[age=4] run setblock ~ ~ ~ pumpkin_stem[age=5] replace
execute if block ~ ~ ~ pumpkin_stem[age=5] run setblock ~ ~ ~ pumpkin_stem[age=6] replace
execute if block ~ ~ ~ pumpkin_stem[age=6] run setblock ~ ~ ~ pumpkin_stem[age=7] replace

