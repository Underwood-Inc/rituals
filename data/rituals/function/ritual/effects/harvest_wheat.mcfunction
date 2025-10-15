# Harvest fully grown wheat and replant
# Drop loot (1 wheat + 0-3 seeds)
loot spawn ~ ~ ~ loot rituals:blocks/wheat

# Replant at age 0
setblock ~ ~ ~ wheat[age=0] replace

# Visual feedback
particle minecraft:item{item:"minecraft:wheat"} ~ ~0.5 ~ 0.2 0.2 0.2 0 5
playsound block.crop.break block @a[distance=..16] ~ ~ ~ 0.3 1.0

