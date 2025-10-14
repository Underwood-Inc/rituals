# Harvest fully grown nether wart and replant
# Drop loot (2-4 nether wart)
loot spawn ~ ~ ~ loot rituals:blocks/nether_wart

# Replant at age 0
setblock ~ ~ ~ nether_wart[age=0] replace

# Visual feedback
particle minecraft:item{item:"minecraft:nether_wart"} ~ ~0.5 ~ 0.2 0.2 0.2 0 5
playsound block.nether_wart.break block @a[distance=..16] ~ ~ ~ 0.3 1.0

