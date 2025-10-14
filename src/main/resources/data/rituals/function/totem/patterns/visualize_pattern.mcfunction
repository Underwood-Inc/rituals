# ========================================
# Visualize Pattern Requirements
# ========================================
# Called when totem is powered with redstone and has an item that's part of a pattern ritual
# Shows particle markers at positions where other totems are needed

# Get the item displayed on this totem
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify storage rituals:temp pattern_item set from entity @s item.id

# Visualize Star Pattern - Auto-Breeding (4 cardinals)
execute if data storage rituals:temp {pattern_item:"minecraft:wheat"} run function rituals:totem/patterns/visualize_star

# Note: Add more patterns here as they're implemented
# execute if data storage rituals:temp {pattern_item:"minecraft:experience_bottle"} run function rituals:totem/patterns/visualize_pentagon


