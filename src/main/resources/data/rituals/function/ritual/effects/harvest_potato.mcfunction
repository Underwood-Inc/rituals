# Harvest fully grown potatoes and replant
# Drop loot (1-4 potatoes, chance of poisonous potato)
loot spawn ~ ~ ~ loot rituals:blocks/potatoes

# Replant at age 0
setblock ~ ~ ~ potatoes[age=0] replace

# Visual feedback
particle minecraft:item{item:"minecraft:potato"} ~ ~0.5 ~ 0.2 0.2 0.2 0 5
playsound block.crop.break block @a[distance=..16] ~ ~ ~ 0.3 1.0

