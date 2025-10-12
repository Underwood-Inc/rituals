# Grow beetroot by ONE stage only (only 4 stages: 0-3)
execute if block ~ ~ ~ beetroots[age=2] run return run setblock ~ ~ ~ beetroots[age=3] replace
execute if block ~ ~ ~ beetroots[age=1] run return run setblock ~ ~ ~ beetroots[age=2] replace
execute if block ~ ~ ~ beetroots[age=0] run return run setblock ~ ~ ~ beetroots[age=1] replace

