# ========================================
# Visualize Soul Star Pattern (Soul Embodiment)
# ========================================
# Shows particle markers at 4 cardinal positions
# Colors: Purple/Cyan/Gold (soul magic colors)
# Pattern: 4 cardinals at 5 blocks distance

# South (0, 0, +5) - Soul Sand (brown/dark orange)
particle dust{color:[0.55,0.41,0.08],scale:1.2} ~ ~ ~5 0.3 0.5 0.3 0 8 force
particle dust{color:[0.55,0.41,0.08],scale:0.8} ~ ~1 ~5 0.2 0.3 0.2 0 4 force
particle dust{color:[0.55,0.41,0.08],scale:0.8} ~ ~2 ~5 0.2 0.3 0.2 0 4 force

# East (+5, 0, 0) - Ender Pearl (teal/cyan)
particle dust{color:[0.04,0.48,0.48],scale:1.2} ~5 ~ ~ 0.3 0.5 0.3 0 8 force
particle dust{color:[0.04,0.48,0.48],scale:0.8} ~5 ~1 ~ 0.2 0.3 0.2 0 4 force
particle dust{color:[0.04,0.48,0.48],scale:0.8} ~5 ~2 ~ 0.2 0.3 0.2 0 4 force

# North (0, 0, -5) - Glowstone Dust (yellow/gold)
particle dust{color:[1.0,0.8,0.0],scale:1.2} ~ ~ ~-5 0.3 0.5 0.3 0 8 force
particle dust{color:[1.0,0.8,0.0],scale:0.8} ~ ~1 ~-5 0.2 0.3 0.2 0 4 force
particle dust{color:[1.0,0.8,0.0],scale:0.8} ~ ~2 ~-5 0.2 0.3 0.2 0 4 force

# West (-5, 0, 0) - Amethyst Shard (purple)
particle dust{color:[0.6,0.4,0.8],scale:1.2} ~-5 ~ ~ 0.3 0.5 0.3 0 8 force
particle dust{color:[0.6,0.4,0.8],scale:0.8} ~-5 ~1 ~ 0.2 0.3 0.2 0 4 force
particle dust{color:[0.6,0.4,0.8],scale:0.8} ~-5 ~2 ~ 0.2 0.3 0.2 0 4 force

# Draw connection lines (cross pattern with soul colors)
particle soul ~ ~ ~2.5 0.1 0.3 0.1 0.01 2 force
particle soul ~ ~ ~-2.5 0.1 0.3 0.1 0.01 2 force
particle soul ~2.5 ~ ~ 0.1 0.3 0.1 0.01 2 force
particle soul ~-2.5 ~ ~ 0.1 0.3 0.1 0.01 2 force

# Central glow
particle minecraft:soul ~ ~2 ~ 0.2 0.3 0.2 0.01 3 force

