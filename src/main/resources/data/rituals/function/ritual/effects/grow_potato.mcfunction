# Grow potato by ONE stage only
execute if block ~ ~ ~ potatoes[age=6] run return run setblock ~ ~ ~ potatoes[age=7] replace
execute if block ~ ~ ~ potatoes[age=5] run return run setblock ~ ~ ~ potatoes[age=6] replace
execute if block ~ ~ ~ potatoes[age=4] run return run setblock ~ ~ ~ potatoes[age=5] replace
execute if block ~ ~ ~ potatoes[age=3] run return run setblock ~ ~ ~ potatoes[age=4] replace
execute if block ~ ~ ~ potatoes[age=2] run return run setblock ~ ~ ~ potatoes[age=3] replace
execute if block ~ ~ ~ potatoes[age=1] run return run setblock ~ ~ ~ potatoes[age=2] replace
execute if block ~ ~ ~ potatoes[age=0] run return run setblock ~ ~ ~ potatoes[age=1] replace

