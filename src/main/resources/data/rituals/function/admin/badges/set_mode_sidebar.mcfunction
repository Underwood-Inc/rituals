# ========================================
# Set Badge Display Mode: Sidebar
# ========================================
# Shows badge info in sidebar (right side of screen)

data modify storage rituals:config badge_config.display_mode set value "sidebar"
data modify storage rituals:config badge_config.show_in_tab set value true

# Show in sidebar
scoreboard objectives setdisplay sidebar rituals.badge_display

# Reload config
function rituals:badges/config

# Recalculate all badges
execute as @a run function rituals:badges/calculate_badge

tellraw @a [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Badge display set to SIDEBAR mode","color":"green"}]
tellraw @a [{"text":"➜ ","color":"dark_gray"},{"text":"Ritual mastery shown on right side of screen","color":"gray"}]
tellraw @a [{"text":"⚠ ","color":"yellow"},{"text":"Warning: May conflict with other sidebar scoreboards!","color":"gold"}]

