# ========================================
# Pattern Configuration System
# ========================================
# Defines geometric patterns and item requirements for multi-totem rituals
#
# Pattern Types:
# 1. Square (4 totems) - Enchanting Nexus
# 2. Pentagon (5 totems) - XP Harvester, Auto-Breeding
# 3. Hexagon (6 totems) - Item Vacuum, Auto-Smelting
# 4. Septagon (7 totems) - Flight Zone, Weather Control
# 5. Octagon (8 totems) - Forcefield, Mob Repellent
# 6. Nonagon (9 totems) - Time Warp
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


