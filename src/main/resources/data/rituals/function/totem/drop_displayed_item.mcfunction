# ========================================
# Drop the item that was displayed on the totem
# ========================================
# Runs as and at the totem

# Get display entity's item
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify storage rituals:temp drop_item set from entity @s item

# Summon the item entity
execute if data storage rituals:temp drop_item run summon item ~ ~2 ~ {Item:{id:"minecraft:stone",count:1},Tags:["rituals.temp_item"]}

# Transfer the actual item data
execute if data storage rituals:temp drop_item run data modify entity @e[type=item,tag=rituals.temp_item,limit=1,sort=nearest] Item set from storage rituals:temp drop_item

# Clear temp tag
tag @e[type=item,tag=rituals.temp_item] remove rituals.temp_item

# Clear storage
data remove storage rituals:temp drop_item

