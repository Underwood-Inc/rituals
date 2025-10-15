# ========================================
# Spawn Detection Beam (MACRO)
# ========================================
# Parameters:
#   x, y, z: Position offsets from current location
#   r, g, b: RGB color values (0.0 to 1.0)
#   alpha: Transparency (0.0 to 1.0, lower = more transparent)
#
# Creates a vertical beam of particles to indicate valid item detection

# Spawn vertical beam particles (8 blocks tall, semi-transparent)
$execute positioned ~$(x) ~$(y) ~$(z) run particle dust{color:[$(r),$(g),$(b)],scale:0.8} ~ ~0.5 ~ 0.15 0.3 0.15 0 3 force
$execute positioned ~$(x) ~$(y) ~$(z) run particle dust{color:[$(r),$(g),$(b)],scale:0.8} ~ ~1.5 ~ 0.15 0.3 0.15 0 3 force
$execute positioned ~$(x) ~$(y) ~$(z) run particle dust{color:[$(r),$(g),$(b)],scale:0.8} ~ ~2.5 ~ 0.15 0.3 0.15 0 3 force
$execute positioned ~$(x) ~$(y) ~$(z) run particle dust{color:[$(r),$(g),$(b)],scale:0.8} ~ ~3.5 ~ 0.15 0.3 0.15 0 3 force
$execute positioned ~$(x) ~$(y) ~$(z) run particle dust{color:[$(r),$(g),$(b)],scale:0.8} ~ ~4.5 ~ 0.15 0.3 0.15 0 3 force
$execute positioned ~$(x) ~$(y) ~$(z) run particle dust{color:[$(r),$(g),$(b)],scale:0.8} ~ ~5.5 ~ 0.15 0.3 0.15 0 3 force
$execute positioned ~$(x) ~$(y) ~$(z) run particle dust{color:[$(r),$(g),$(b)],scale:0.8} ~ ~6.5 ~ 0.15 0.3 0.15 0 3 force
$execute positioned ~$(x) ~$(y) ~$(z) run particle dust{color:[$(r),$(g),$(b)],scale:0.8} ~ ~7.5 ~ 0.15 0.3 0.15 0 3 force

# Add some end_rod particles for extra effect (very sparse for translucency)
$execute positioned ~$(x) ~$(y) ~$(z) run particle end_rod ~ ~1 ~ 0.1 2 0.1 0.01 2 force

