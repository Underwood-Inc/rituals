# ========================================
# Enable Debug Mode
# ========================================
# Shows debug messages and extra information

data modify storage rituals:config debug_mode set value true
function rituals:config/reload

tellraw @a [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"🔧 Debug Mode ENABLED!","color":"green","bold":true}]
tellraw @a [{"text":"  ","color":"gray"},{"text":"→ Debug messages now visible","color":"yellow"}]
tellraw @a [{"text":"  ","color":"gray"},{"text":"→ Extra ritual information shown","color":"yellow"}]
tellraw @a [{"text":"  ","color":"gray"},{"text":"[Click to Disable]","color":"red","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/disable_debug_mode"},"hover_event":{"action":"show_text","value":[{"text":"Disable debug messages"}]}}]

playsound block.note_block.bell master @a ~ ~ ~ 0.5 2.0
