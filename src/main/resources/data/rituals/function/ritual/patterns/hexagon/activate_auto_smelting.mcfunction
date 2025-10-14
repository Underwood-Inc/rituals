# ========================================
# Activate Auto-Smelting Ritual
# ========================================
# Called when hexagon pattern is detected with all correct items for smelting
# This is a CRAFTING ritual - permanently enhances the blast furnace

# Mark pattern as valid and activate
scoreboard players set @s rituals.pattern 1
tag @s add rituals.pattern_ritual
tag @s add rituals.auto_smelting
scoreboard players set @s rituals.effect 13
scoreboard players set @s rituals.timer 0
tag @s remove rituals.pattern_help_shown

# UNIQUE: Visual and audio feedback - FIRE!
particle minecraft:flame ~ ~2 ~ 5 2 5 0.3 500 force
particle minecraft:lava ~ ~2 ~ 4 1 4 0.1 200 force
particle minecraft:soul_fire_flame ~ ~2 ~ 3 2 3 0.2 300 force
particle minecraft:smoke ~ ~3 ~ 5 2 5 0.1 100 force

playsound minecraft:block.furnace.fire_crackle master @a ~ ~ ~ 2.0 0.5
playsound minecraft:block.blastfurnace.fire_crackle master @a ~ ~ ~ 2.0 0.8
playsound minecraft:item.firecharge.use master @a ~ ~ ~ 1.5 0.6

# UNIQUE: Success message
tellraw @a[distance=..32] [{"text":"🔥 ","color":"gold"},{"text":"Auto-Smelting","bold":true,"color":"red"},{"text":" ritual activated! The blast furnace has been ","color":"gold"},{"text":"permanently enhanced","bold":true,"color":"yellow"},{"text":" to smelt without fuel!","color":"gold"}]

# UNIQUE: Store enhanced state on the blast furnace item
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify entity @s item.components."minecraft:custom_data".auto_smelting set value 1b

# Destroy supplemental totems (sacrifice)
execute positioned ~ ~ ~6 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~ ~ ~6 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~ ~ ~6 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~ ~ ~6 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~5 ~ ~3 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~5 ~ ~3 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~5 ~ ~3 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~5 ~ ~3 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~5 ~ ~-3 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~5 ~ ~-3 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~5 ~ ~-3 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~5 ~ ~-3 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~ ~ ~-6 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~ ~ ~-6 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~ ~ ~-6 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~ ~ ~-6 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~-5 ~ ~-3 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~-5 ~ ~-3 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~-5 ~ ~-3 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~-5 ~ ~-3 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~-5 ~ ~3 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~-5 ~ ~3 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~-5 ~ ~3 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~-5 ~ ~3 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

# Mark central item with ritual_active tag (AFTER sacrificing supplementals)
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify entity @s item.components."minecraft:custom_data".ritual_active set value 1b
# Keep has_item tag - the item is still there!

# Clean up pattern totem tags (if any remain)
tag @e[type=interaction,tag=rituals.pattern_totem] remove rituals.pattern_totem
