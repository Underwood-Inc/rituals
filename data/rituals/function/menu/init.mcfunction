# ========================================
# Initialize Menu System
# ========================================
# Sets up scoreboards for menu tracking

# Create trigger scoreboard for player input
scoreboard objectives add rituals.menu trigger

# Create state tracker (0=main, 1=totems, etc.)
scoreboard objectives add rituals.menu_state dummy

# Enable trigger for player
scoreboard players enable @s rituals.menu

# Set to main menu
scoreboard players set @s rituals.menu_state 0

