# ========================================
# Debug Status Command
# ========================================
# Shows current debug mode status and system information

# Get debug mode status
execute store result score #debug_mode rituals.data if data storage rituals:config {debug_mode:true}

tellraw @s [{"text":"\n=== RITUALS DEBUG STATUS ===","color":"gold","bold":true}]
tellraw @s [{"text":"","color":"white"}]

# Debug Mode Status
execute if score #debug_mode rituals.data matches 1 run tellraw @s [{"text":"🔧 Debug Mode: ","color":"aqua"},{"text":"ENABLED","color":"green","bold":true}]
execute if score #debug_mode rituals.data matches 0 run tellraw @s [{"text":"🔧 Debug Mode: ","color":"gray"},{"text":"DISABLED","color":"red","bold":true}]

# Kiwi Mode Status
execute store result score #kiwi_mode rituals.data if data storage rituals:config {kiwi_mode:true}
execute if score #kiwi_mode rituals.data matches 1 run tellraw @s [{"text":"🥝 Kiwi Mode: ","color":"green"},{"text":"ENABLED","color":"green","bold":true}]
execute if score #kiwi_mode rituals.data matches 0 run tellraw @s [{"text":"🥝 Kiwi Mode: ","color":"gray"},{"text":"DISABLED","color":"red","bold":true}]

# Fire Sacrifice Status
execute store result score #fire_sacrifice_mode rituals.data if data storage rituals:config {require_fire_sacrifice:true}
execute if score #fire_sacrifice_mode rituals.data matches 1 run tellraw @s [{"text":"🔥 Fire Sacrifice: ","color":"orange"},{"text":"REQUIRED","color":"orange","bold":true}]
execute if score #fire_sacrifice_mode rituals.data matches 0 run tellraw @s [{"text":"🔥 Fire Sacrifice: ","color":"gray"},{"text":"NOT REQUIRED","color":"green","bold":true}]

tellraw @s [{"text":"","color":"white"}]
tellraw @s [{"text":"Commands:","color":"yellow","bold":true}]
tellraw @s [{"text":"  /function rituals:admin/toggle_debug","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/toggle_debug"},"hover_event":{"action":"show_text","value":[{"text":"Toggle debug mode","color":"green"}]}},{"text":" - Toggle debug mode","color":"white"}]
tellraw @s [{"text":"  /function rituals:admin/enable_kiwi_mode","color":"green","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/enable_kiwi_mode"},"hover_event":{"action":"show_text","value":[{"text":"Enable easy mode","color":"yellow"}]}},{"text":" - Enable Kiwi Mode","color":"white"}]
tellraw @s [{"text":"  /function rituals:admin/disable_kiwi_mode","color":"red","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/disable_kiwi_mode"},"hover_event":{"action":"show_text","value":[{"text":"Disable easy mode","color":"yellow"}]}},{"text":" - Disable Kiwi Mode","color":"white"}]
tellraw @s [{"text":"","color":"white"}]
tellraw @s [{"text":"================================","color":"gold","bold":true}]
