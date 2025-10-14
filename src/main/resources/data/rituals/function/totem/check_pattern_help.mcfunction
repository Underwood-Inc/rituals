# ========================================
# Check if Pattern Ritual Item & Show Help
# ========================================
# Runs when an item is placed on a totem
# Shows pattern setup instructions immediately if it's a pattern ritual item

# Get the displayed item
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify storage rituals:temp placed_item set from entity @s item.id

# Check each pattern ritual type and show help if not already shown

# === AUTO-BREEDING (Wheat) ===
execute if data storage rituals:temp {placed_item:"minecraft:wheat"} unless entity @s[tag=rituals.pattern_help_shown] run function rituals:totem/pattern_help/auto_breeding

# === ENCHANTING NEXUS (Enchanting Table) ===
execute if data storage rituals:temp {placed_item:"minecraft:enchanting_table"} unless entity @s[tag=rituals.pattern_help_shown] run function rituals:totem/pattern_help/enchanting_nexus

# === ITEM VACUUM (Hopper) ===
execute if data storage rituals:temp {placed_item:"minecraft:hopper"} unless entity @s[tag=rituals.pattern_help_shown] run function rituals:totem/pattern_help/item_vacuum

# === AUTO-SMELTING (Blast Furnace) ===
execute if data storage rituals:temp {placed_item:"minecraft:blast_furnace"} unless entity @s[tag=rituals.pattern_help_shown] run function rituals:totem/pattern_help/auto_smelting

# Clear temp storage
data remove storage rituals:temp placed_item

