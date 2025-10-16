# ========================================
# Main Menu
# ========================================

# Initialize if needed
execute unless score @s rituals.menu_state matches 0.. run function rituals:menu/init

# Set state to main menu
scoreboard players set @s rituals.menu_state 0

# Enable trigger
scoreboard players enable @s rituals.menu

# Display menu
tellraw @s [{"text":"\n========================================","color":"gold","bold":true}]
tellraw @s [{"text":"        TOTEM RITUALS MENU","color":"dark_purple","bold":true}]
tellraw @s [{"text":"========================================","color":"gold","bold":true}]
tellraw @s [{"text":""}]
tellraw @s [{"text":"  [Totem Bases]","color":"green","underlined":true,"click_event":{"action":"run_command","command":"/trigger rituals.menu set 1"},"hover_event":{"action":"show_text","value":[{"text":"Click to browse totem bases","color":"green"}]}}]
tellraw @s [{"text":"  [Guidebook]","color":"light_purple","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:give/guidebook"},"hover_event":{"action":"show_text","value":[{"text":"Click to get the guidebook","color":"light_purple"}]}}]
tellraw @s [{"text":"  [Give Me Everything!]","color":"red","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:give/all"},"hover_event":{"action":"show_text","value":[{"text":"Click to get all items","color":"red"}]}}]
tellraw @s [{"text":""}]
tellraw @s [{"text":"========================================","color":"gold","bold":true}]

