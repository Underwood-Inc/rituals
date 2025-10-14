# ========================================
# Activate XP Harvester Ritual
# ========================================
# Called when pentagon pattern is detected with all correct items
# This is an AREA EFFECT ritual - periodically spawns XP orbs

# Mark pattern as valid
scoreboard players set #pattern_valid rituals.temp 1

# Tag ONLY the central totem (supplemental totems will be destroyed)
tag @s add rituals.active_ritual
tag @s add rituals.xp_harvester

# Set ritual effect type (14 = xp harvester)
scoreboard players set @s rituals.effect 14

# Start ritual timer (reset to 0)
scoreboard players set @s rituals.timer 0

# Visual and audio feedback
particle minecraft:enchant ~ ~2 ~ 5 2 5 1 500 force
particle minecraft:dragon_breath ~ ~2 ~ 3 1 3 0.2 300 force
particle minecraft:end_rod ~ ~2 ~ 0.5 0.5 0.5 0.3 200 force

playsound minecraft:entity.player.levelup master @a ~ ~ ~ 2.0 0.8
playsound minecraft:block.enchantment_table.use master @a ~ ~ ~ 1.5 1.2
playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 2.0 0.5

# Success message
tellraw @a[distance=..32] [{"text":"✨ ","color":"light_purple"},{"text":"XP Harvester","bold":true,"color":"aqua"},{"text":" ritual activated! Experience will be generated automatically!","color":"light_purple"}]

# CENTRAL TOTEM: Keep item, remove help tag, and mark as ritual-active
tag @s remove rituals.pattern_help_shown
scoreboard players operation #central_id rituals.temp = @s rituals.id
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #central_id rituals.temp run data modify entity @s item.components."minecraft:custom_data".ritual_active set value 1b

# SUPPLEMENTAL TOTEMS: Completely destroy (sacrifice) with dramatic effects
# Position 1 (North) - SACRIFICE
execute positioned ~ ~ ~5 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~ ~ ~5 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~ ~ ~5 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~ ~ ~5 as @e[type=interaction,tag=rituals.pattern_totem,distance=..1.5] run function rituals:totem/break_sacrifice

# Position 2 (NE) - SACRIFICE
execute positioned ~5 ~ ~2 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~5 ~ ~2 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~5 ~ ~2 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~5 ~ ~2 as @e[type=interaction,tag=rituals.pattern_totem,distance=..1.5] run function rituals:totem/break_sacrifice

# Position 3 (SE) - SACRIFICE
execute positioned ~3 ~ ~-4 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~3 ~ ~-4 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~3 ~ ~-4 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~3 ~ ~-4 as @e[type=interaction,tag=rituals.pattern_totem,distance=..1.5] run function rituals:totem/break_sacrifice

# Position 4 (SW) - SACRIFICE
execute positioned ~-3 ~ ~-4 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~-3 ~ ~-4 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~-3 ~ ~-4 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~-3 ~ ~-4 as @e[type=interaction,tag=rituals.pattern_totem,distance=..1.5] run function rituals:totem/break_sacrifice

# Position 5 (NW) - SACRIFICE
execute positioned ~-5 ~ ~2 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~-5 ~ ~2 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~-5 ~ ~2 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~-5 ~ ~2 as @e[type=interaction,tag=rituals.pattern_totem,distance=..1.5] run function rituals:totem/break_sacrifice

# Clean up pattern totem tags (if any remain)
tag @e[type=interaction,tag=rituals.pattern_totem] remove rituals.pattern_totem
