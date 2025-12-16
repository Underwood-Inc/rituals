# ========================================
# Activate Soul Ascension
# ========================================
# Raises the level cap by 5 and rolls for bonus enchantment

# Get this totem's ID first for fracture check
scoreboard players operation #ascend_totem_id rituals.temp = @s rituals.id

# === CHECK FOR FRACTURED SOUL ===
# If the soul is fractured, ascension is IMPOSSIBLE
execute store result score #is_fractured rituals.temp run execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #ascend_totem_id rituals.temp if data entity @s item.components."minecraft:custom_data".soul_fractured
execute if score #is_fractured rituals.temp matches 1 run function rituals:soul/ascension_blocked_fractured
execute if score #is_fractured rituals.temp matches 1 run return 0

# Mark as active ritual
tag @s add rituals.active_ritual
tag @s add rituals.soul_ascension
scoreboard players set @s rituals.effect 21
scoreboard players set @s rituals.timer 0

# Get current tier and level cap
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #ascend_totem_id rituals.temp store result score #current_tier rituals.soul_temp run data get entity @s item.components."minecraft:custom_data".soul_ascension_tier
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #ascend_totem_id rituals.temp store result score #current_cap rituals.soul_temp run data get entity @s item.components."minecraft:custom_data".soul_level_cap

# Calculate new values
scoreboard players add #current_tier rituals.soul_temp 1
scoreboard players add #current_cap rituals.soul_temp 5

# Cap at tier 18 / level 100
execute if score #current_tier rituals.soul_temp matches 19.. run scoreboard players set #current_tier rituals.soul_temp 18
execute if score #current_cap rituals.soul_temp matches 101.. run scoreboard players set #current_cap rituals.soul_temp 100

# Apply new values to item
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #ascend_totem_id rituals.temp store result entity @s item.components."minecraft:custom_data".soul_ascension_tier int 1 run scoreboard players get #current_tier rituals.soul_temp
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #ascend_totem_id rituals.temp store result entity @s item.components."minecraft:custom_data".soul_level_cap int 1 run scoreboard players get #current_cap rituals.soul_temp

# Reset ready_ascend flag
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #ascend_totem_id rituals.temp run data modify entity @s item.components."minecraft:custom_data".soul_ready_ascend set value 0b

# Reset XP for new tier
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #ascend_totem_id rituals.temp run data modify entity @s item.components."minecraft:custom_data".soul_xp set value 0

# === BONUS ENCHANTMENT ROLL (50% chance) ===
# Generate random 0-99
execute store result score #bonus_roll rituals.soul_temp run random value 0..99
scoreboard players set #bonus_threshold rituals.soul_temp 50

execute if score #bonus_roll rituals.soul_temp < #bonus_threshold rituals.soul_temp run function rituals:soul/apply_bonus_enchant

# === DRAMATIC VISUALS ===
particle minecraft:end_rod ~ ~2 ~ 0.5 2 0.5 0.1 100 force
particle minecraft:reverse_portal ~ ~1.5 ~ 0.5 1 0.5 0.2 150 force
particle minecraft:soul_fire_flame ~ ~1 ~ 1 1 1 0.1 100 force
particle minecraft:enchant ~ ~1.5 ~ 1 1 1 2 300 force

# Explosion at each cardinal
execute positioned ~ ~ ~5 run particle minecraft:soul ~ ~1 ~ 0.3 0.5 0.3 0.05 20 force
execute positioned ~5 ~ ~ run particle minecraft:soul ~ ~1 ~ 0.3 0.5 0.3 0.05 20 force
execute positioned ~ ~ ~-5 run particle minecraft:soul ~ ~1 ~ 0.3 0.5 0.3 0.05 20 force
execute positioned ~-5 ~ ~ run particle minecraft:soul ~ ~1 ~ 0.3 0.5 0.3 0.05 20 force

# === SOUNDS ===
playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 0.8 0.7
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1.5 0.5
playsound minecraft:block.beacon.activate master @a ~ ~ ~ 2.0 1.2

# === MESSAGE ===
tellraw @a[distance=..32] [{"text":""},{"text":"⚡ ","color":"gold","bold":true},{"text":"ASCENSION COMPLETE","color":"yellow","bold":true},{"text":" ⚡","color":"gold","bold":true}]
tellraw @a[distance=..32] [{"text":"   New Tier: ","color":"gray"},{"score":{"name":"#current_tier","objective":"rituals.soul_temp"},"color":"light_purple","bold":true}]
tellraw @a[distance=..32] [{"text":"   New Level Cap: ","color":"gray"},{"score":{"name":"#current_cap","objective":"rituals.soul_temp"},"color":"green","bold":true}]

# Mark ritual complete for badges
function rituals:badges/mark_ritual_complete

# Destroy supplemental totems
execute positioned ~ ~ ~5 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~ ~ ~5 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~5 ~ ~ run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~5 ~ ~ as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~ ~ ~-5 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~ ~ ~-5 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~-5 ~ ~ run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~-5 ~ ~ as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

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
# Ascension is a ONE-TIME ritual, not a continuous effect
# Player must be able to take their ascended weapon!
tag @s remove rituals.active_ritual
tag @s remove rituals.soul_ascension
tellraw @a[distance=..10] [{"text":"   ","color":"gray"},{"text":"⚡ Right-click the totem to claim your ascended weapon!","color":"green"}]

