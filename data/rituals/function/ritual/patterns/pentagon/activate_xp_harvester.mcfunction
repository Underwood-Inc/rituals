# ========================================
# Activate XP Harvester Ritual
# ========================================
# Called when pentagon pattern is detected with all correct items
# This is an AREA EFFECT ritual - periodically spawns XP orbs

# Mark pattern as valid and activate
scoreboard players set @s rituals.pattern 1
tag @s add rituals.active_ritual
tag @s add rituals.xp_harvester
scoreboard players set @s rituals.effect 14
scoreboard players set @s rituals.timer 0
tag @s remove rituals.pattern_help_shown

# UNIQUE: Visual and audio feedback
particle minecraft:enchant ~ ~2 ~ 5 2 5 1 500 force
particle minecraft:dragon_breath ~ ~2 ~ 3 1 3 0.2 300 force
particle minecraft:end_rod ~ ~2 ~ 0.5 0.5 0.5 0.3 200 force

playsound minecraft:entity.player.levelup master @a ~ ~ ~ 2.0 0.8
playsound minecraft:block.enchantment_table.use master @a ~ ~ ~ 1.5 1.2
playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 2.0 0.5

# UNIQUE: Success message
tellraw @a[distance=..32] [{"text":"✨ ","color":"light_purple"},{"text":"XP Harvester","bold":true,"color":"aqua"},{"text":" ritual activated!","color":"light_purple"}]
tellraw @a[distance=..32] [{"text":"⚡ ","color":"yellow"},{"text":"Power the central totem with redstone to generate 1 XP/second!","color":"gold"}]

# Destroy supplemental totems (sacrifice)
execute positioned ~ ~ ~5 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~ ~ ~5 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~ ~ ~5 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~ ~ ~5 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~5 ~ ~2 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~5 ~ ~2 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~5 ~ ~2 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~5 ~ ~2 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~3 ~ ~-4 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~3 ~ ~-4 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~3 ~ ~-4 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~3 ~ ~-4 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~-3 ~ ~-4 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~-3 ~ ~-4 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~-3 ~ ~-4 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~-3 ~ ~-4 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

execute positioned ~-5 ~ ~2 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~-5 ~ ~2 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~-5 ~ ~2 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~-5 ~ ~2 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

# Mark central item with ritual_active tag (AFTER sacrificing supplementals)
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify entity @s item.components."minecraft:custom_data".ritual_active set value 1b
# Keep has_item tag - the item is still there!

# Clean up pattern totem tags (if any remain)
tag @e[type=interaction,tag=rituals.pattern_totem] remove rituals.pattern_totem
