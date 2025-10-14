# ========================================
# Disable Kiwi Mode (Require Fire Sacrifice)
# ========================================
# Fire sacrifice now required for ritual activation

data modify storage rituals:config kiwi_mode set value false
function rituals:config/reload

tellraw @a [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"🥝 Kiwi Mode DISABLED","color":"red","bold":true}]
tellraw @a [{"text":"  ","color":"gray"},{"text":"→ Fire sacrifice now required","color":"yellow"}]
tellraw @a [{"text":"  ","color":"gray"},{"text":"→ See ","color":"yellow"},{"text":"docs/FIRE_SACRIFICE_GUIDE.md","color":"aqua","underlined":true},{"text":" for details","color":"yellow"}]
tellraw @a [{"text":"  ","color":"gray"},{"text":"[Click to Enable]","color":"green","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/enable_kiwi_mode"},"hover_event":{"action":"show_text","value":[{"text":"Enable easy auto-activation"}]}}]

playsound block.fire.extinguish master @a ~ ~ ~ 1 1


