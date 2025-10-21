# ========================================
# Pattern Configuration System
# ========================================
# Defines geometric patterns and item requirements for multi-totem rituals
#
# Pattern Types:
# 1. Star (4 totems) - Auto-Breeding
# 2. Pentagon (5 totems) - REMOVED
# 3. Hexagon (6 totems) - NOT IMPLEMENTED YET
# 4. Septagon (7 totems) - NOT IMPLEMENTED YET
# 5. Octagon (8 totems) - NOT IMPLEMENTED YET
# 6. Nonagon (9 totems) - NOT IMPLEMENTED YET
#
# Each pattern requires:
# - 1 central totem with specific item (determines ritual type)
# - N surrounding totems at specific positions with specific items
#
# ========================================

# Pattern detection distance tolerance (blocks)
scoreboard players set #pattern_tolerance rituals.data 1

# Initialize pattern validation scores
scoreboard players set #pattern_valid rituals.temp 0
scoreboard players set #totems_found rituals.temp 0


