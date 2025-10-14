# ========================================
# Check Position Item (Unified Position Checker)
# ========================================
# Macro function to check if totem at current position has the correct item
# Runs as the totem at the supplemental position
#
# Parameters (from storage):
#   item: Expected item ID (e.g., "minecraft:wheat_seeds")
#   pos: Position variable name (e.g., "n", "ne", "pos1")
#
# Usage:
#   data modify storage rituals:check_temp set value {item:"minecraft:wheat_seeds",pos:"n"}
#   execute positioned ~ ~ ~5 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/lib/check_position_item with storage rituals:check_temp

# Get the item from the totem's display entity
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify storage rituals:temp check_item set from entity @s item.id

# Check if item matches expected item
$execute if data storage rituals:temp {check_item:"$(item)"} run scoreboard players set #found_$(pos) rituals.temp 1
$execute if data storage rituals:temp {check_item:"$(item)"} run tag @s add rituals.pattern_totem

