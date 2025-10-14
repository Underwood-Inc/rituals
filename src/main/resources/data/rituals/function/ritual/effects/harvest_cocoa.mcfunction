# Harvest fully grown cocoa and replant
# Drop loot (2-3 cocoa beans)
loot spawn ~ ~ ~ loot rituals:blocks/cocoa

# Replant at age 0 (preserving facing direction)
execute if block ~ ~ ~ cocoa[facing=north] run setblock ~ ~ ~ cocoa[age=0,facing=north] replace
execute if block ~ ~ ~ cocoa[facing=south] run setblock ~ ~ ~ cocoa[age=0,facing=south] replace
execute if block ~ ~ ~ cocoa[facing=east] run setblock ~ ~ ~ cocoa[age=0,facing=east] replace
execute if block ~ ~ ~ cocoa[facing=west] run setblock ~ ~ ~ cocoa[age=0,facing=west] replace

# Visual feedback
particle minecraft:item{item:"minecraft:cocoa_beans"} ~ ~0.5 ~ 0.2 0.2 0.2 0 5
playsound block.wood.break block @a[distance=..16] ~ ~ ~ 0.3 1.0

