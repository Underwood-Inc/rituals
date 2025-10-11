# Grow cocoa to next stage (preserve facing direction)
execute if block ~ ~ ~ cocoa[age=0,facing=north] run setblock ~ ~ ~ cocoa[age=1,facing=north] replace
execute if block ~ ~ ~ cocoa[age=0,facing=south] run setblock ~ ~ ~ cocoa[age=1,facing=south] replace
execute if block ~ ~ ~ cocoa[age=0,facing=east] run setblock ~ ~ ~ cocoa[age=1,facing=east] replace
execute if block ~ ~ ~ cocoa[age=0,facing=west] run setblock ~ ~ ~ cocoa[age=1,facing=west] replace

execute if block ~ ~ ~ cocoa[age=1,facing=north] run setblock ~ ~ ~ cocoa[age=2,facing=north] replace
execute if block ~ ~ ~ cocoa[age=1,facing=south] run setblock ~ ~ ~ cocoa[age=2,facing=south] replace
execute if block ~ ~ ~ cocoa[age=1,facing=east] run setblock ~ ~ ~ cocoa[age=2,facing=east] replace
execute if block ~ ~ ~ cocoa[age=1,facing=west] run setblock ~ ~ ~ cocoa[age=2,facing=west] replace

