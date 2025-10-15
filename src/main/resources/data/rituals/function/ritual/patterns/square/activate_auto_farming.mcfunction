# ========================================
# Activate Auto-Farming Ritual (REWRITTEN)
# ========================================
# Called when square pattern is fully validated with all 4 corner totems + items
# This is a PERMANENT AREA EFFECT ritual - harvests and replants crops automatically

# ========================================
# STEP 1: Mark the central totem as active
# ========================================
tag @s add rituals.active_ritual
tag @s add rituals.auto_farming
scoreboard players set @s rituals.effect 7
scoreboard players set @s rituals.timer 0
scoreboard players set @s rituals.data 0
tag @s remove rituals.pattern_help_shown

# ========================================
# STEP 2: Epic activation effects at center
# ========================================
particle minecraft:happy_villager ~ ~2 ~ 5 2 5 1 500 force
particle minecraft:item{item:"minecraft:wheat_seeds"} ~ ~2 ~ 3 1 3 0.2 300 force
particle minecraft:composter ~ ~2 ~ 0.5 0.5 0.5 0.3 200 force
particle minecraft:enchant ~ ~1 ~ 2 2 2 0.5 150 force

playsound minecraft:block.crop.break master @a ~ ~ ~ 2.0 0.8
playsound minecraft:block.composter.fill_success master @a ~ ~ ~ 1.5 1.2
playsound minecraft:entity.villager.work_farmer master @a ~ ~ ~ 2.0 1.0
playsound minecraft:block.beacon.activate master @a ~ ~ ~ 1.0 1.5

# ========================================
# STEP 3: Success notification
# ========================================
tellraw @a[distance=..32] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"green","bold":true}]
tellraw @a[distance=..32] [{"text":"  🌾 ","color":"yellow"},{"text":"AUTO-FARMING RITUAL","bold":true,"color":"green"},{"text":" ACTIVATED!","color":"yellow","bold":true}]
tellraw @a[distance=..32] [{"text":"  ","color":"gray"},{"text":"Crops within range will be automatically harvested!","color":"gray"}]
tellraw @a[distance=..32] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"green","bold":true}]

# ========================================
# STEP 4: Sacrifice corner totems with dramatic effects
# ========================================

# NE Corner (+5, 0, +5) - Wheat
execute positioned ~5 ~ ~5 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~5 ~ ~5 run particle minecraft:poof ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~5 ~ ~5 run particle minecraft:happy_villager ~ ~1 ~ 0.3 0.5 0.3 0.2 20 force
execute positioned ~5 ~ ~5 run playsound minecraft:entity.item.break master @a ~ ~ ~ 1.5 0.8
execute positioned ~5 ~ ~5 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

# SE Corner (+5, 0, -5) - Carrot
execute positioned ~5 ~ ~-5 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~5 ~ ~-5 run particle minecraft:poof ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~5 ~ ~-5 run particle minecraft:happy_villager ~ ~1 ~ 0.3 0.5 0.3 0.2 20 force
execute positioned ~5 ~ ~-5 run playsound minecraft:entity.item.break master @a ~ ~ ~ 1.5 0.8
execute positioned ~5 ~ ~-5 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

# SW Corner (-5, 0, -5) - Potato
execute positioned ~-5 ~ ~-5 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~-5 ~ ~-5 run particle minecraft:poof ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~-5 ~ ~-5 run particle minecraft:happy_villager ~ ~1 ~ 0.3 0.5 0.3 0.2 20 force
execute positioned ~-5 ~ ~-5 run playsound minecraft:entity.item.break master @a ~ ~ ~ 1.5 0.8
execute positioned ~-5 ~ ~-5 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

# NW Corner (-5, 0, +5) - Beetroot
execute positioned ~-5 ~ ~5 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned ~-5 ~ ~5 run particle minecraft:poof ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned ~-5 ~ ~5 run particle minecraft:happy_villager ~ ~1 ~ 0.3 0.5 0.3 0.2 20 force
execute positioned ~-5 ~ ~5 run playsound minecraft:entity.item.break master @a ~ ~ ~ 1.5 0.8
execute positioned ~-5 ~ ~5 as @e[type=interaction,tag=rituals.totem,distance=..1.5,limit=1] run function rituals:totem/break_sacrifice

# ========================================
# STEP 5: Mark central display item as ritually active
# ========================================
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify entity @s item.components."minecraft:custom_data".ritual_active set value 1b

# Central totem keeps its item and remains active permanently


