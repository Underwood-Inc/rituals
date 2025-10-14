# Harvest fully grown beetroots and replant
# Drop loot (1 beetroot + 0-3 seeds)
loot spawn ~ ~ ~ loot rituals:blocks/beetroots

# Replant at age 0
setblock ~ ~ ~ beetroots[age=0] replace

# Visual feedback
particle minecraft:item{item:"minecraft:beetroot"} ~ ~0.5 ~ 0.2 0.2 0.2 0 5
playsound block.crop.break block @a[distance=..16] ~ ~ ~ 0.3 1.0

