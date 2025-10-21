# ========================================
# Assign Player to Badge Team
# ========================================
# Runs as a player after calculate_badge has set their tier and ritual count

# Store current team assignment for comparison
execute store result score #old_badge_tier rituals.temp run scoreboard players get @s rituals.badge_tier
execute store result score #old_ritual_count rituals.temp run scoreboard players get @s rituals.ritual_count

# ========================================
# TIER 1: WOOD
# ========================================
execute if score @s rituals.badge_tier matches 1 if score @s rituals.ritual_count matches 0 run team join rituals.wood_0 @s
execute if score @s rituals.badge_tier matches 1 if score @s rituals.ritual_count matches 1 run team join rituals.wood_1 @s
execute if score @s rituals.badge_tier matches 1 if score @s rituals.ritual_count matches 2 run team join rituals.wood_2 @s
execute if score @s rituals.badge_tier matches 1 if score @s rituals.ritual_count matches 3 run team join rituals.wood_3 @s
execute if score @s rituals.badge_tier matches 1 if score @s rituals.ritual_count matches 4 run team join rituals.wood_4 @s
execute if score @s rituals.badge_tier matches 1 if score @s rituals.ritual_count matches 5 run team join rituals.wood_5 @s
execute if score @s rituals.badge_tier matches 1 if score @s rituals.ritual_count matches 6 run team join rituals.wood_6 @s
execute if score @s rituals.badge_tier matches 1 if score @s rituals.ritual_count matches 7 run team join rituals.wood_7 @s
execute if score @s rituals.badge_tier matches 1 if score @s rituals.ritual_count matches 8 run team join rituals.wood_8 @s

# ========================================
# TIER 2: COPPER
# ========================================
execute if score @s rituals.badge_tier matches 2 if score @s rituals.ritual_count matches 0 run team join rituals.copper_0 @s
execute if score @s rituals.badge_tier matches 2 if score @s rituals.ritual_count matches 1 run team join rituals.copper_1 @s
execute if score @s rituals.badge_tier matches 2 if score @s rituals.ritual_count matches 2 run team join rituals.copper_2 @s
execute if score @s rituals.badge_tier matches 2 if score @s rituals.ritual_count matches 3 run team join rituals.copper_3 @s
execute if score @s rituals.badge_tier matches 2 if score @s rituals.ritual_count matches 4 run team join rituals.copper_4 @s
execute if score @s rituals.badge_tier matches 2 if score @s rituals.ritual_count matches 5 run team join rituals.copper_5 @s
execute if score @s rituals.badge_tier matches 2 if score @s rituals.ritual_count matches 6 run team join rituals.copper_6 @s
execute if score @s rituals.badge_tier matches 2 if score @s rituals.ritual_count matches 7 run team join rituals.copper_7 @s
execute if score @s rituals.badge_tier matches 2 if score @s rituals.ritual_count matches 8 run team join rituals.copper_8 @s

# ========================================
# TIER 3: IRON
# ========================================
execute if score @s rituals.badge_tier matches 3 if score @s rituals.ritual_count matches 0 run team join rituals.iron_0 @s
execute if score @s rituals.badge_tier matches 3 if score @s rituals.ritual_count matches 1 run team join rituals.iron_1 @s
execute if score @s rituals.badge_tier matches 3 if score @s rituals.ritual_count matches 2 run team join rituals.iron_2 @s
execute if score @s rituals.badge_tier matches 3 if score @s rituals.ritual_count matches 3 run team join rituals.iron_3 @s
execute if score @s rituals.badge_tier matches 3 if score @s rituals.ritual_count matches 4 run team join rituals.iron_4 @s
execute if score @s rituals.badge_tier matches 3 if score @s rituals.ritual_count matches 5 run team join rituals.iron_5 @s
execute if score @s rituals.badge_tier matches 3 if score @s rituals.ritual_count matches 6 run team join rituals.iron_6 @s
execute if score @s rituals.badge_tier matches 3 if score @s rituals.ritual_count matches 7 run team join rituals.iron_7 @s
execute if score @s rituals.badge_tier matches 3 if score @s rituals.ritual_count matches 8 run team join rituals.iron_8 @s

# ========================================
# TIER 4: GOLD
# ========================================
execute if score @s rituals.badge_tier matches 4 if score @s rituals.ritual_count matches 0 run team join rituals.gold_0 @s
execute if score @s rituals.badge_tier matches 4 if score @s rituals.ritual_count matches 1 run team join rituals.gold_1 @s
execute if score @s rituals.badge_tier matches 4 if score @s rituals.ritual_count matches 2 run team join rituals.gold_2 @s
execute if score @s rituals.badge_tier matches 4 if score @s rituals.ritual_count matches 3 run team join rituals.gold_3 @s
execute if score @s rituals.badge_tier matches 4 if score @s rituals.ritual_count matches 4 run team join rituals.gold_4 @s
execute if score @s rituals.badge_tier matches 4 if score @s rituals.ritual_count matches 5 run team join rituals.gold_5 @s
execute if score @s rituals.badge_tier matches 4 if score @s rituals.ritual_count matches 6 run team join rituals.gold_6 @s
execute if score @s rituals.badge_tier matches 4 if score @s rituals.ritual_count matches 7 run team join rituals.gold_7 @s
execute if score @s rituals.badge_tier matches 4 if score @s rituals.ritual_count matches 8 run team join rituals.gold_8 @s

# ========================================
# TIER 5: DIAMOND
# ========================================
execute if score @s rituals.badge_tier matches 5 if score @s rituals.ritual_count matches 0 run team join rituals.diamond_0 @s
execute if score @s rituals.badge_tier matches 5 if score @s rituals.ritual_count matches 1 run team join rituals.diamond_1 @s
execute if score @s rituals.badge_tier matches 5 if score @s rituals.ritual_count matches 2 run team join rituals.diamond_2 @s
execute if score @s rituals.badge_tier matches 5 if score @s rituals.ritual_count matches 3 run team join rituals.diamond_3 @s
execute if score @s rituals.badge_tier matches 5 if score @s rituals.ritual_count matches 4 run team join rituals.diamond_4 @s
execute if score @s rituals.badge_tier matches 5 if score @s rituals.ritual_count matches 5 run team join rituals.diamond_5 @s
execute if score @s rituals.badge_tier matches 5 if score @s rituals.ritual_count matches 6 run team join rituals.diamond_6 @s
execute if score @s rituals.badge_tier matches 5 if score @s rituals.ritual_count matches 7 run team join rituals.diamond_7 @s
execute if score @s rituals.badge_tier matches 5 if score @s rituals.ritual_count matches 8 run team join rituals.diamond_8 @s

# ========================================
# TIER 6: NETHERITE
# ========================================
execute if score @s rituals.badge_tier matches 6 if score @s rituals.ritual_count matches 0 run team join rituals.netherite_0 @s
execute if score @s rituals.badge_tier matches 6 if score @s rituals.ritual_count matches 1 run team join rituals.netherite_1 @s
execute if score @s rituals.badge_tier matches 6 if score @s rituals.ritual_count matches 2 run team join rituals.netherite_2 @s
execute if score @s rituals.badge_tier matches 6 if score @s rituals.ritual_count matches 3 run team join rituals.netherite_3 @s
execute if score @s rituals.badge_tier matches 6 if score @s rituals.ritual_count matches 4 run team join rituals.netherite_4 @s
execute if score @s rituals.badge_tier matches 6 if score @s rituals.ritual_count matches 5 run team join rituals.netherite_5 @s
execute if score @s rituals.badge_tier matches 6 if score @s rituals.ritual_count matches 6 run team join rituals.netherite_6 @s
execute if score @s rituals.badge_tier matches 6 if score @s rituals.ritual_count matches 7 run team join rituals.netherite_7 @s
execute if score @s rituals.badge_tier matches 6 if score @s rituals.ritual_count matches 8 run team join rituals.netherite_8 @s

