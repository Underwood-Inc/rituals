# ========================================
# Rituals - Help Command
# ========================================
# Shows all available commands

tellraw @s [{"text":"\n=== Rituals Commands ===","color":"gold","bold":true}]
tellraw @s [{"text":"","color":"yellow"}]
tellraw @s [{"text":"  /function rituals:help","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:help"},"hover_event":{"action":"show_text","value":[{"text":"Click to run this command","color":"green"}]}},{"text":" - Show this help menu","color":"white"}]
tellraw @s [{"text":"  /function rituals:guidebook","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:give/guidebook"},"hover_event":{"action":"show_text","value":[{"text":"Click to get the guidebook","color":"green"}]}},{"text":" - Get the guidebook","color":"white"}]
tellraw @s [{"text":"  /function rituals:get","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/trigger rituals.menu"},"hover_event":{"action":"show_text","value":[{"text":"Click to open item menu","color":"green"}]}},{"text":" - Interactive item menu","color":"white"}]
tellraw @s [{"text":"","color":"yellow"}]
tellraw @s [{"text":"Admin Commands:","color":"red","bold":true}]
tellraw @s [{"text":"  /function rituals:admin/unlock_all_recipes","color":"dark_red","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/unlock_all_recipes"},"hover_event":{"action":"show_text","value":[{"text":"Click to unlock all recipes","color":"gold"}]}},{"text":" - Unlock all recipes","color":"gray"}]
tellraw @s [{"text":"  /function rituals:admin/list_totems","color":"dark_red","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/list_totems"},"hover_event":{"action":"show_text","value":[{"text":"Click to list nearby totems","color":"gold"}]}},{"text":" - List nearby totems","color":"gray"}]
tellraw @s [{"text":"  /function rituals:admin/reset_all","color":"dark_red","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/reset_all"},"hover_event":{"action":"show_text","value":[{"text":"Click to reset all rituals","color":"gold"}]}},{"text":" - Reset all rituals","color":"gray"}]
tellraw @s [{"text":"  /function rituals:admin/uninstall","color":"dark_red","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/uninstall"},"hover_event":{"action":"show_text","value":[{"text":"⚠ Click to uninstall datapack","color":"red"}]}},{"text":" - Uninstall datapack","color":"gray"}]
tellraw @s [{"text":"","color":"yellow"}]
tellraw @s [{"text":"🥝 Kiwi Mode: ","color":"green","bold":true},{"text":"[Enable]","color":"green","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/enable_kiwi_mode"},"hover_event":{"action":"show_text","value":[{"text":"Enable easy auto-activation","color":"yellow"}]}},{"text":" | ","color":"gray"},{"text":"[Disable]","color":"red","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/disable_kiwi_mode"},"hover_event":{"action":"show_text","value":[{"text":"Require fire sacrifice","color":"yellow"}]}}]
tellraw @s [{"text":"================================","color":"gold","bold":true}]
