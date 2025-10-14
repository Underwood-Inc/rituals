# ========================================
# Activate Enchanting Nexus Ritual
# ========================================
# Called when square pattern is detected with all correct items
# This is a CRAFTING ritual - it permanently enhances the enchanting table

# Mark pattern as valid and activate
scoreboard players set @s rituals.pattern 1
tag @s add rituals.pattern_ritual
tag @s add rituals.enchanting_nexus
scoreboard players set @s rituals.effect 10
scoreboard players set @s rituals.timer 0
tag @s remove rituals.pattern_help_shown

# UNIQUE: Visual and audio feedback - dramatic effect!
particle minecraft:enchant ~ ~2 ~ 5 2 5 1 500 force
particle minecraft:end_rod ~ ~2 ~ 0.5 0.5 0.5 0.2 100 force
particle minecraft:dragon_breath ~ ~2 ~ 4 1 4 0.1 200 force

playsound minecraft:block.enchantment_table.use master @a ~ ~ ~ 2.0 0.5
playsound minecraft:block.end_portal.spawn master @a ~ ~ ~ 1.0 1.5
playsound minecraft:entity.evoker.cast_spell master @a ~ ~ ~ 1.5 0.8

# UNIQUE: Success message
tellraw @a[distance=..32] [{"text":"✨ ","color":"light_purple"},{"text":"Enchanting Nexus","bold":true,"color":"aqua"},{"text":" ritual activated! The enchanting table has been ","color":"light_purple"},{"text":"permanently enhanced","bold":true,"color":"gold"},{"text":"!","color":"light_purple"}]

# Destroy supplemental totems (sacrifice)
execute positioned ~4 ~ ~4 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~4 ~ ~4 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~4 ~ ~4 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~4 ~ ~4 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~4 ~ ~-4 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~4 ~ ~-4 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~4 ~ ~-4 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~4 ~ ~-4 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~-4 ~ ~-4 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~-4 ~ ~-4 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~-4 ~ ~-4 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~-4 ~ ~-4 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~-4 ~ ~4 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~-4 ~ ~4 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~-4 ~ ~4 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~-4 ~ ~4 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

# UNIQUE: Upgrade the enchanting table item to an enhanced version
# This is a CRAFTING ritual - player should be able to remove the enhanced item!
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify entity @s item.components."minecraft:custom_data".enchanting_nexus set value 1b
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify entity @s item.components."minecraft:custom_name" set value '{"text":"Enhanced Enchanting Table","color":"aqua","bold":true,"italic":false}'
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify entity @s item.components."minecraft:lore" set value ['{"text":"Permanently enhanced by ritual magic","color":"light_purple","italic":true}','{"text":"Provides better enchantments!","color":"gold","italic":false}']

# DO NOT mark as ritual_active - this is a crafting ritual, the item should be removable!
# Deactivate the ritual since crafting is complete
tag @s remove rituals.active_ritual
tag @s remove rituals.pattern_ritual
tag @s remove rituals.enchanting_nexus
scoreboard players set @s rituals.effect 0

# Clean up pattern totem tags (if any remain)
tag @e[type=interaction,tag=rituals.pattern_totem] remove rituals.pattern_totem
