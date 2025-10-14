# ========================================
# Enable Kiwi Mode (Easy Auto-Activation)
# ========================================
# No fire sacrifice required - rituals activate automatically!

data modify storage rituals:config kiwi_mode set value true
function rituals:config/reload

tellraw @a [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"🥝 Kiwi Mode ENABLED!","color":"green","bold":true}]
tellraw @a [{"text":"  ","color":"gray"},{"text":"→ Rituals now activate automatically","color":"yellow"}]
tellraw @a [{"text":"  ","color":"gray"},{"text":"→ No fire sacrifice required!","color":"yellow"}]
tellraw @a [{"text":"  ","color":"gray"},{"text":"[Click to Disable]","color":"red","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/disable_kiwi_mode"},"hover_event":{"action":"show_text","value":[{"text":"Require fire sacrifice again"}]}}]

playsound entity.player.levelup master @a ~ ~ ~ 1 1.5


