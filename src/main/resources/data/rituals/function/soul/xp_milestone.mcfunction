# ========================================
# XP Milestone - Visual Feedback
# ========================================
# Shows feedback when XP is accumulated

# Particle effect
particle minecraft:enchanted_hit ~ ~1 ~ 0.3 0.3 0.3 0.1 5 normal @s
particle minecraft:soul ~ ~0.5 ~ 0.2 0.2 0.2 0.02 3 normal @s

# Sound feedback
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 0.3 1.5

# Show XP gain in actionbar
title @s actionbar [{"text":"✦ +","color":"light_purple"},{"score":{"name":"@s","objective":"rituals.soul_xp_gain"},"color":"aqua"},{"text":" Soul XP","color":"gray"}]

# Reset counter for next milestone
scoreboard players set @s rituals.soul_xp_gain 0
