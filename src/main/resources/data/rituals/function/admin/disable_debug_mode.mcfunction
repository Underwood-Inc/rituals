# ========================================
# Disable Debug Mode
# ========================================
# Hides debug messages and extra information

data modify storage rituals:config debug_mode set value false
function rituals:config/reload

tellraw @a [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"🔧 Debug Mode DISABLED","color":"red","bold":true}]
tellraw @a [{"text":"  ","color":"gray"},{"text":"→ Debug messages now hidden","color":"yellow"}]
tellraw @a [{"text":"  ","color":"gray"},{"text":"→ Clean gameplay experience","color":"yellow"}]
tellraw @a [{"text":"  ","color":"gray"},{"text":"[Click to Enable]","color":"green","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/enable_debug_mode"},"hover_event":{"action":"show_text","value":[{"text":"Enable debug messages"}]}}]

playsound block.note_block.bass master @a ~ ~ ~ 0.5 0.5
