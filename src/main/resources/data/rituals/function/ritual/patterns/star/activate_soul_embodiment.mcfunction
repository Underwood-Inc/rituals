# ========================================
# Activate Soul Embodiment Ritual
# ========================================
# Called when star pattern is detected with all correct soul items
# This awakens the central item with a living soul

# Mark ritual as active (prevents re-triggering)
tag @s add rituals.active_ritual
tag @s add rituals.soul_embodiment
scoreboard players set @s rituals.effect 20
scoreboard players set @s rituals.timer 0
tag @s remove rituals.soul_help_shown

# Get this totem's ID for item modification
scoreboard players operation #awaken_totem_id rituals.temp = @s rituals.id

# Determine soul type using ITEM TAGS (not hardcoded!)
# Default to generic
data modify storage rituals:temp soul_type set value "generic"

# Check each category using item tags on the item_display entity
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #awaken_totem_id rituals.temp if items entity @s contents #minecraft:swords run data modify storage rituals:temp soul_type set value "sword"
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #awaken_totem_id rituals.temp if items entity @s contents #minecraft:pickaxes run data modify storage rituals:temp soul_type set value "pickaxe"
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #awaken_totem_id rituals.temp if items entity @s contents #minecraft:axes run data modify storage rituals:temp soul_type set value "axe"
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #awaken_totem_id rituals.temp if items entity @s contents #minecraft:shovels run data modify storage rituals:temp soul_type set value "shovel"
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #awaken_totem_id rituals.temp if items entity @s contents #minecraft:hoes run data modify storage rituals:temp soul_type set value "hoe"

# Ranged weapons (no vanilla tag, check individually but still cleaner)
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #awaken_totem_id rituals.temp if items entity @s contents minecraft:bow run data modify storage rituals:temp soul_type set value "bow"
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #awaken_totem_id rituals.temp if items entity @s contents minecraft:crossbow run data modify storage rituals:temp soul_type set value "crossbow"
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #awaken_totem_id rituals.temp if items entity @s contents minecraft:trident run data modify storage rituals:temp soul_type set value "trident"

# Generate a soul name (use fallback names, cycling through them)
scoreboard players add #soul_name_index rituals.data 1
scoreboard players operation #name_idx rituals.temp = #soul_name_index rituals.data
scoreboard players operation #name_idx rituals.temp %= #10 rituals.data

# Apply soul data to the item
# We inject custom_data with all soul properties
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #awaken_totem_id rituals.temp run function rituals:soul/awaken_item

# === DRAMATIC VISUAL EFFECTS ===
# Soul fire spiral
particle minecraft:soul_fire_flame ~ ~1 ~ 0.5 1 0.5 0.05 100 force
particle minecraft:soul ~ ~2 ~ 0.3 0.5 0.3 0.02 50 force
particle minecraft:enchant ~ ~1.5 ~ 1 1 1 1 200 force
particle minecraft:reverse_portal ~ ~1 ~ 0.3 0.8 0.3 0.1 100 force

# Explosion of magic at each cardinal
execute positioned ~ ~ ~5 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.05 30 force
execute positioned ~5 ~ ~ run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.05 30 force
execute positioned ~ ~ ~-5 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.05 30 force
execute positioned ~-5 ~ ~ run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.05 30 force

# === SOUNDS ===
playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 1.0 0.5
playsound minecraft:block.beacon.activate master @a ~ ~ ~ 1.5 0.8
playsound minecraft:block.enchantment_table.use master @a ~ ~ ~ 2.0 1.0

# === SUCCESS MESSAGE ===
tellraw @a[distance=..32] [{"text":""},{"text":"✦ ","color":"dark_purple","bold":true},{"text":"SOUL EMBODIMENT","color":"light_purple","bold":true},{"text":" ✦","color":"dark_purple","bold":true}]
tellraw @a[distance=..32] [{"text":"   Your item has been granted a ","color":"gray"},{"text":"living soul","color":"aqua","bold":true},{"text":"!","color":"gray"}]
tellraw @a[distance=..32] [{"text":"   A soul is now bound to it. Use it well.","color":"gray"}]
tellraw @a[distance=..32] [{"text":"   ","color":"gray"},{"text":"Level Cap: 15","color":"yellow"},{"text":" | Perform ritual again to ascend!","color":"gray"}]

# Mark ritual as completed for badges
function rituals:badges/mark_ritual_complete

# Destroy supplemental totems (soul components consumed)
execute positioned ~ ~ ~5 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~ ~ ~5 run particle minecraft:soul ~ ~1 ~ 0.3 0.5 0.3 0.05 20 force
execute positioned ~ ~ ~5 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~ ~ ~5 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~5 ~ ~ run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~5 ~ ~ run particle minecraft:soul ~ ~1 ~ 0.3 0.5 0.3 0.05 20 force
execute positioned ~5 ~ ~ run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~5 ~ ~ as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~ ~ ~-5 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~ ~ ~-5 run particle minecraft:soul ~ ~1 ~ 0.3 0.5 0.3 0.05 20 force
execute positioned ~ ~ ~-5 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~ ~ ~-5 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~-5 ~ ~ run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~-5 ~ ~ run particle minecraft:soul ~ ~1 ~ 0.3 0.5 0.3 0.05 20 force
execute positioned ~-5 ~ ~ run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~-5 ~ ~ as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

# Clear temp storage
data remove storage rituals:temp awaken_item_id
data remove storage rituals:temp soul_type

# === CONSUME TIER-BASED GROUND OFFERINGS ===
# Kill the ground items based on totem tier (at ±2 cardinal positions)
execute if score @s rituals.tier matches 1 positioned ~ ~ ~-2 as @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run kill @s
execute if score @s rituals.tier matches 1 positioned ~ ~ ~2 as @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run kill @s
execute if score @s rituals.tier matches 1 positioned ~2 ~ ~ as @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run kill @s
execute if score @s rituals.tier matches 1 positioned ~-2 ~ ~ as @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run kill @s

execute if score @s rituals.tier matches 2 positioned ~ ~ ~-2 as @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run kill @s
execute if score @s rituals.tier matches 2 positioned ~ ~ ~2 as @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run kill @s
execute if score @s rituals.tier matches 2 positioned ~2 ~ ~ as @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run kill @s
execute if score @s rituals.tier matches 2 positioned ~-2 ~ ~ as @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run kill @s

execute if score @s rituals.tier matches 3 positioned ~ ~ ~-2 as @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run kill @s
execute if score @s rituals.tier matches 3 positioned ~ ~ ~2 as @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run kill @s
execute if score @s rituals.tier matches 3 positioned ~2 ~ ~ as @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run kill @s
execute if score @s rituals.tier matches 3 positioned ~-2 ~ ~ as @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run kill @s

execute if score @s rituals.tier matches 4 positioned ~ ~ ~-2 as @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run kill @s
execute if score @s rituals.tier matches 4 positioned ~ ~ ~2 as @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run kill @s
execute if score @s rituals.tier matches 4 positioned ~2 ~ ~ as @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run kill @s
execute if score @s rituals.tier matches 4 positioned ~-2 ~ ~ as @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run kill @s

execute if score @s rituals.tier matches 5 positioned ~ ~ ~-2 as @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run kill @s
execute if score @s rituals.tier matches 5 positioned ~ ~ ~2 as @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run kill @s
execute if score @s rituals.tier matches 5 positioned ~2 ~ ~ as @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run kill @s
execute if score @s rituals.tier matches 5 positioned ~-2 ~ ~ as @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run kill @s

execute if score @s rituals.tier matches 6 positioned ~ ~ ~-2 as @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run kill @s
execute if score @s rituals.tier matches 6 positioned ~ ~ ~2 as @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run kill @s
execute if score @s rituals.tier matches 6 positioned ~2 ~ ~ as @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run kill @s
execute if score @s rituals.tier matches 6 positioned ~-2 ~ ~ as @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run kill @s

# Extinguish fire
execute if block ~ ~ ~ minecraft:fire run setblock ~ ~ ~ minecraft:air
execute if block ~ ~ ~ minecraft:soul_fire run setblock ~ ~ ~ minecraft:air
execute if block ~ ~-1 ~ minecraft:fire run setblock ~ ~-1 ~ minecraft:air
execute if block ~ ~-1 ~ minecraft:soul_fire run setblock ~ ~-1 ~ minecraft:air

# === UNLOCK ITEM FOR PICKUP ===
# Soul Embodiment is a ONE-TIME transformation, not a continuous effect
# Player must be able to take their awakened weapon!
tag @s remove rituals.active_ritual
tag @s remove rituals.soul_embodiment
tellraw @a[distance=..10] [{"text":"   ","color":"gray"},{"text":"✦ Right-click the totem to claim your awakened item!","color":"green"}]

