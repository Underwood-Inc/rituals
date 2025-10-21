# ========================================
# Badge Display Tick
# ========================================
# Handles periodic action bar updates if enabled

# Increment timer for all players (except those who hid badges)
scoreboard players add @a[tag=!rituals.badge_hidden] rituals.action_bar_timer 1

# Show action bar at configured frequency (default every 100 ticks = 5 seconds)
execute as @a[tag=!rituals.badge_hidden] if score @s rituals.action_bar_timer >= #badge_action_bar_freq rituals.data run function rituals:badges/display/show_action_bar
execute as @a[tag=!rituals.badge_hidden] if score @s rituals.action_bar_timer >= #badge_action_bar_freq rituals.data run scoreboard players set @s rituals.action_bar_timer 0

