# ========================================
# Visualize Hexagon Pattern (Item Vacuum)
# ========================================
# Shows particle markers at 6 hexagon positions
# Color: Purple/Portal colors (teleportation theme)
# Pattern: 6 points around center at 6 blocks radius

# Visual feedback at center
particle minecraft:portal ~ ~2.5 ~ 0.3 0.3 0.3 1 10
particle minecraft:reverse_portal ~ ~2.2 ~ 0.2 0.2 0.2 0.1 5

# North (0, 0, +6) - Ender Pearl
particle dust{color:[0.3,0.8,0.5],scale:1.2} ~ ~ ~6 0.3 0.5 0.3 0 8 force
particle dust{color:[0.3,0.8,0.5],scale:0.8} ~ ~1 ~6 0.2 0.3 0.2 0 4 force
particle dust{color:[0.3,0.8,0.5],scale:0.8} ~ ~2 ~6 0.2 0.3 0.2 0 4 force
execute positioned ~ ~ ~6 run particle minecraft:portal ~ ~1 ~ 0.2 0.5 0.2 0.5 3

# NE (+5, 0, +3) - Iron Ingot (Magnet)
particle dust{color:[0.7,0.7,0.7],scale:1.2} ~5 ~ ~3 0.3 0.5 0.3 0 8 force
particle dust{color:[0.7,0.7,0.7],scale:0.8} ~5 ~1 ~3 0.2 0.3 0.2 0 4 force
particle dust{color:[0.7,0.7,0.7],scale:0.8} ~5 ~2 ~3 0.2 0.3 0.2 0 4 force
execute positioned ~5 ~ ~3 run particle minecraft:portal ~ ~1 ~ 0.2 0.5 0.2 0.5 3

# SE (+5, 0, -3) - Redstone Dust
particle dust{color:[1.0,0.2,0.2],scale:1.2} ~5 ~ ~-3 0.3 0.5 0.3 0 8 force
particle dust{color:[1.0,0.2,0.2],scale:0.8} ~5 ~1 ~-3 0.2 0.3 0.2 0 4 force
particle dust{color:[1.0,0.2,0.2],scale:0.8} ~5 ~2 ~-3 0.2 0.3 0.2 0 4 force
execute positioned ~5 ~ ~-3 run particle minecraft:portal ~ ~1 ~ 0.2 0.5 0.2 0.5 3

# South (0, 0, -6) - Dropper
particle dust{color:[0.5,0.5,0.5],scale:1.2} ~ ~ ~-6 0.3 0.5 0.3 0 8 force
particle dust{color:[0.5,0.5,0.5],scale:0.8} ~ ~1 ~-6 0.2 0.3 0.2 0 4 force
particle dust{color:[0.5,0.5,0.5],scale:0.8} ~ ~2 ~-6 0.2 0.3 0.2 0 4 force
execute positioned ~ ~ ~-6 run particle minecraft:portal ~ ~1 ~ 0.2 0.5 0.2 0.5 3

# SW (-5, 0, -3) - Chest
particle dust{color:[0.6,0.4,0.2],scale:1.2} ~-5 ~ ~-3 0.3 0.5 0.3 0 8 force
particle dust{color:[0.6,0.4,0.2],scale:0.8} ~-5 ~1 ~-3 0.2 0.3 0.2 0 4 force
particle dust{color:[0.6,0.4,0.2],scale:0.8} ~-5 ~2 ~-3 0.2 0.3 0.2 0 4 force
execute positioned ~-5 ~ ~-3 run particle minecraft:portal ~ ~1 ~ 0.2 0.5 0.2 0.5 3

# NW (-5, 0, +3) - Observer
particle dust{color:[0.3,0.3,0.3],scale:1.2} ~-5 ~ ~3 0.3 0.5 0.3 0 8 force
particle dust{color:[0.3,0.3,0.3],scale:0.8} ~-5 ~1 ~3 0.2 0.3 0.2 0 4 force
particle dust{color:[0.3,0.3,0.3],scale:0.8} ~-5 ~2 ~3 0.2 0.3 0.2 0 4 force
execute positioned ~-5 ~ ~3 run particle minecraft:portal ~ ~1 ~ 0.2 0.5 0.2 0.5 3

# Draw hexagon wireframe
particle dust{color:[0.5,0.3,0.8],scale:0.6} ~2.5 ~ ~4 0.1 0.1 0.1 0 2 force
particle dust{color:[0.5,0.3,0.8],scale:0.6} ~-2.5 ~ ~4 0.1 0.1 0.1 0 2 force
particle dust{color:[0.5,0.3,0.8],scale:0.6} ~5 ~ ~0 0.1 0.1 0.1 0 2 force
particle dust{color:[0.5,0.3,0.8],scale:0.6} ~2.5 ~ ~-4 0.1 0.1 0.1 0 2 force
particle dust{color:[0.5,0.3,0.8],scale:0.6} ~-2.5 ~ ~-4 0.1 0.1 0.1 0 2 force
particle dust{color:[0.5,0.3,0.8],scale:0.6} ~-5 ~ ~0 0.1 0.1 0.1 0 2 force


