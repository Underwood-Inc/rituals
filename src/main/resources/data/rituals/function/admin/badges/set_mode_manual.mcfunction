# ========================================
# Set Badge Display Mode: Manual
# ========================================
# Only show badges when player runs check_status command

data modify storage rituals:config badge_config.display_mode set value "manual"
data modify storage rituals:config badge_config.show_in_tab set value false

# Hide tab display
scoreboard objectives setdisplay list

# Reload config
function rituals:badges/config

tellraw @a [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Badge display set to MANUAL mode","color":"green"}]
tellraw @a [{"text":"➜ ","color":"dark_gray"},{"text":"Players can view badges with ","color":"gray"},{"text":"/function rituals:badges/check_status","color":"aqua"}]

