# ========================================
# Visualize Pentagon Pattern (XP Harvester)
# ========================================
# Shows particle markers at 5 pentagon positions
# Color: Purple/Blue (XP/enchanting colors)
# Pattern: Pentagon (5 points around center)

# Visual feedback at center
particle minecraft:enchant ~ ~2.5 ~ 0.3 0.3 0.3 1 15
particle minecraft:glow ~ ~2.2 ~ 0.2 0.2 0.2 0 5

# Position 1 - North (0, 0, +5) - Lapis Lazuli
particle dust{color:[0.2,0.4,1.0],scale:1.2} ~ ~ ~5 0.3 0.5 0.3 0 8 force
particle dust{color:[0.2,0.4,1.0],scale:0.8} ~ ~1 ~5 0.2 0.3 0.2 0 4 force
particle dust{color:[0.2,0.4,1.0],scale:0.8} ~ ~2 ~5 0.2 0.3 0.2 0 4 force
execute positioned ~ ~ ~5 run particle minecraft:enchant ~ ~1 ~ 0.2 0.5 0.2 0.5 5

# Position 2 - Northeast (+5, 0, +2) - Book
particle dust{color:[0.9,0.9,0.9],scale:1.2} ~5 ~ ~2 0.3 0.5 0.3 0 8 force
particle dust{color:[0.9,0.9,0.9],scale:0.8} ~5 ~1 ~2 0.2 0.3 0.2 0 4 force
particle dust{color:[0.9,0.9,0.9],scale:0.8} ~5 ~2 ~2 0.2 0.3 0.2 0 4 force
execute positioned ~5 ~ ~2 run particle minecraft:enchant ~ ~1 ~ 0.2 0.5 0.2 0.5 5

# Position 3 - Southeast (+3, 0, -4) - Amethyst Shard
particle dust{color:[0.7,0.3,1.0],scale:1.2} ~3 ~ ~-4 0.3 0.5 0.3 0 8 force
particle dust{color:[0.7,0.3,1.0],scale:0.8} ~3 ~1 ~-4 0.2 0.3 0.2 0 4 force
particle dust{color:[0.7,0.3,1.0],scale:0.8} ~3 ~2 ~-4 0.2 0.3 0.2 0 4 force
execute positioned ~3 ~ ~-4 run particle minecraft:enchant ~ ~1 ~ 0.2 0.5 0.2 0.5 5

# Position 4 - Southwest (-3, 0, -4) - Quartz
particle dust{color:[1.0,1.0,1.0],scale:1.2} ~-3 ~ ~-4 0.3 0.5 0.3 0 8 force
particle dust{color:[1.0,1.0,1.0],scale:0.8} ~-3 ~1 ~-4 0.2 0.3 0.2 0 4 force
particle dust{color:[1.0,1.0,1.0],scale:0.8} ~-3 ~2 ~-4 0.2 0.3 0.2 0 4 force
execute positioned ~-3 ~ ~-4 run particle minecraft:enchant ~ ~1 ~ 0.2 0.5 0.2 0.5 5

# Position 5 - Northwest (-5, 0, +2) - Glowstone Dust
particle dust{color:[1.0,0.9,0.3],scale:1.2} ~-5 ~ ~2 0.3 0.5 0.3 0 8 force
particle dust{color:[1.0,0.9,0.3],scale:0.8} ~-5 ~1 ~2 0.2 0.3 0.2 0 4 force
particle dust{color:[1.0,0.9,0.3],scale:0.8} ~-5 ~2 ~2 0.2 0.3 0.2 0 4 force
execute positioned ~-5 ~ ~2 run particle minecraft:enchant ~ ~1 ~ 0.2 0.5 0.2 0.5 5

# Draw connection lines (pentagon outline - connecting adjacent points)
particle dust{color:[0.5,0.3,1.0],scale:0.6} ~2.5 ~ ~3.5 0.1 0.1 0.1 0 2 force
particle dust{color:[0.5,0.3,1.0],scale:0.6} ~4 ~ ~ 0.1 0.1 0.1 0 2 force
particle dust{color:[0.5,0.3,1.0],scale:0.6} ~ ~ ~-4 0.1 0.1 0.1 0 2 force
particle dust{color:[0.5,0.3,1.0],scale:0.6} ~-4 ~ ~ 0.1 0.1 0.1 0 2 force
particle dust{color:[0.5,0.3,1.0],scale:0.6} ~-2.5 ~ ~3.5 0.1 0.1 0.1 0 2 force

