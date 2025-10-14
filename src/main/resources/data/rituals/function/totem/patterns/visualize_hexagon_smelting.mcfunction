# ========================================
# Visualize Hexagon Pattern (Auto-Smelting)
# ========================================
# Shows particle markers at 6 hexagon positions
# Color: Red/Orange/Yellow (fire theme)
# Pattern: 6 points around center at 6 blocks radius

# Visual feedback at center
particle minecraft:flame ~ ~2.5 ~ 0.3 0.3 0.3 0.05 10
particle minecraft:lava ~ ~2.2 ~ 0.2 0.2 0.2 0 3

# North (0, 0, +6) - Blaze Rod
particle dust{color:[1.0,0.8,0.2],scale:1.2} ~ ~ ~6 0.3 0.5 0.3 0 8 force
particle dust{color:[1.0,0.8,0.2],scale:0.8} ~ ~1 ~6 0.2 0.3 0.2 0 4 force
particle dust{color:[1.0,0.8,0.2],scale:0.8} ~ ~2 ~6 0.2 0.3 0.2 0 4 force
execute positioned ~ ~ ~6 run particle minecraft:flame ~ ~1 ~ 0.2 0.5 0.2 0.03 3

# NE (+5, 0, +3) - Coal Block
particle dust{color:[0.2,0.2,0.2],scale:1.2} ~5 ~ ~3 0.3 0.5 0.3 0 8 force
particle dust{color:[0.2,0.2,0.2],scale:0.8} ~5 ~1 ~3 0.2 0.3 0.2 0 4 force
particle dust{color:[0.2,0.2,0.2],scale:0.8} ~5 ~2 ~3 0.2 0.3 0.2 0 4 force
execute positioned ~5 ~ ~3 run particle minecraft:flame ~ ~1 ~ 0.2 0.5 0.2 0.03 3

# SE (+5, 0, -3) - Lava Bucket
particle dust{color:[1.0,0.3,0.0],scale:1.2} ~5 ~ ~-3 0.3 0.5 0.3 0 8 force
particle dust{color:[1.0,0.3,0.0],scale:0.8} ~5 ~1 ~-3 0.2 0.3 0.2 0 4 force
particle dust{color:[1.0,0.3,0.0],scale:0.8} ~5 ~2 ~-3 0.2 0.3 0.2 0 4 force
execute positioned ~5 ~ ~-3 run particle minecraft:lava ~ ~0.5 ~ 0.2 0.2 0.2 0 2

# South (0, 0, -6) - Fire Charge
particle dust{color:[0.8,0.4,0.1],scale:1.2} ~ ~ ~-6 0.3 0.5 0.3 0 8 force
particle dust{color:[0.8,0.4,0.1],scale:0.8} ~ ~1 ~-6 0.2 0.3 0.2 0 4 force
particle dust{color:[0.8,0.4,0.1],scale:0.8} ~ ~2 ~-6 0.2 0.3 0.2 0 4 force
execute positioned ~ ~ ~-6 run particle minecraft:flame ~ ~1 ~ 0.2 0.5 0.2 0.03 3

# SW (-5, 0, -3) - Magma Block
particle dust{color:[0.7,0.2,0.0],scale:1.2} ~-5 ~ ~-3 0.3 0.5 0.3 0 8 force
particle dust{color:[0.7,0.2,0.0],scale:0.8} ~-5 ~1 ~-3 0.2 0.3 0.2 0 4 force
particle dust{color:[0.7,0.2,0.0],scale:0.8} ~-5 ~2 ~-3 0.2 0.3 0.2 0 4 force
execute positioned ~-5 ~ ~-3 run particle minecraft:lava ~ ~0.5 ~ 0.2 0.2 0.2 0 2

# NW (-5, 0, +3) - Soul Campfire
particle dust{color:[0.2,0.8,0.8],scale:1.2} ~-5 ~ ~3 0.3 0.5 0.3 0 8 force
particle dust{color:[0.2,0.8,0.8],scale:0.8} ~-5 ~1 ~3 0.2 0.3 0.2 0 4 force
particle dust{color:[0.2,0.8,0.8],scale:0.8} ~-5 ~2 ~3 0.2 0.3 0.2 0 4 force
execute positioned ~-5 ~ ~3 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.2 0.5 0.2 0.03 3

# Draw hexagon wireframe (fire themed)
particle dust{color:[1.0,0.5,0.0],scale:0.6} ~2.5 ~ ~4 0.1 0.1 0.1 0 2 force
particle dust{color:[1.0,0.5,0.0],scale:0.6} ~-2.5 ~ ~4 0.1 0.1 0.1 0 2 force
particle dust{color:[1.0,0.5,0.0],scale:0.6} ~5 ~ ~0 0.1 0.1 0.1 0 2 force
particle dust{color:[1.0,0.5,0.0],scale:0.6} ~2.5 ~ ~-4 0.1 0.1 0.1 0 2 force
particle dust{color:[1.0,0.5,0.0],scale:0.6} ~-2.5 ~ ~-4 0.1 0.1 0.1 0 2 force
particle dust{color:[1.0,0.5,0.0],scale:0.6} ~-5 ~ ~0 0.1 0.1 0.1 0 2 force


