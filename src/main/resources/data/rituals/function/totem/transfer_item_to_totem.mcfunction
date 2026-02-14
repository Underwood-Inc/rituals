# ========================================
# Transfer item from player to totem display
# ========================================
# Runs as and at the totem
# Player UUID in rituals:temp interacting_uuid (macro)

# Store the item data (from storage, set by check_held_item_simple)
data modify storage rituals:temp item set from storage rituals:temp player_selected_item

# Force count to 1 (only display 1 item, not the whole stack)
data modify storage rituals:temp item.count set value 1

# Store this totem's ID
scoreboard players operation #transfer_id rituals.temp = @s rituals.id

# Apply item to the matching display entity
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #transfer_id rituals.temp run data modify entity @s item set from storage rituals:temp item

# Mark totem as having an item
tag @s add rituals.has_item

# Remove one item from player's hand (NOT in creative) - UUID targeted
$execute as @a[nbt={UUID:$(interacting_uuid)},gamemode=!creative] run item modify entity @s weapon.mainhand rituals:decrement

# Visual and audio feedback
particle dust{color:[1.0,0.8,0.2],scale:1.0} ~ ~2.2 ~ 0.2 0.2 0.2 0 10
playsound entity.item.pickup block @a ~ ~ ~ 1.0 1.2

$tellraw @a[nbt={UUID:$(interacting_uuid)}] [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Item placed on totem!","color":"green","bold":false}]

# Check if this is a pattern ritual item and show setup help immediately
function rituals:totem/check_pattern_help

# === SOUL WEAPON SYNC ===
# If this is a soul-embodied item, sync pending XP and refresh lore
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_embodied as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #transfer_id rituals.temp run function rituals:soul/sync_item with storage rituals:temp
