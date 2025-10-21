# ========================================
# Player Join Detection
# ========================================
# Runs for players who just joined the server
# Assigns initial badge based on their advancement progress

# Calculate their badge
function rituals:badges/calculate_badge

# Reset the join detection score (will be set back when they leave and rejoin)
scoreboard players set @s rituals.join_detect 0

# Welcome message with badge info
tellraw @s [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Your ritual badge has been updated!","color":"green"}]

