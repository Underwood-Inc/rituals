# ========================================
# Check if placed item can be Soul Embodied
# ========================================
# Any item can be soul-embodied
# Runs AS the totem (interaction entity)

# Get this totem's matching item_display
scoreboard players operation #soul_check_id rituals.temp = @s rituals.id

# Skip items already soul-embodied (those go to ascension, not embodiment help)
execute store result score #is_already_soul rituals.temp run execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #soul_check_id rituals.temp if data entity @s item.components."minecraft:custom_data".soul_embodied
execute if score #is_already_soul rituals.temp matches 1.. run return 0

# Show soul embodiment help for all items
function rituals:totem/pattern_help/soul_embodiment
