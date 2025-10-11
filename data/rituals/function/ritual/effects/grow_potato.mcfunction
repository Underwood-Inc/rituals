# Grow potato to next stage
execute if block ~ ~ ~ potatoes[age=0] run setblock ~ ~ ~ potatoes[age=1] replace
execute if block ~ ~ ~ potatoes[age=1] run setblock ~ ~ ~ potatoes[age=2] replace
execute if block ~ ~ ~ potatoes[age=2] run setblock ~ ~ ~ potatoes[age=3] replace
execute if block ~ ~ ~ potatoes[age=3] run setblock ~ ~ ~ potatoes[age=4] replace
execute if block ~ ~ ~ potatoes[age=4] run setblock ~ ~ ~ potatoes[age=5] replace
execute if block ~ ~ ~ potatoes[age=5] run setblock ~ ~ ~ potatoes[age=6] replace
execute if block ~ ~ ~ potatoes[age=6] run setblock ~ ~ ~ potatoes[age=7] replace

