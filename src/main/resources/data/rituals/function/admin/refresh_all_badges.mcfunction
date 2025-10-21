# ========================================
# Refresh All Player Badges (Admin)
# ========================================
# Recalculates and updates badges for all online players

# Recalculate for all players
execute as @a run function rituals:badges/calculate_badge

# Feedback
tellraw @a [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"All player badges have been refreshed!","color":"green"}]
playsound entity.experience_orb.pickup master @a ~ ~ ~ 1.0 1.5

