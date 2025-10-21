# ========================================
# Set Badge Display Mode: Both
# ========================================
# Shows badge in both tab list AND action bar

data modify storage rituals:config badge_config.display_mode set value "both"
data modify storage rituals:config badge_config.show_in_tab set value true

# Show in tab list
scoreboard objectives setdisplay list rituals.badge_display

# Reload config
function rituals:badges/config

# Recalculate all badges
execute as @a run function rituals:badges/calculate_badge

tellraw @a [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Badge display set to BOTH modes","color":"green"}]
tellraw @a [{"text":"➜ ","color":"dark_gray"},{"text":"Badge visible in tab list AND action bar","color":"gray"}]

