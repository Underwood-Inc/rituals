# Apply bonemeal effect and particles
# We're positioned at ~0.5 ~0.5 ~0.5 in the block center

# Try to grow the crop using setblock (without keep flag for reliability)
execute align xyz if block ~ ~ ~ wheat run function rituals:ritual/effects/grow_wheat
execute align xyz if block ~ ~ ~ carrots run function rituals:ritual/effects/grow_carrot
execute align xyz if block ~ ~ ~ potatoes run function rituals:ritual/effects/grow_potato
execute align xyz if block ~ ~ ~ beetroots run function rituals:ritual/effects/grow_beetroot
execute align xyz if block ~ ~ ~ #minecraft:saplings run function rituals:ritual/effects/grow_sapling

# Also support other growable crops
execute align xyz if block ~ ~ ~ pumpkin_stem run function rituals:ritual/effects/grow_pumpkin_stem
execute align xyz if block ~ ~ ~ melon_stem run function rituals:ritual/effects/grow_melon_stem
execute align xyz if block ~ ~ ~ sweet_berry_bush run function rituals:ritual/effects/grow_berry_bush
execute align xyz if block ~ ~ ~ cocoa run function rituals:ritual/effects/grow_cocoa

# Unique growth particles
particle minecraft:happy_villager ~ ~0.5 ~ 0.2 0.2 0.2 0 5
particle minecraft:end_rod ~ ~0.5 ~ 0.1 0.1 0.1 0.02 2
particle minecraft:glow ~ ~0.3 ~ 0.15 0.15 0.15 0 3
particle minecraft:dust{color:[0.0,1.0,0.3],scale:1.0} ~ ~0.5 ~ 0.2 0.3 0.2 0 2

