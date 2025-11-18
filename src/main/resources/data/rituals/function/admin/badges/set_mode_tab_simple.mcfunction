# ========================================
# Set Badge Display Mode: Tab List
# ========================================
# Shows ritual count (0-8) in tab list - clear and intuitive!

data modify storage rituals:config badge_config.display_mode set value "tab"
data modify storage rituals:config badge_config.show_in_tab set value true

# Show in tab list - just ritual count, clear objective name
scoreboard objectives modify rituals.ritual_count displayname {"text":"⚡ Rituals","color":"gold"}
scoreboard objectives setdisplay list rituals.ritual_count

# Reload config
function rituals:badges/config

# Recalculate all badges
execute as @a run function rituals:badges/calculate_badge

tellraw @a [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Badge display set to TAB mode","color":"green"}]
tellraw @a [{"text":"➜ ","color":"dark_gray"},{"text":"Tab list shows ritual count (0-8) - clear and easy to understand!","color":"gray"}]

