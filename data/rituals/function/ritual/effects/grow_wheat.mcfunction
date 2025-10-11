# Grow wheat to next stage (replaces block without keep)
execute if block ~ ~ ~ wheat[age=0] run setblock ~ ~ ~ wheat[age=1] replace
execute if block ~ ~ ~ wheat[age=1] run setblock ~ ~ ~ wheat[age=2] replace
execute if block ~ ~ ~ wheat[age=2] run setblock ~ ~ ~ wheat[age=3] replace
execute if block ~ ~ ~ wheat[age=3] run setblock ~ ~ ~ wheat[age=4] replace
execute if block ~ ~ ~ wheat[age=4] run setblock ~ ~ ~ wheat[age=5] replace
execute if block ~ ~ ~ wheat[age=5] run setblock ~ ~ ~ wheat[age=6] replace
execute if block ~ ~ ~ wheat[age=6] run setblock ~ ~ ~ wheat[age=7] replace

