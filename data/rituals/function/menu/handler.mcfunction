# ========================================
# Menu Trigger Handler
# ========================================
# Runs every tick to detect and process menu triggers

# Enable trigger for all players
scoreboard players enable @a rituals.menu

# Process triggers based on current menu state
execute as @a[scores={rituals.menu=1..}] run function rituals:menu/process

