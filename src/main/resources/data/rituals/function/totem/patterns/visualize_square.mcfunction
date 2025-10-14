# ========================================
# Visualize Square Pattern (Enchanting Nexus)
# ========================================
# Shows particle markers at the 4 corner positions
# Color: Purple/Aqua (enchanting colors)
# Pattern: 4 corners at 4 blocks diagonal distance

# Visual feedback at center
particle minecraft:enchant ~ ~2.5 ~ 0.3 0.3 0.3 1 5

# NE Corner (+4, 0, +4) - Lapis Lazuli Block
particle dust{color:[0.2,0.4,1.0],scale:1.2} ~4 ~ ~4 0.3 0.5 0.3 0 8 force
particle dust{color:[0.2,0.4,1.0],scale:0.8} ~4 ~1 ~4 0.2 0.3 0.2 0 4 force
particle dust{color:[0.2,0.4,1.0],scale:0.8} ~4 ~2 ~4 0.2 0.3 0.2 0 4 force
execute positioned ~4 ~ ~4 run particle minecraft:enchant ~ ~1 ~ 0.2 0.5 0.2 0.5 3

# SE Corner (+4, 0, -4) - Bookshelf
particle dust{color:[0.6,0.4,0.2],scale:1.2} ~4 ~ ~-4 0.3 0.5 0.3 0 8 force
particle dust{color:[0.6,0.4,0.2],scale:0.8} ~4 ~1 ~-4 0.2 0.3 0.2 0 4 force
particle dust{color:[0.6,0.4,0.2],scale:0.8} ~4 ~2 ~-4 0.2 0.3 0.2 0 4 force
execute positioned ~4 ~ ~-4 run particle minecraft:enchant ~ ~1 ~ 0.2 0.5 0.2 0.5 3

# SW Corner (-4, 0, -4) - Amethyst Shard
particle dust{color:[0.8,0.4,1.0],scale:1.2} ~-4 ~ ~-4 0.3 0.5 0.3 0 8 force
particle dust{color:[0.8,0.4,1.0],scale:0.8} ~-4 ~1 ~-4 0.2 0.3 0.2 0 4 force
particle dust{color:[0.8,0.4,1.0],scale:0.8} ~-4 ~2 ~-4 0.2 0.3 0.2 0 4 force
execute positioned ~-4 ~ ~-4 run particle minecraft:enchant ~ ~1 ~ 0.2 0.5 0.2 0.5 3

# NW Corner (-4, 0, +4) - Experience Bottle
particle dust{color:[0.4,1.0,0.4],scale:1.2} ~-4 ~ ~4 0.3 0.5 0.3 0 8 force
particle dust{color:[0.4,1.0,0.4],scale:0.8} ~-4 ~1 ~4 0.2 0.3 0.2 0 4 force
particle dust{color:[0.4,1.0,0.4],scale:0.8} ~-4 ~2 ~4 0.2 0.3 0.2 0 4 force
execute positioned ~-4 ~ ~4 run particle minecraft:enchant ~ ~1 ~ 0.2 0.5 0.2 0.5 3

# Draw connection lines (wireframe)
particle dust{color:[0.5,0.3,0.8],scale:0.6} ~2 ~ ~2 0.1 0.1 0.1 0 2 force
particle dust{color:[0.5,0.3,0.8],scale:0.6} ~-2 ~ ~2 0.1 0.1 0.1 0 2 force
particle dust{color:[0.5,0.3,0.8],scale:0.6} ~2 ~ ~-2 0.1 0.1 0.1 0 2 force
particle dust{color:[0.5,0.3,0.8],scale:0.6} ~-2 ~ ~-2 0.1 0.1 0.1 0 2 force


