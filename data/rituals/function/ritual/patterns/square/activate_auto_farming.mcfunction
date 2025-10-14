# ========================================
# Activate Auto-Farming Ritual
# ========================================
# Called when square pattern is detected with all correct items
# This is an AREA EFFECT ritual - harvests and replants crops

# Mark pattern as valid and activate
scoreboard players set @s rituals.pattern 1
tag @s add rituals.active_ritual
tag @s add rituals.auto_farming
scoreboard players set @s rituals.effect 7
scoreboard players set @s rituals.timer 0
tag @s remove rituals.pattern_help_shown

# UNIQUE: Visual and audio feedback
particle minecraft:happy_villager ~ ~2 ~ 5 2 5 1 500 force
particle minecraft:wheat_seeds ~ ~2 ~ 3 1 3 0.2 300 force
particle minecraft:composter ~ ~2 ~ 0.5 0.5 0.5 0.3 200 force

playsound minecraft:block.crop.break master @a ~ ~ ~ 2.0 0.8
playsound minecraft:block.composter.fill_success master @a ~ ~ ~ 1.5 1.2
playsound minecraft:entity.villager.work_farmer master @a ~ ~ ~ 2.0 1.0

# UNIQUE: Success message
tellraw @a[distance=..32] [{"text":"🌾 ","color":"yellow"},{"text":"Auto-Farming","bold":true,"color":"green"},{"text":" ritual activated!","color":"yellow"}]
tellraw @a[distance=..32] [{"text":"🚜 ","color":"gold"},{"text":"Crops will be harvested and replanted automatically!","color":"gray"}]

# Destroy supplemental totems (sacrifice) - all 4 corners
execute positioned ~5 ~ ~5 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~5 ~ ~5 run particle minecraft:poof ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~5 ~ ~5 run playsound minecraft:entity.item.break master @a ~ ~ ~ 1.5 0.8
execute positioned ~5 ~ ~5 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~5 ~ ~-5 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~5 ~ ~-5 run particle minecraft:poof ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~5 ~ ~-5 run playsound minecraft:entity.item.break master @a ~ ~ ~ 1.5 0.8
execute positioned ~5 ~ ~-5 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~-5 ~ ~-5 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~-5 ~ ~-5 run particle minecraft:poof ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~-5 ~ ~-5 run playsound minecraft:entity.item.break master @a ~ ~ ~ 1.5 0.8
execute positioned ~-5 ~ ~-5 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~-5 ~ ~5 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~-5 ~ ~5 run particle minecraft:poof ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~-5 ~ ~5 run playsound minecraft:entity.item.break master @a ~ ~ ~ 1.5 0.8
execute positioned ~-5 ~ ~5 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

# Mark central item with ritual_active tag (AFTER sacrificing supplementals)
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify entity @s item.components."minecraft:custom_data".ritual_active set value 1b
# Keep has_item tag - the item is still there!

# Clean up pattern totem tags (if any remain)
tag @e[type=interaction,tag=rituals.pattern_totem] remove rituals.pattern_totem


