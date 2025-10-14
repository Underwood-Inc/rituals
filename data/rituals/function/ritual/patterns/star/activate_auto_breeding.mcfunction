# ========================================
# Activate Auto-Breeding Ritual
# ========================================
# Called when star pattern is detected with all correct items
# This is an AREA EFFECT ritual - automatically breeds animals in range

# Mark pattern as valid and activate
scoreboard players set @s rituals.pattern 1
tag @s add rituals.active_ritual
tag @s add rituals.auto_breeding
scoreboard players set @s rituals.effect 11
scoreboard players set @s rituals.timer 0
tag @s remove rituals.pattern_help_shown

# UNIQUE: Visual and audio feedback
particle minecraft:heart ~ ~2 ~ 5 2 5 0.5 200 force
particle minecraft:happy_villager ~ ~2 ~ 5 2 5 0.3 150 force
particle minecraft:composter ~ ~2 ~ 4 1 4 0.1 100 force

playsound minecraft:entity.chicken.egg master @a ~ ~ ~ 2.0 1.2
playsound minecraft:entity.cow.ambient master @a ~ ~ ~ 1.5 0.8
playsound minecraft:entity.sheep.ambient master @a ~ ~ ~ 1.5 1.0

# UNIQUE: Success message
tellraw @a[distance=..32] [{"text":"💚 ","color":"green"},{"text":"Auto-Breeding","bold":true,"color":"yellow"},{"text":" ritual activated! Animals in range will now breed automatically!","color":"green"}]

# IMMEDIATE breeding attempt at activation (100% chance for at least one pair)
# Get tier settings for range
function rituals:ritual/get_tier_settings
execute store result storage rituals:temp h_range int 1 run scoreboard players get #current_h_range rituals.temp

# Apply breeding immediately using tier-based range
function rituals:ritual/patterns/star/immediate_breed with storage rituals:temp

# Destroy supplemental totems (sacrifice)
execute positioned ~ ~ ~5 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~ ~ ~5 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~ ~ ~5 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~ ~ ~5 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~5 ~ ~ run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~5 ~ ~ run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~5 ~ ~ run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~5 ~ ~ as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~ ~ ~-5 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~ ~ ~-5 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~ ~ ~-5 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~ ~ ~-5 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~-5 ~ ~ run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~-5 ~ ~ run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~-5 ~ ~ run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~-5 ~ ~ as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

# Mark central item with ritual_active tag (AFTER sacrificing supplementals)
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify entity @s item.components."minecraft:custom_data".ritual_active set value 1b
# Keep has_item tag - the item is still there!

# Clean up pattern totem tags (if any remain)
tag @e[type=interaction,tag=rituals.pattern_totem] remove rituals.pattern_totem
