# Grow sweet berry bush by ONE stage only
execute if block ~ ~ ~ sweet_berry_bush[age=2] run return run setblock ~ ~ ~ sweet_berry_bush[age=3] replace
execute if block ~ ~ ~ sweet_berry_bush[age=1] run return run setblock ~ ~ ~ sweet_berry_bush[age=2] replace
execute if block ~ ~ ~ sweet_berry_bush[age=0] run return run setblock ~ ~ ~ sweet_berry_bush[age=1] replace

