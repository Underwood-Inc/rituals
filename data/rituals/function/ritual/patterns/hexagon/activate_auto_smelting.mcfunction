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

# UNIQUE: Upgrade the blast furnace item to an enhanced version
# This is a CRAFTING ritual - player should be able to remove the enhanced item!
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify entity @s item.components."minecraft:custom_data".auto_smelting set value 1b
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify entity @s item.components."minecraft:custom_name" set value '{"text":"Enhanced Blast Furnace","color":"gold","bold":true,"italic":false}'
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify entity @s item.components."minecraft:lore" set value ['{"text":"Permanently enhanced by ritual magic","color":"light_purple","italic":true}','{"text":"Smelts automatically without fuel!","color":"gold","italic":false}']

# DO NOT mark as ritual_active - this is a crafting ritual, the item should be removable!
# Deactivate the ritual since crafting is complete
tag @s remove rituals.active_ritual
tag @s remove rituals.pattern_ritual
tag @s remove rituals.auto_smelting
scoreboard players set @s rituals.effect 0

# Clean up pattern totem tags (if any remain)
tag @e[type=interaction,tag=rituals.pattern_totem] remove rituals.pattern_totem
