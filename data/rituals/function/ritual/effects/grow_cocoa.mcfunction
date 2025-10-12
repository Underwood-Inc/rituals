# Grow cocoa by ONE stage only (preserve facing direction)
execute if block ~ ~ ~ cocoa[age=1,facing=north] run return run setblock ~ ~ ~ cocoa[age=2,facing=north] replace
execute if block ~ ~ ~ cocoa[age=1,facing=south] run return run setblock ~ ~ ~ cocoa[age=2,facing=south] replace
execute if block ~ ~ ~ cocoa[age=1,facing=east] run return run setblock ~ ~ ~ cocoa[age=2,facing=east] replace
execute if block ~ ~ ~ cocoa[age=1,facing=west] run return run setblock ~ ~ ~ cocoa[age=2,facing=west] replace

execute if block ~ ~ ~ cocoa[age=0,facing=north] run return run setblock ~ ~ ~ cocoa[age=1,facing=north] replace
execute if block ~ ~ ~ cocoa[age=0,facing=south] run return run setblock ~ ~ ~ cocoa[age=1,facing=south] replace
execute if block ~ ~ ~ cocoa[age=0,facing=east] run return run setblock ~ ~ ~ cocoa[age=1,facing=east] replace
execute if block ~ ~ ~ cocoa[age=0,facing=west] run return run setblock ~ ~ ~ cocoa[age=1,facing=west] replace

