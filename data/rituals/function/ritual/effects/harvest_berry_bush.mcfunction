# Harvest sweet berries from fully grown bush
# Drop loot (2-3 berries)
loot spawn ~ ~ ~ loot rituals:blocks/sweet_berry_bush

# Reset to age 1 (bush stays but needs to regrow berries)
setblock ~ ~ ~ sweet_berry_bush[age=1] replace

# Visual feedback
particle minecraft:item{item:"minecraft:sweet_berries"} ~ ~0.5 ~ 0.2 0.2 0.2 0 5
playsound block.sweet_berry_bush.pick_berries block @a[distance=..16] ~ ~ ~ 0.3 1.0

