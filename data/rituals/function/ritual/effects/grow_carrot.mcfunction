# Grow carrot to next stage
execute if block ~ ~ ~ carrots[age=0] run setblock ~ ~ ~ carrots[age=1] replace
execute if block ~ ~ ~ carrots[age=1] run setblock ~ ~ ~ carrots[age=2] replace
execute if block ~ ~ ~ carrots[age=2] run setblock ~ ~ ~ carrots[age=3] replace
execute if block ~ ~ ~ carrots[age=3] run setblock ~ ~ ~ carrots[age=4] replace
execute if block ~ ~ ~ carrots[age=4] run setblock ~ ~ ~ carrots[age=5] replace
execute if block ~ ~ ~ carrots[age=5] run setblock ~ ~ ~ carrots[age=6] replace
execute if block ~ ~ ~ carrots[age=6] run setblock ~ ~ ~ carrots[age=7] replace

