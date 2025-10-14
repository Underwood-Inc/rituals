# ========================================
# Drop Displayed Item (Clean - No Ritual Tags)
# ========================================
# Drops the item from the totem display, stripping any ritual-specific tags

# Get the displayed item and store it
scoreboard players operation #drop_id rituals.temp = @s rituals.id
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #drop_id rituals.temp run data modify storage rituals:temp drop_item set from entity @s item

# Strip ritual tags from the item
data remove storage rituals:temp drop_item.components."minecraft:custom_data".ritual_active
data remove storage rituals:temp drop_item.components."minecraft:custom_data".pattern_ritual_item

# Summon the item entity with clean data
execute positioned ~ ~1.5 ~ run function rituals:totem/summon_clean_item with storage rituals:temp

# Clear storage
data remove storage rituals:temp drop_item

