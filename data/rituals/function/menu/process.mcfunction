# ========================================
# Process Menu Selection
# ========================================
# Routes to appropriate handler based on menu state

# Main Menu (state 0)
execute if score @s rituals.menu_state matches 0 run function rituals:menu/handle_main

# Totem Bases Menu (state 1)
execute if score @s rituals.menu_state matches 1 run function rituals:menu/handle_totems

# Upgrade Slates Menu (state 3)
execute if score @s rituals.menu_state matches 3 run function rituals:menu/handle_upgrades

