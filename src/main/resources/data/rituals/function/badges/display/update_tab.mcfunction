# ========================================
# Update Tab List Display
# ========================================
# Shows badge info in tab list using scoreboard

# Calculate display value: (tier * 10) + ritual_count
# This gives us values like: 13 = Tier 1, 3 rituals | 68 = Tier 6, 8 rituals
scoreboard players operation @s rituals.badge_display = @s rituals.badge_tier
scoreboard players operation @s rituals.badge_display *= #10 rituals.data
scoreboard players operation @s rituals.badge_display += @s rituals.ritual_count

# If tier_only mode, just show tier
execute if score #badge_tier_only rituals.data matches 1 run scoreboard players operation @s rituals.badge_display = @s rituals.badge_tier

