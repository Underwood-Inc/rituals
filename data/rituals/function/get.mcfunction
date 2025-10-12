# ========================================
# Interactive Item Selection
# ========================================
# Start the guided journey

tellraw @s [{"text":"\n=== Totem Rituals - Item Selection ===","color":"gold","bold":true}]
tellraw @s [{"text":"","color":"yellow"}]
tellraw @s [{"text":"What would you like to get?","color":"white","bold":true}]
tellraw @s [{"text":"","color":"yellow"}]

# Totem Bases
tellraw @s [{"text":"[Totem Bases] ","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function rituals:get/totems"},"hoverEvent":{"action":"show_text","contents":"Click to select totem tier and variant"}}]

# Ritual Paste
tellraw @s [{"text":"[Ritual Paste] ","color":"yellow","bold":true,"clickEvent":{"action":"run_command","value":"/function rituals:get/paste"},"hoverEvent":{"action":"show_text","contents":"Click to get Ritual Paste"}}]

# Upgrade Slates
tellraw @s [{"text":"[Upgrade Slates] ","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/function rituals:get/upgrade_slates"},"hoverEvent":{"action":"show_text","contents":"Click to select upgrade slate tier"}}]

# Guidebook
tellraw @s [{"text":"[Guidebook] ","color":"light_purple","bold":true,"clickEvent":{"action":"run_command","value":"/function rituals:guidebook"},"hoverEvent":{"action":"show_text","contents":"Click to get the Totem Rituals Guidebook"}}]

# All Items
tellraw @s [{"text":"","color":"yellow"}]
tellraw @s [{"text":"[Give Me Everything!] ","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/function rituals:give/all"},"hoverEvent":{"action":"show_text","contents":"Click to get all items (Creative/Testing)"}}]

tellraw @s [{"text":"================================","color":"gold","bold":true}]

