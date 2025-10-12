# ========================================
# Totem Selection Menu
# ========================================

tellraw @s [{"text":"\n=== Select Totem Tier ===","color":"gold","bold":true}]
tellraw @s [{"text":"","color":"yellow"}]

# Tier 1 - Wood
tellraw @s [{"text":"[Wood Totem] ","color":"#8B4513","bold":true,"clickEvent":{"action":"run_command","value":"/function rituals:get/totems_wood"},"hoverEvent":{"action":"show_text","contents":"Tier 1 - Basic Range"}}]

# Tier 2 - Copper
tellraw @s [{"text":"[Copper Totem] ","color":"#FF6347","bold":true,"clickEvent":{"action":"run_command","value":"/function rituals:get/totems_copper"},"hoverEvent":{"action":"show_text","contents":"Tier 2 - Improved Range"}}]

# Tier 3 - Iron
tellraw @s [{"text":"[Iron Totem] ","color":"#D8D8D8","bold":true,"clickEvent":{"action":"run_command","value":"/function rituals:get/totems_iron"},"hoverEvent":{"action":"show_text","contents":"Tier 3 - Good Range"}}]

# Tier 4 - Gold
tellraw @s [{"text":"[Gold Totem] ","color":"gold","bold":true,"clickEvent":{"action":"run_command","value":"/function rituals:get/totems_gold"},"hoverEvent":{"action":"show_text","contents":"Tier 4 - Great Range"}}]

# Tier 5 - Diamond
tellraw @s [{"text":"[Diamond Totem] ","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/function rituals:get/totems_diamond"},"hoverEvent":{"action":"show_text","contents":"Tier 5 - Excellent Range"}}]

# Tier 6 - Netherite
tellraw @s [{"text":"[Netherite Totem] ","color":"dark_purple","bold":true,"clickEvent":{"action":"run_command","value":"/function rituals:get/totems_netherite"},"hoverEvent":{"action":"show_text","contents":"Tier 6 - Maximum Range"}}]

tellraw @s [{"text":"","color":"yellow"}]
tellraw @s [{"text":"[← Back]","color":"gray","clickEvent":{"action":"run_command","value":"/function rituals:get"},"hoverEvent":{"action":"show_text","contents":"Back to main menu"}}]

