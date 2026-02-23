# ========================================
# Visualize Pattern Requirements
# ========================================
# Called when totem is powered with redstone and has an item that's part of a pattern ritual
# Shows particle markers at positions where other totems are needed
# MUST be executed as and at the totem interaction entity

# Store this totem's ID for matching
scoreboard players operation #vis_id rituals.temp = @s rituals.id

# Get the item displayed on this totem
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #vis_id rituals.temp run data modify storage rituals:temp pattern_item set from entity @s item.id

# Visualize Square Pattern - Auto-Farming (4 corners)
execute if data storage rituals:temp {pattern_item:"minecraft:diamond_hoe"} at @s run function rituals:totem/patterns/visualize_square

# Visualize Star Pattern - Auto-Breeding (4 cardinals)
execute if data storage rituals:temp {pattern_item:"minecraft:wheat"} at @s run function rituals:totem/patterns/visualize_star

# Visualize Soul Star Pattern - Soul Embodiment (4 cardinals, any item)
execute at @s run function rituals:totem/patterns/visualize_soul_star

# Clear temp storage
data remove storage rituals:temp pattern_item
