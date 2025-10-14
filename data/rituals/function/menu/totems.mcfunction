# ========================================
# Totem Bases Submenu
# ========================================

# Set state
scoreboard players set @s rituals.menu_state 1

# Enable trigger
scoreboard players enable @s rituals.menu

# Display submenu
tellraw @s [{"text":"\n========================================","color":"gold","bold":true}]
tellraw @s [{"text":"         TOTEM BASES","color":"green","bold":true}]
tellraw @s [{"text":"========================================","color":"gold","bold":true}]
tellraw @s [{"text":""}]
tellraw @s [{"text":"  [Wood Totem (Tall)]","color":"#8B4513","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:give/totem_basic"},"hover_event":{"action":"show_text","value":[{"text":"Tier 1 - Growth Ritual","color":"green"}]}}]
tellraw @s [{"text":"  [Wood Totem (Short)]","color":"#8B4513","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:give/totem_basic_short"},"hover_event":{"action":"show_text","value":[{"text":"Tier 1 - Growth Ritual (Short)","color":"green"}]}}]
tellraw @s [{"text":"  [Copper Totem (Tall)]","color":"#FF6347","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:give/totem_copper"},"hover_event":{"action":"show_text","value":[{"text":"Tier 2 - Strength Ritual","color":"red"}]}}]
tellraw @s [{"text":"  [Copper Totem (Short)]","color":"#FF6347","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:give/totem_copper_short"},"hover_event":{"action":"show_text","value":[{"text":"Tier 2 - Strength Ritual (Short)","color":"red"}]}}]
tellraw @s [{"text":"  [Iron Totem (Tall)]","color":"#D8D8D8","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:give/totem_advanced"},"hover_event":{"action":"show_text","value":[{"text":"Tier 3 - Prosperity Ritual","color":"yellow"}]}}]
tellraw @s [{"text":"  [Iron Totem (Short)]","color":"#D8D8D8","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:give/totem_advanced_short"},"hover_event":{"action":"show_text","value":[{"text":"Tier 3 - Prosperity Ritual (Short)","color":"yellow"}]}}]
tellraw @s [{"text":"  [Gold Totem (Tall)]","color":"gold","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:give/totem_gold"},"hover_event":{"action":"show_text","value":[{"text":"Tier 4 - Protection Ritual","color":"blue"}]}}]
tellraw @s [{"text":"  [Gold Totem (Short)]","color":"gold","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:give/totem_gold_short"},"hover_event":{"action":"show_text","value":[{"text":"Tier 4 - Protection Ritual (Short)","color":"blue"}]}}]
tellraw @s [{"text":"  [Diamond Totem (Tall)]","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:give/totem_master"},"hover_event":{"action":"show_text","value":[{"text":"Tier 5 - Healing Ritual","color":"light_purple"}]}}]
tellraw @s [{"text":"  [Diamond Totem (Short)]","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:give/totem_master_short"},"hover_event":{"action":"show_text","value":[{"text":"Tier 5 - Healing Ritual (Short)","color":"light_purple"}]}}]
tellraw @s [{"text":"  [Netherite Totem (Tall)]","color":"dark_purple","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:give/totem_netherite"},"hover_event":{"action":"show_text","value":[{"text":"Tier 6 - Sentry Ritual","color":"dark_red"}]}}]
tellraw @s [{"text":"  [Netherite Totem (Short)]","color":"dark_purple","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:give/totem_netherite_short"},"hover_event":{"action":"show_text","value":[{"text":"Tier 6 - Sentry Ritual (Short)","color":"dark_red"}]}}]
tellraw @s [{"text":""}]
tellraw @s [{"text":"  [← Back to Main Menu]","color":"gray","underlined":true,"click_event":{"action":"run_command","command":"/trigger rituals.menu"},"hover_event":{"action":"show_text","value":[{"text":"Return to main menu","color":"gray"}]}}]
tellraw @s [{"text":"========================================","color":"gold","bold":true}]

