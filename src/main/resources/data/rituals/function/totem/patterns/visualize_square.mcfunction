# ========================================
# Visualize Square Pattern (Auto-Farming)
# ========================================
# Shows particle markers at 4 corner positions
# Color: Green/Brown (farming colors)
# Pattern: 4 corners at 5 blocks diagonally

# NE Corner (+5, 0, +5) - Wheat
particle dust{color:[0.9,0.8,0.2],scale:1.2} ~5 ~ ~5 0.3 0.5 0.3 0 8 force
particle dust{color:[0.9,0.8,0.2],scale:0.8} ~5 ~1 ~5 0.2 0.3 0.2 0 4 force
particle dust{color:[0.9,0.8,0.2],scale:0.8} ~5 ~2 ~5 0.2 0.3 0.2 0 4 force

# SE Corner (+5, 0, -5) - Carrot
particle dust{color:[1.0,0.5,0.1],scale:1.2} ~5 ~ ~-5 0.3 0.5 0.3 0 8 force
particle dust{color:[1.0,0.5,0.1],scale:0.8} ~5 ~1 ~-5 0.2 0.3 0.2 0 4 force
particle dust{color:[1.0,0.5,0.1],scale:0.8} ~5 ~2 ~-5 0.2 0.3 0.2 0 4 force

# SW Corner (-5, 0, -5) - Potato
particle dust{color:[0.8,0.7,0.5],scale:1.2} ~-5 ~ ~-5 0.3 0.5 0.3 0 8 force
particle dust{color:[0.8,0.7,0.5],scale:0.8} ~-5 ~1 ~-5 0.2 0.3 0.2 0 4 force
particle dust{color:[0.8,0.7,0.5],scale:0.8} ~-5 ~2 ~-5 0.2 0.3 0.2 0 4 force

# NW Corner (-5, 0, +5) - Beetroot
particle dust{color:[0.7,0.1,0.2],scale:1.2} ~-5 ~ ~5 0.3 0.5 0.3 0 8 force
particle dust{color:[0.7,0.1,0.2],scale:0.8} ~-5 ~1 ~5 0.2 0.3 0.2 0 4 force
particle dust{color:[0.7,0.1,0.2],scale:0.8} ~-5 ~2 ~5 0.2 0.3 0.2 0 4 force

# Draw connection lines (square outline)
particle dust{color:[0.5,0.8,0.2],scale:0.6} ~2.5 ~ ~2.5 0.1 0.1 0.1 0 2 force
particle dust{color:[0.5,0.8,0.2],scale:0.6} ~2.5 ~ ~-2.5 0.1 0.1 0.1 0 2 force
particle dust{color:[0.5,0.8,0.2],scale:0.6} ~-2.5 ~ ~2.5 0.1 0.1 0.1 0 2 force
particle dust{color:[0.5,0.8,0.2],scale:0.6} ~-2.5 ~ ~-2.5 0.1 0.1 0.1 0 2 force


