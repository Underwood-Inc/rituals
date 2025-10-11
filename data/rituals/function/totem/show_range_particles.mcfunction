# Draw tier-based forcefield effect
# Uses macro parameters: $neg_h, $neg_v, $box_h, $box_v

# FORCEFIELD EFFECT - walls of particles with pulsing glow
# Color: Cyan/Electric Blue for better visibility

# HORIZONTAL LINES - Draw continuous lines along all 12 edges
# Bottom edges (Y = neg_v)
$particle electric_spark ~$(neg_h) ~$(neg_v) ~$(neg_h) $(box_h) 0 0 0 15 force
$particle electric_spark ~$(neg_h) ~$(neg_v) ~$(box_h) $(box_h) 0 0 0 15 force
$particle electric_spark ~$(neg_h) ~$(neg_v) ~$(neg_h) 0 0 $(box_h) 0 15 force
$particle electric_spark ~$(box_h) ~$(neg_v) ~$(neg_h) 0 0 $(box_h) 0 15 force

# Top edges (Y = box_v)
$particle electric_spark ~$(neg_h) ~$(box_v) ~$(neg_h) $(box_h) 0 0 0 15 force
$particle electric_spark ~$(neg_h) ~$(box_v) ~$(box_h) $(box_h) 0 0 0 15 force
$particle electric_spark ~$(neg_h) ~$(box_v) ~$(neg_h) 0 0 $(box_h) 0 15 force
$particle electric_spark ~$(box_h) ~$(box_v) ~$(neg_h) 0 0 $(box_h) 0 15 force

# Vertical edges
$particle electric_spark ~$(neg_h) ~$(neg_v) ~$(neg_h) 0 $(box_v) 0 0 12 force
$particle electric_spark ~$(box_h) ~$(neg_v) ~$(neg_h) 0 $(box_v) 0 0 12 force
$particle electric_spark ~$(neg_h) ~$(neg_v) ~$(box_h) 0 $(box_v) 0 0 12 force
$particle electric_spark ~$(box_h) ~$(neg_v) ~$(box_h) 0 $(box_v) 0 0 12 force

# WALL GRIDS - Create a grid pattern on each face for forcefield effect
# North wall (Z = neg_h)
$particle dust{color:[0.0,1.0,1.0],scale:0.8} ~$(neg_h) ~ ~$(neg_h) $(box_h) $(box_v) 0 0 8 force
$particle dust{color:[0.0,1.0,1.0],scale:0.8} ~ ~$(neg_v) ~$(neg_h) $(box_h) $(box_v) 0 0 8 force

# South wall (Z = box_h)
$particle dust{color:[0.0,1.0,1.0],scale:0.8} ~$(neg_h) ~ ~$(box_h) $(box_h) $(box_v) 0 0 8 force
$particle dust{color:[0.0,1.0,1.0],scale:0.8} ~ ~$(neg_v) ~$(box_h) $(box_h) $(box_v) 0 0 8 force

# West wall (X = neg_h)
$particle dust{color:[0.0,1.0,1.0],scale:0.8} ~$(neg_h) ~ ~$(neg_h) 0 $(box_v) $(box_h) 0 8 force
$particle dust{color:[0.0,1.0,1.0],scale:0.8} ~$(neg_h) ~$(neg_v) ~ 0 $(box_v) $(box_h) 0 8 force

# East wall (X = box_h)
$particle dust{color:[0.0,1.0,1.0],scale:0.8} ~$(box_h) ~ ~$(neg_h) 0 $(box_v) $(box_h) 0 8 force
$particle dust{color:[0.0,1.0,1.0],scale:0.8} ~$(box_h) ~$(neg_v) ~ 0 $(box_v) $(box_h) 0 8 force

# CORNER HIGHLIGHTS - Bright glow at corners
$particle glow ~$(neg_h) ~$(neg_v) ~$(neg_h) 0 0 0 0 2 force
$particle glow ~$(box_h) ~$(neg_v) ~$(neg_h) 0 0 0 0 2 force
$particle glow ~$(neg_h) ~$(neg_v) ~$(box_h) 0 0 0 0 2 force
$particle glow ~$(box_h) ~$(neg_v) ~$(box_h) 0 0 0 0 2 force
$particle glow ~$(neg_h) ~$(box_v) ~$(neg_h) 0 0 0 0 2 force
$particle glow ~$(box_h) ~$(box_v) ~$(neg_h) 0 0 0 0 2 force
$particle glow ~$(neg_h) ~$(box_v) ~$(box_h) 0 0 0 0 2 force
$particle glow ~$(box_h) ~$(box_v) ~$(box_h) 0 0 0 0 2 force

