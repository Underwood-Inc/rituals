# ========================================
# Activate Item Vacuum Ritual
# ========================================
# Called when hexagon pattern is detected with all correct items for vacuum
# This is a CRAFTING ritual - permanently enhances the hopper

# Mark pattern as valid and activate
scoreboard players set @s rituals.pattern 1
tag @s add rituals.pattern_ritual
tag @s add rituals.item_vacuum
scoreboard players set @s rituals.effect 12
scoreboard players set @s rituals.timer 0
tag @s remove rituals.pattern_help_shown

# UNIQUE: Visual and audio feedback
particle minecraft:portal ~ ~2 ~ 5 2 5 1 500 force
particle minecraft:end_rod ~ ~2 ~ 0.5 0.5 0.5 0.3 200 force
particle minecraft:reverse_portal ~ ~2 ~ 4 1 4 0.1 300 force

playsound minecraft:block.portal.trigger master @a ~ ~ ~ 2.0 1.2
playsound minecraft:block.ender_chest.open master @a ~ ~ ~ 1.5 0.8
playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.0 0.6

# UNIQUE: Success message
tellraw @a[distance=..32] [{"text":"🌀 ","color":"dark_purple"},{"text":"Item Vacuum","bold":true,"color":"aqua"},{"text":" ritual activated! The hopper has been ","color":"light_purple"},{"text":"permanently enhanced","bold":true,"color":"gold"},{"text":" to pull items from wider area!","color":"light_purple"}]

# UNIQUE: Store enhanced state on the hopper item
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify entity @s item.components."minecraft:custom_data".item_vacuum set value 1b

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

# UNIQUE: Upgrade the hopper item to an enhanced version
# This is a CRAFTING ritual - player should be able to remove the enhanced item!
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify entity @s item.components."minecraft:custom_data".item_vacuum set value 1b
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify entity @s item.components."minecraft:custom_name" set value '{"text":"Enhanced Hopper","color":"cyan","bold":true,"italic":false}'
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify entity @s item.components."minecraft:lore" set value ['{"text":"Permanently enhanced by ritual magic","color":"light_purple","italic":true}','{"text":"Pulls items from extended range!","color":"gold","italic":false}']

# DO NOT mark as ritual_active - this is a crafting ritual, the item should be removable!
# Deactivate the ritual since crafting is complete
tag @s remove rituals.active_ritual
tag @s remove rituals.pattern_ritual
tag @s remove rituals.item_vacuum
scoreboard players set @s rituals.effect 0

# Clean up pattern totem tags (if any remain)
tag @e[type=interaction,tag=rituals.pattern_totem] remove rituals.pattern_totem
