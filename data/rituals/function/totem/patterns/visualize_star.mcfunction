# ========================================
# Visualize Star Pattern (Auto-Breeding)
# ========================================
# Shows particle markers at 4 cardinal positions
# Color: Green/Yellow (nature/crop colors)
# Pattern: 4 cardinals at 5 blocks distance

# Visual feedback at center
particle minecraft:happy_villager ~ ~2.5 ~ 0.3 0.3 0.3 0 5
particle minecraft:composter ~ ~2.2 ~ 0.2 0.2 0.2 0 3

# North (0, 0, +5) - Seeds
particle dust{color:[0.8,1.0,0.2],scale:1.2} ~ ~ ~5 0.3 0.5 0.3 0 8 force
particle dust{color:[0.8,1.0,0.2],scale:0.8} ~ ~1 ~5 0.2 0.3 0.2 0 4 force
particle dust{color:[0.8,1.0,0.2],scale:0.8} ~ ~2 ~5 0.2 0.3 0.2 0 4 force
execute positioned ~ ~ ~5 run particle minecraft:happy_villager ~ ~1 ~ 0.2 0.5 0.2 0 3

# East (+5, 0, 0) - Carrot
particle dust{color:[1.0,0.6,0.2],scale:1.2} ~5 ~ ~ 0.3 0.5 0.3 0 8 force
particle dust{color:[1.0,0.6,0.2],scale:0.8} ~5 ~1 ~ 0.2 0.3 0.2 0 4 force
particle dust{color:[1.0,0.6,0.2],scale:0.8} ~5 ~2 ~ 0.2 0.3 0.2 0 4 force
execute positioned ~5 ~ ~ run particle minecraft:happy_villager ~ ~1 ~ 0.2 0.5 0.2 0 3

# South (0, 0, -5) - Potato
particle dust{color:[0.9,0.8,0.5],scale:1.2} ~ ~ ~-5 0.3 0.5 0.3 0 8 force
particle dust{color:[0.9,0.8,0.5],scale:0.8} ~ ~1 ~-5 0.2 0.3 0.2 0 4 force
particle dust{color:[0.9,0.8,0.5],scale:0.8} ~ ~2 ~-5 0.2 0.3 0.2 0 4 force
execute positioned ~ ~ ~-5 run particle minecraft:happy_villager ~ ~1 ~ 0.2 0.5 0.2 0 3

# West (-5, 0, 0) - Beetroot Seeds
particle dust{color:[0.8,0.2,0.3],scale:1.2} ~-5 ~ ~ 0.3 0.5 0.3 0 8 force
particle dust{color:[0.8,0.2,0.3],scale:0.8} ~-5 ~1 ~ 0.2 0.3 0.2 0 4 force
particle dust{color:[0.8,0.2,0.3],scale:0.8} ~-5 ~2 ~ 0.2 0.3 0.2 0 4 force
execute positioned ~-5 ~ ~ run particle minecraft:happy_villager ~ ~1 ~ 0.2 0.5 0.2 0 3

# Draw connection lines (cross pattern)
particle dust{color:[0.5,1.0,0.2],scale:0.6} ~ ~ ~2.5 0.1 0.1 0.1 0 2 force
particle dust{color:[0.5,1.0,0.2],scale:0.6} ~ ~ ~-2.5 0.1 0.1 0.1 0 2 force
particle dust{color:[0.5,1.0,0.2],scale:0.6} ~2.5 ~ ~ 0.1 0.1 0.1 0 2 force
particle dust{color:[0.5,1.0,0.2],scale:0.6} ~-2.5 ~ ~ 0.1 0.1 0.1 0 2 force


