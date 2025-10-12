# ========================================
# Remove item from totem display
# ========================================
# Runs as and at the totem

# Store this totem's ID
scoreboard players operation #remove_id rituals.temp = @s rituals.id

# Get the item from the display
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #remove_id rituals.temp run data modify storage rituals:temp item set from entity @s item

# Drop the item
function rituals:totem/drop_displayed_item

# Clear the display
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #remove_id rituals.temp run data remove entity @s item

# Remove has_item tag
tag @s remove rituals.has_item

# Visual and audio feedback
particle dust{color:[0.8,0.8,0.8],scale:1.0} ~ ~2.2 ~ 0.2 0.2 0.2 0 10
playsound entity.item.pickup block @a ~ ~ ~ 1.0 0.8

tellraw @p[distance=..5] [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"Item removed from totem!","color":"yellow","bold":false}]
