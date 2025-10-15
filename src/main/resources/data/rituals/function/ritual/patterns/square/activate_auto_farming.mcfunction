# ========================================
# Activate Auto-Farming Ritual
# ========================================
# Called when square pattern is detected with all correct items
# This is an AREA EFFECT ritual - automatically harvests and replants crops in range

# Mark pattern as valid and activate
scoreboard players set @s rituals.pattern 1
tag @s add rituals.active_ritual
tag @s add rituals.auto_farming
scoreboard players set @s rituals.effect 7
scoreboard players set @s rituals.timer 0
tag @s remove rituals.pattern_help_shown

# CRITICAL: Ensure totem has a tier (fallback to tier 1 if missing)
execute unless score @s rituals.tier matches 1.. run scoreboard players set @s rituals.tier 1

# UNIQUE: Visual and audio feedback
particle minecraft:happy_villager ~ ~2 ~ 5 2 5 1 500 force
particle minecraft:item{item:"minecraft:wheat_seeds"} ~ ~2 ~ 3 1 3 0.2 300 force
particle minecraft:composter ~ ~2 ~ 0.5 0.5 0.5 0.3 200 force

playsound minecraft:block.crop.break master @a ~ ~ ~ 2.0 0.8
playsound minecraft:block.composter.fill_success master @a ~ ~ ~ 1.5 1.2
playsound minecraft:entity.villager.work_farmer master @a ~ ~ ~ 2.0 1.0

# UNIQUE: Success message
tellraw @a[distance=..32] [{"text":"🌾 ","color":"yellow"},{"text":"Auto-Farming","bold":true,"color":"green"},{"text":" ritual activated! Crops in range will be auto-harvested!","color":"green"}]

# Destroy supplemental totems (sacrifice) at diagonal corners
execute positioned ~5 ~ ~5 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~5 ~ ~5 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~5 ~ ~5 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~5 ~ ~5 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~5 ~ ~-5 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~5 ~ ~-5 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~5 ~ ~-5 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~5 ~ ~-5 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~-5 ~ ~-5 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~-5 ~ ~-5 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~-5 ~ ~-5 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~-5 ~ ~-5 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~-5 ~ ~5 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~-5 ~ ~5 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~-5 ~ ~5 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~-5 ~ ~5 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

# Mark central item with ritual_active tag (AFTER sacrificing supplementals)
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify entity @s item.components."minecraft:custom_data".ritual_active set value 1b
# Keep has_item tag - the item is still there!

# DO NOT remove pattern_totem tags - they persist to prevent supplementary totems from triggering other rituals
# Tags are only removed when the ritual is deactivated or the totem is broken
