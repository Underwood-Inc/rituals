# ========================================
# Upgrade failed - wrong tier
# ========================================

# Feedback for different failure reasons
execute if score #tier_diff rituals.temp matches ..0 run tellraw @p[distance=..5] [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"This totem is already at or above that tier!","color":"red"}]
execute if score #tier_diff rituals.temp matches 2.. run tellraw @p[distance=..5] [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"Cannot skip tiers! Upgrade one tier at a time.","color":"red"}]

# Error sound
playsound entity.villager.no block @p[distance=..5] ~ ~ ~ 1.0 1.0
particle smoke ~ ~1 ~ 0.3 0.5 0.3 0.01 10

