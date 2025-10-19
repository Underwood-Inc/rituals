# ========================================
# Debug Status Command
# ========================================
# Shows current debug mode status and system information

# Get debug mode status
execute store result score #rituals_debug_mode rituals.data if data storage rituals:config {debug_mode:true}

tellraw @s [{"text":"\n=== RITUALS DEBUG STATUS ===","color":"gold","bold":true}]
tellraw @s [{"text":"","color":"white"}]

# Debug Mode Status
execute if score #rituals_debug_mode rituals.data matches 1 run tellraw @s [{"text":"🔧 Debug Mode: ","color":"aqua"},{"text":"ENABLED","color":"green","bold":true}]
execute if score #rituals_debug_mode rituals.data matches 0 run tellraw @s [{"text":"🔧 Debug Mode: ","color":"gray"},{"text":"DISABLED","color":"red","bold":true}]

# Kiwi Mode Status
execute store result score #kiwi_mode rituals.data if data storage rituals:config {kiwi_mode:true}
execute if score #kiwi_mode rituals.data matches 1 run tellraw @s [{"text":"🥝 Kiwi Mode: ","color":"green"},{"text":"ENABLED","color":"green","bold":true}]
execute if score #kiwi_mode rituals.data matches 0 run tellraw @s [{"text":"🥝 Kiwi Mode: ","color":"gray"},{"text":"DISABLED","color":"red","bold":true}]

# Fire Sacrifice Status
execute store result score #fire_sacrifice_mode rituals.data if data storage rituals:config {require_fire_sacrifice:true}
execute if score #fire_sacrifice_mode rituals.data matches 1 run tellraw @s [{"text":"🔥 Fire Sacrifice: ","color":"gold"},{"text":"REQUIRED","color":"red","bold":true}]
execute if score #fire_sacrifice_mode rituals.data matches 0 run tellraw @s [{"text":"🔥 Fire Sacrifice: ","color":"gray"},{"text":"NOT REQUIRED","color":"green","bold":true}]

tellraw @s [{"text":"","color":"white"}]
tellraw @s [{"text":"Commands:","color":"yellow","bold":true}]
tellraw @s [{"text":"  /function rituals:admin/enable_debug_mode","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/enable_debug_mode"},"hover_event":{"action":"show_text","value":[{"text":"Enable debug mode","color":"green"}]}},{"text":" - Enable debug mode","color":"white"}]
tellraw @s [{"text":"  /function rituals:admin/disable_debug_mode","color":"red","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/disable_debug_mode"},"hover_event":{"action":"show_text","value":[{"text":"Disable debug mode","color":"green"}]}},{"text":" - Disable debug mode","color":"white"}]
tellraw @s [{"text":"  /function rituals:admin/enable_kiwi_mode","color":"green","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/enable_kiwi_mode"},"hover_event":{"action":"show_text","value":[{"text":"Enable easy mode","color":"yellow"}]}},{"text":" - Enable Kiwi Mode","color":"white"}]
tellraw @s [{"text":"  /function rituals:admin/disable_kiwi_mode","color":"red","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/disable_kiwi_mode"},"hover_event":{"action":"show_text","value":[{"text":"Disable easy mode","color":"yellow"}]}},{"text":" - Disable Kiwi Mode","color":"white"}]
tellraw @s [{"text":"","color":"white"}]
tellraw @s [{"text":"================================","color":"gold","bold":true}]
