# ========================================
# Show Badge in Action Bar
# ========================================
# Displays badge info in action bar

# Get tier name
execute if score @s rituals.badge_tier matches 0 run data modify storage rituals:temp tier_name set value "None"
execute if score @s rituals.badge_tier matches 1 run data modify storage rituals:temp tier_name set value "Wood"
execute if score @s rituals.badge_tier matches 2 run data modify storage rituals:temp tier_name set value "Copper"
execute if score @s rituals.badge_tier matches 3 run data modify storage rituals:temp tier_name set value "Iron"
execute if score @s rituals.badge_tier matches 4 run data modify storage rituals:temp tier_name set value "Gold"
execute if score @s rituals.badge_tier matches 5 run data modify storage rituals:temp tier_name set value "Diamond"
execute if score @s rituals.badge_tier matches 6 run data modify storage rituals:temp tier_name set value "Netherite"

# Get tier color
execute if score @s rituals.badge_tier matches 0 run data modify storage rituals:temp tier_color set value "red"
execute if score @s rituals.badge_tier matches 1 run data modify storage rituals:temp tier_color set value "green"
execute if score @s rituals.badge_tier matches 2 run data modify storage rituals:temp tier_color set value "gold"
execute if score @s rituals.badge_tier matches 3 run data modify storage rituals:temp tier_color set value "gray"
execute if score @s rituals.badge_tier matches 4 run data modify storage rituals:temp tier_color set value "yellow"
execute if score @s rituals.badge_tier matches 5 run data modify storage rituals:temp tier_color set value "aqua"
execute if score @s rituals.badge_tier matches 6 run data modify storage rituals:temp tier_color set value "dark_purple"

# Display in action bar
function rituals:badges/display/show_action_bar_message with storage rituals:temp

