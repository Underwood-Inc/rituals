# Harvest fully grown carrots and replant
# Drop loot (1-4 carrots)
loot spawn ~ ~ ~ loot rituals:blocks/carrots

# Replant at age 0
setblock ~ ~ ~ carrots[age=0] replace

# Visual feedback
particle minecraft:item{item:"minecraft:carrot"} ~ ~0.5 ~ 0.2 0.2 0.2 0 5
playsound block.crop.break block @a[distance=..16] ~ ~ ~ 0.3 1.0

