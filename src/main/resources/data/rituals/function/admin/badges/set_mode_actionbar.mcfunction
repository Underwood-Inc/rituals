# ========================================
# Set Badge Display Mode: Action Bar
# ========================================
# Shows badge in action bar every 5 seconds

data modify storage rituals:config badge_config.display_mode set value "actionbar"
data modify storage rituals:config badge_config.show_in_tab set value false

# Hide tab display
scoreboard objectives setdisplay list

# Reload config
function rituals:badges/config

tellraw @a [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Badge display set to ACTION BAR mode","color":"green"}]
tellraw @a [{"text":"➜ ","color":"dark_gray"},{"text":"Badge will appear above your hotbar every 5 seconds","color":"gray"}]

