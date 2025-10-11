# Try to grow a block at current position
# Apply growth to all crop types

# Wheat (age 0-7) - grow by 1 stage
execute if block ~ ~ ~ minecraft:wheat[age=0] run setblock ~ ~ ~ minecraft:wheat[age=1] keep
execute if block ~ ~ ~ minecraft:wheat[age=1] run setblock ~ ~ ~ minecraft:wheat[age=2] keep
execute if block ~ ~ ~ minecraft:wheat[age=2] run setblock ~ ~ ~ minecraft:wheat[age=3] keep
execute if block ~ ~ ~ minecraft:wheat[age=3] run setblock ~ ~ ~ minecraft:wheat[age=4] keep
execute if block ~ ~ ~ minecraft:wheat[age=4] run setblock ~ ~ ~ minecraft:wheat[age=5] keep
execute if block ~ ~ ~ minecraft:wheat[age=5] run setblock ~ ~ ~ minecraft:wheat[age=6] keep
execute if block ~ ~ ~ minecraft:wheat[age=6] run setblock ~ ~ ~ minecraft:wheat[age=7] keep

# Carrots (age 0-7)
execute if block ~ ~ ~ minecraft:carrots[age=0] run setblock ~ ~ ~ minecraft:carrots[age=1] keep
execute if block ~ ~ ~ minecraft:carrots[age=1] run setblock ~ ~ ~ minecraft:carrots[age=2] keep
execute if block ~ ~ ~ minecraft:carrots[age=2] run setblock ~ ~ ~ minecraft:carrots[age=3] keep
execute if block ~ ~ ~ minecraft:carrots[age=3] run setblock ~ ~ ~ minecraft:carrots[age=4] keep
execute if block ~ ~ ~ minecraft:carrots[age=4] run setblock ~ ~ ~ minecraft:carrots[age=5] keep
execute if block ~ ~ ~ minecraft:carrots[age=5] run setblock ~ ~ ~ minecraft:carrots[age=6] keep
execute if block ~ ~ ~ minecraft:carrots[age=6] run setblock ~ ~ ~ minecraft:carrots[age=7] keep

# Potatoes (age 0-7)
execute if block ~ ~ ~ minecraft:potatoes[age=0] run setblock ~ ~ ~ minecraft:potatoes[age=1] keep
execute if block ~ ~ ~ minecraft:potatoes[age=1] run setblock ~ ~ ~ minecraft:potatoes[age=2] keep
execute if block ~ ~ ~ minecraft:potatoes[age=2] run setblock ~ ~ ~ minecraft:potatoes[age=3] keep
execute if block ~ ~ ~ minecraft:potatoes[age=3] run setblock ~ ~ ~ minecraft:potatoes[age=4] keep
execute if block ~ ~ ~ minecraft:potatoes[age=4] run setblock ~ ~ ~ minecraft:potatoes[age=5] keep
execute if block ~ ~ ~ minecraft:potatoes[age=5] run setblock ~ ~ ~ minecraft:potatoes[age=6] keep
execute if block ~ ~ ~ minecraft:potatoes[age=6] run setblock ~ ~ ~ minecraft:potatoes[age=7] keep

# Beetroots (age 0-3)
execute if block ~ ~ ~ minecraft:beetroots[age=0] run setblock ~ ~ ~ minecraft:beetroots[age=1] keep
execute if block ~ ~ ~ minecraft:beetroots[age=1] run setblock ~ ~ ~ minecraft:beetroots[age=2] keep
execute if block ~ ~ ~ minecraft:beetroots[age=2] run setblock ~ ~ ~ minecraft:beetroots[age=3] keep

# Nether wart (age 0-3)
execute if block ~ ~ ~ minecraft:nether_wart[age=0] run setblock ~ ~ ~ minecraft:nether_wart[age=1] keep
execute if block ~ ~ ~ minecraft:nether_wart[age=1] run setblock ~ ~ ~ minecraft:nether_wart[age=2] keep
execute if block ~ ~ ~ minecraft:nether_wart[age=2] run setblock ~ ~ ~ minecraft:nether_wart[age=3] keep

# Sweet berry bush (age 0-3)
execute if block ~ ~ ~ minecraft:sweet_berry_bush[age=0] run setblock ~ ~ ~ minecraft:sweet_berry_bush[age=1] keep
execute if block ~ ~ ~ minecraft:sweet_berry_bush[age=1] run setblock ~ ~ ~ minecraft:sweet_berry_bush[age=2] keep
execute if block ~ ~ ~ minecraft:sweet_berry_bush[age=2] run setblock ~ ~ ~ minecraft:sweet_berry_bush[age=3] keep

# Cocoa (age 0-2)
execute if block ~ ~ ~ minecraft:cocoa[age=0] run setblock ~ ~ ~ minecraft:cocoa[age=1] keep
execute if block ~ ~ ~ minecraft:cocoa[age=1] run setblock ~ ~ ~ minecraft:cocoa[age=2] keep

# Unique particle effect for ritual growth (glow + sparkle)
execute if block ~ ~ ~ #minecraft:crops run particle glow ~ ~0.5 ~ 0.2 0.2 0.2 0.05 5
execute if block ~ ~ ~ #minecraft:crops run particle end_rod ~ ~0.5 ~ 0.1 0.3 0.1 0.01 2
execute if block ~ ~ ~ #minecraft:crops run particle happy_villager ~ ~0.5 ~ 0.2 0.2 0.2 0 1

# Saplings
execute if block ~ ~ ~ #minecraft:saplings run particle happy_villager ~ ~0.5 ~ 0.3 0.3 0.3 0 5
execute if block ~ ~ ~ #minecraft:saplings run function rituals:ritual/effects/grow_sapling

