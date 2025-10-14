# ========================================
# Upgrade Slates Submenu
# ========================================

# Set state
scoreboard players set @s rituals.menu_state 3

# Enable trigger
scoreboard players enable @s rituals.menu

# Display submenu
tellraw @s [{"text":"\n========================================","color":"gold","bold":true}]
tellraw @s [{"text":"        UPGRADE SLATES","color":"aqua","bold":true}]
tellraw @s [{"text":"========================================","color":"gold","bold":true}]
tellraw @s [{"text":""}]
tellraw @s [{"text":"  [Copper Upgrade Slate]","color":"#FF6347","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:give/upgrade_slate_copper"},"hover_event":{"action":"show_text","value":[{"text":"Upgrade Wood → Copper (Tier 2)","color":"#FF6347"}]}}]
tellraw @s [{"text":"  [Iron Upgrade Slate]","color":"#D8D8D8","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:give/upgrade_slate_iron"},"hover_event":{"action":"show_text","value":[{"text":"Upgrade Copper → Iron (Tier 3)","color":"#D8D8D8"}]}}]
tellraw @s [{"text":"  [Gold Upgrade Slate]","color":"gold","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:give/upgrade_slate_gold"},"hover_event":{"action":"show_text","value":[{"text":"Upgrade Iron → Gold (Tier 4)","color":"gold"}]}}]
tellraw @s [{"text":"  [Diamond Upgrade Slate]","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:give/upgrade_slate_diamond"},"hover_event":{"action":"show_text","value":[{"text":"Upgrade Gold → Diamond (Tier 5)","color":"aqua"}]}}]
tellraw @s [{"text":"  [Netherite Upgrade Slate]","color":"dark_purple","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:give/upgrade_slate_netherite"},"hover_event":{"action":"show_text","value":[{"text":"Upgrade Diamond → Netherite (Tier 6)","color":"dark_purple"}]}}]
tellraw @s [{"text":"  [All Upgrade Slates]","color":"green","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:give/upgrade_slates"},"hover_event":{"action":"show_text","value":[{"text":"Get all upgrade slates at once!","color":"green"}]}}]
tellraw @s [{"text":""}]
tellraw @s [{"text":"  [← Back to Main Menu]","color":"gray","underlined":true,"click_event":{"action":"run_command","command":"/trigger rituals.menu"},"hover_event":{"action":"show_text","value":[{"text":"Return to main menu","color":"gray"}]}}]
tellraw @s [{"text":"========================================","color":"gold","bold":true}]

