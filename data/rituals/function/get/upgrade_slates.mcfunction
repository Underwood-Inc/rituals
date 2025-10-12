# ========================================
# Upgrade Slate Selection Menu
# ========================================

tellraw @s [{"text":"\n=== Select Upgrade Slate Tier ===","color":"gold","bold":true}]
tellraw @s [{"text":"","color":"yellow"}]

tellraw @s [{"text":"[Copper Upgrade Slate] ","color":"#FF6347","bold":true,"clickEvent":{"action":"run_command","value":"/function rituals:give/upgrade_slate_copper"},"hoverEvent":{"action":"show_text","contents":"Upgrade Wood → Copper"}}]

tellraw @s [{"text":"[Iron Upgrade Slate] ","color":"#D8D8D8","bold":true,"clickEvent":{"action":"run_command","value":"/function rituals:give/upgrade_slate_iron"},"hoverEvent":{"action":"show_text","contents":"Upgrade Copper → Iron"}}]

tellraw @s [{"text":"[Gold Upgrade Slate] ","color":"gold","bold":true,"clickEvent":{"action":"run_command","value":"/function rituals:give/upgrade_slate_gold"},"hoverEvent":{"action":"show_text","contents":"Upgrade Iron → Gold"}}]

tellraw @s [{"text":"[Diamond Upgrade Slate] ","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/function rituals:give/upgrade_slate_diamond"},"hoverEvent":{"action":"show_text","contents":"Upgrade Gold → Diamond"}}]

tellraw @s [{"text":"[Netherite Upgrade Slate] ","color":"dark_purple","bold":true,"clickEvent":{"action":"run_command","value":"/function rituals:give/upgrade_slate_netherite"},"hoverEvent":{"action":"show_text","contents":"Upgrade Diamond → Netherite"}}]

tellraw @s [{"text":"","color":"yellow"}]
tellraw @s [{"text":"[All Upgrade Slates] ","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function rituals:give/upgrade_slates"},"hoverEvent":{"action":"show_text","contents":"Get all 5 upgrade slates"}}]

tellraw @s [{"text":"","color":"yellow"}]
tellraw @s [{"text":"[← Back]","color":"gray","clickEvent":{"action":"run_command","value":"/function rituals:get"},"hoverEvent":{"action":"show_text","contents":"Back to main menu"}}]

