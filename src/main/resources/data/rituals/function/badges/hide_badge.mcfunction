# ========================================
# Hide Badge
# ========================================
# Allows player to hide their ritual badge

# Set display values to 0 (hides from scoreboards)
scoreboard players set @s rituals.badge_display 0

# Add hidden tag
tag @s add rituals.badge_hidden

# Feedback
tellraw @s [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Badge hidden! Your progress is saved.","color":"green"}]
tellraw @s [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Use ","color":"gray"},{"text":"/function rituals:badges/show_badge","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:badges/show_badge"},"hover_event":{"action":"show_text","value":"Click to show badge"}},{"text":" to show it again.","color":"gray"}]

