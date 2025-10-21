# ========================================
# Badge System Help
# ========================================
# Shows comprehensive help about the badge system

tellraw @s [{"text":""}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple"}]
tellraw @s [{"text":"⚡ ","color":"yellow"},{"text":"Ritual Badge System Help","color":"gold","bold":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple"}]
tellraw @s [{"text":""}]

tellraw @s [{"text":"What are Badges?","color":"yellow","bold":true}]
tellraw @s [{"text":"Badges show your ritual mastery progress:","color":"gray"}]
tellraw @s [{"text":"  • ","color":"dark_gray"},{"text":"Totem Tier","color":"aqua"},{"text":" - Highest totem crafted (Wood → Netherite)","color":"gray"}]
tellraw @s [{"text":"  • ","color":"dark_gray"},{"text":"Ritual Count","color":"aqua"},{"text":" - How many rituals completed (0-8)","color":"gray"}]
tellraw @s [{"text":""}]

tellraw @s [{"text":"Player Commands:","color":"green","bold":true}]
tellraw @s [{"text":"  ","color":"dark_gray"},{"text":"[Check Status]","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:badges/check_status"},"hover_event":{"action":"show_text","value":"Click to check"}},{"text":" - View your badge and progress","color":"gray"}]
tellraw @s [{"text":"  ","color":"dark_gray"},{"text":"[Hide Badge]","color":"red","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:badges/hide_badge"},"hover_event":{"action":"show_text","value":"Click to hide"}},{"text":" - Hide your badge (progress saved)","color":"gray"}]
tellraw @s [{"text":"  ","color":"dark_gray"},{"text":"[Show Badge]","color":"green","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:badges/show_badge"},"hover_event":{"action":"show_text","value":"Click to show"}},{"text":" - Show your badge again","color":"gray"}]
tellraw @s [{"text":""}]

execute if entity @s[tag=rituals.admin] run tellraw @s [{"text":"Admin Commands:","color":"red","bold":true}]
execute if entity @s[tag=rituals.admin] run tellraw @s [{"text":"  Choose Display Mode:","color":"yellow"}]
execute if entity @s[tag=rituals.admin] run tellraw @s [{"text":"    ","color":"dark_gray"},{"text":"[Manual]","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/badges/set_mode_manual"},"hover_event":{"action":"show_text","value":"Check command only"}},{"text":" - Command only (default)","color":"gray"}]
execute if entity @s[tag=rituals.admin] run tellraw @s [{"text":"    ","color":"dark_gray"},{"text":"[Tab]","color":"green","bold":true,"underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/badges/set_mode_tab_simple"},"hover_event":{"action":"show_text","value":"Shows ritual count"}},{"text":" - Show in tab list ⭐","color":"gray"}]
execute if entity @s[tag=rituals.admin] run tellraw @s [{"text":"    ","color":"dark_gray"},{"text":"[ActionBar]","color":"green","bold":true,"underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/badges/set_mode_actionbar"},"hover_event":{"action":"show_text","value":"Full text above hotbar"}},{"text":" - Above hotbar ⭐","color":"gray"}]
execute if entity @s[tag=rituals.admin] run tellraw @s [{"text":"    ","color":"dark_gray"},{"text":"[Sidebar]","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/badges/set_mode_sidebar"},"hover_event":{"action":"show_text","value":"Right side of screen"}},{"text":" - Right side","color":"gray"}]
execute if entity @s[tag=rituals.admin] run tellraw @s [{"text":"    ","color":"dark_gray"},{"text":"[Both]","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/badges/set_mode_both"},"hover_event":{"action":"show_text","value":"Tab + ActionBar"}},{"text":" - Tab + ActionBar","color":"gray"}]
execute if entity @s[tag=rituals.admin] run tellraw @s [{"text":"  ","color":"dark_gray"},{"text":"[Refresh All]","color":"gold","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/refresh_all_badges"},"hover_event":{"action":"show_text","value":"Click to refresh"}},{"text":" - Recalculate all player badges","color":"gray"}]
execute if entity @s[tag=rituals.admin] run tellraw @s [{"text":""}]

tellraw @s [{"text":"How to Earn Progress:","color":"yellow","bold":true}]
tellraw @s [{"text":"  • Craft higher tier totems (Wood → Netherite)","color":"gray"}]
tellraw @s [{"text":"  • Activate unique ritual types","color":"gray"}]
tellraw @s [{"text":"  • All players near ritual activation get credit!","color":"green"}]
tellraw @s [{"text":""}]

tellraw @s [{"text":"More Help:","color":"yellow","bold":true}]
tellraw @s [{"text":"  ","color":"dark_gray"},{"text":"[Main Help]","color":"green","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:help"},"hover_event":{"action":"show_text","value":"Click to view"}},{"text":" - All rituals commands","color":"gray"}]
tellraw @s [{"text":"  ","color":"dark_gray"},{"text":"[Documentation]","color":"aqua","underlined":true,"click_event":{"action":"open_url","url":"https://github.com/Underwood-Inc/rituals"},"hover_event":{"action":"show_text","value":"Opens in browser"}},{"text":" - Full badge guide","color":"gray"}]
tellraw @s [{"text":""}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple"}]

