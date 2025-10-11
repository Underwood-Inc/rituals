# Grow beetroot to next stage (only 4 stages: 0-3)
execute if block ~ ~ ~ beetroots[age=0] run setblock ~ ~ ~ beetroots[age=1] replace
execute if block ~ ~ ~ beetroots[age=1] run setblock ~ ~ ~ beetroots[age=2] replace
execute if block ~ ~ ~ beetroots[age=2] run setblock ~ ~ ~ beetroots[age=3] replace

