# ========================================
# Show Badge
# ========================================
# Re-enables badge display for player

# Remove hidden tag
tag @s remove rituals.badge_hidden

# Recalculate and assign badge
function rituals:badges/calculate_badge

# Feedback
tellraw @s [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Badge displayed!","color":"green"}]
tellraw @s [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Use ","color":"gray"},{"text":"/function rituals:badges/hide_badge","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:badges/hide_badge"},"hover_event":{"action":"show_text","value":"Click to hide badge"}},{"text":" to hide it.","color":"gray"}]

