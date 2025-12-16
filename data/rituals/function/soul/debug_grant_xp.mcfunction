# ========================================
# DEBUG: Manually Grant 10 XP
# ========================================
# Run this while holding a soul weapon to test XP awarding
# Usage: /function rituals:soul/debug_grant_xp

execute unless data entity @s SelectedItem.components."minecraft:custom_data".soul_embodied run tellraw @s [{"text":"❌ Not holding a soul weapon!","color":"red"}]
execute unless data entity @s SelectedItem.components."minecraft:custom_data".soul_embodied run return 0

scoreboard players set #xp_gain rituals.soul_temp 10
function rituals:soul/award_xp

tellraw @s [{"text":"✓ Granted 10 XP manually. Pending XP: ","color":"green"},{"score":{"name":"@s","objective":"rituals.soul_xp_gain"},"color":"aqua"}]
tellraw @s [{"text":"Place item on totem to sync!","color":"gray"}]

