# ========================================
# Remove item from totem display
# ========================================
# Runs as and at the totem

# Store this totem's ID
scoreboard players operation #remove_id rituals.temp = @s rituals.id

# Drop the displayed item (clean, no ritual tags)
function rituals:totem/drop_displayed_item_clean

# Clear the display
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #remove_id rituals.temp run data remove entity @s item

# Remove has_item tag
tag @s remove rituals.has_item

# Remove pattern_totem tag (allows this totem to be a central totem again)
tag @s remove rituals.pattern_totem

# If this was an active ritual, deactivate it
execute if entity @s[tag=rituals.active_ritual] run tellraw @p[distance=..5] [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"Ritual deactivated - item removed!","color":"red","bold":false}]
execute if entity @s[tag=rituals.active_ritual] run function rituals:ritual/deactivate

# Visual and audio feedback
particle dust{color:[0.8,0.8,0.8],scale:1.0} ~ ~2.2 ~ 0.2 0.2 0.2 0 10
playsound entity.item.pickup block @a ~ ~ ~ 1.0 0.8

tellraw @p[distance=..5] [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"Item removed from totem!","color":"yellow","bold":false}]
