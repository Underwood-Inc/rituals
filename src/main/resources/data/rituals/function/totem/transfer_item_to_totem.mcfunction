# ========================================
# Transfer item from player to totem display
# ========================================
# Runs as and at the totem

# Store the item data
data modify storage rituals:temp item set from entity @p[distance=..5] SelectedItem

# Force count to 1 (only display 1 item, not the whole stack)
data modify storage rituals:temp item.count set value 1

# Store this totem's ID
scoreboard players operation #transfer_id rituals.temp = @s rituals.id

# Apply item to the matching display entity
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #transfer_id rituals.temp run data modify entity @s item set from storage rituals:temp item

# Mark totem as having an item
tag @s add rituals.has_item

# Remove one item from player's hand (NOT in creative)
execute as @p[distance=..5,gamemode=!creative] run item modify entity @s weapon.mainhand rituals:decrement

# Visual and audio feedback
particle dust{color:[1.0,0.8,0.2],scale:1.0} ~ ~2.2 ~ 0.2 0.2 0.2 0 10
playsound entity.item.pickup block @a ~ ~ ~ 1.0 1.2

tellraw @p[distance=..5] [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Item placed on totem!","color":"green","bold":false}]

# Check if this is a pattern ritual item and show setup help immediately
function rituals:totem/check_pattern_help

# === SOUL WEAPON SYNC ===
# If this is a soul-embodied item and player has pending sync, apply XP
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_embodied as @p[distance=..5,tag=rituals.soul_pending_sync] run function rituals:soul/sync_from_totem