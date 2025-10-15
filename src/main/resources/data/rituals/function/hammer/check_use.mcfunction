# Check if player used the ritual hammer
# Only run if holding the hammer
execute unless data entity @s SelectedItem.components."minecraft:custom_data".rituals_hammer run return fail

# Check if sneaking (shift+right-click for debug toggle)
execute if predicate rituals:player/sneaking run return run function rituals:hammer/raycast_debug

# Normal right-click for ritual toggle
function rituals:hammer/raycast_toggle

# Reset scoreboard
scoreboard players reset @s rituals.hammer_use

