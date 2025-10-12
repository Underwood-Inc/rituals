# ========================================
# Swap item on totem (remove old, add new)
# ========================================
# Runs as and at the totem

# Store this totem's ID
scoreboard players operation #swap_id rituals.temp = @s rituals.id

# Get the OLD item from the display
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #swap_id rituals.temp run data modify storage rituals:temp old_item set from entity @s item

# Drop the OLD item at totem location
function rituals:totem/drop_displayed_item

# Get the NEW item from player
data modify storage rituals:temp item set from entity @p[distance=..5] SelectedItem

# Force count to 1 (only display 1 item, not the whole stack)
data modify storage rituals:temp item.count set value 1

# Apply NEW item to the display entity
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #swap_id rituals.temp run data modify entity @s item set from storage rituals:temp item

# Keep has_item tag (still has an item, just different)
tag @s add rituals.has_item

# Clear old ritual tags so the new ritual can be detected
tag @s remove rituals.active_ritual
tag @s remove rituals.growth_ritual
tag @s remove rituals.strength_ritual
tag @s remove rituals.prosperity_ritual
tag @s remove rituals.protection_ritual
tag @s remove rituals.healing_ritual
tag @s remove rituals.sentry_ritual

# Remove one item from player's hand (NOT in creative)
execute as @p[distance=..5,gamemode=!creative] run item modify entity @s weapon.mainhand rituals:decrement

# Visual and audio feedback
particle dust{color:[1.0,0.5,1.0],scale:1.0} ~ ~2.2 ~ 0.2 0.2 0.2 0 15
playsound entity.item.pickup block @a ~ ~ ~ 1.0 1.0
playsound block.enchantment_table.use block @a ~ ~ ~ 0.5 1.5

tellraw @p[distance=..5] [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"Item swapped! Ritual changed.","color":"light_purple","bold":false}]

