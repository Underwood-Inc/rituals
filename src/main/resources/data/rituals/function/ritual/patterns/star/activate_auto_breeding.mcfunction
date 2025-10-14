# ========================================
# Activate Auto-Breeding Ritual
# ========================================
# Called when star pattern is detected with all correct items
# This is an AREA EFFECT ritual - automatically breeds animals in range

# Mark pattern as valid
scoreboard players set #pattern_valid rituals.temp 1

# Tag ONLY the central totem as active (supplemental totems will be destroyed)
tag @s add rituals.active_ritual
tag @s add rituals.auto_breeding

# Set ritual effect type (11 = auto-breeding)
scoreboard players set @s rituals.effect 11

# Start ritual timer (reset to 0)
scoreboard players set @s rituals.timer 0

# Visual and audio feedback
particle minecraft:heart ~ ~2 ~ 5 2 5 0.5 200 force
particle minecraft:happy_villager ~ ~2 ~ 5 2 5 0.3 150 force
particle minecraft:composter ~ ~2 ~ 4 1 4 0.1 100 force

playsound minecraft:entity.chicken.egg master @a ~ ~ ~ 2.0 1.2
playsound minecraft:entity.cow.ambient master @a ~ ~ ~ 1.5 0.8
playsound minecraft:entity.sheep.ambient master @a ~ ~ ~ 1.5 1.0

# Success message
tellraw @a[distance=..32] [{"text":"💚 ","color":"green"},{"text":"Auto-Breeding","bold":true,"color":"yellow"},{"text":" ritual activated! Animals in range will now breed automatically!","color":"green"}]

# CENTRAL TOTEM: Keep item, remove help tag, and mark as ritual-active
tag @s remove rituals.pattern_help_shown
scoreboard players operation #central_id rituals.temp = @s rituals.id
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #central_id rituals.temp run data modify entity @s item.components."minecraft:custom_data".ritual_active set value 1b

# SUPPLEMENTAL TOTEMS: Drop items cleanly, then destroy with dramatic effects
# North
execute positioned ~ ~ ~5 as @e[type=interaction,tag=rituals.pattern_totem,distance=..1.5] run function rituals:totem/drop_displayed_item_clean
execute positioned ~ ~ ~5 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~ ~ ~5 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~ ~ ~5 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~ ~ ~5 as @e[type=interaction,tag=rituals.pattern_totem,distance=..1.5] run function rituals:totem/break

# East
execute positioned ~5 ~ ~ as @e[type=interaction,tag=rituals.pattern_totem,distance=..1.5] run function rituals:totem/drop_displayed_item_clean
execute positioned ~5 ~ ~ run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~5 ~ ~ run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~5 ~ ~ run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~5 ~ ~ as @e[type=interaction,tag=rituals.pattern_totem,distance=..1.5] run function rituals:totem/break

# South
execute positioned ~ ~ ~-5 as @e[type=interaction,tag=rituals.pattern_totem,distance=..1.5] run function rituals:totem/drop_displayed_item_clean
execute positioned ~ ~ ~-5 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~ ~ ~-5 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~ ~ ~-5 run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~ ~ ~-5 as @e[type=interaction,tag=rituals.pattern_totem,distance=..1.5] run function rituals:totem/break

# West
execute positioned ~-5 ~ ~ as @e[type=interaction,tag=rituals.pattern_totem,distance=..1.5] run function rituals:totem/drop_displayed_item_clean
execute positioned ~-5 ~ ~ run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~-5 ~ ~ run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~-5 ~ ~ run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned ~-5 ~ ~ as @e[type=interaction,tag=rituals.pattern_totem,distance=..1.5] run function rituals:totem/break

# Clean up pattern totem tags (if any remain)
tag @e[type=interaction,tag=rituals.pattern_totem] remove rituals.pattern_totem


