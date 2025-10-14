# ========================================
# Activate Auto-Breeding Ritual
# ========================================
# Called when star pattern is detected with all correct items
# This is an AREA EFFECT ritual - automatically breeds animals in range

# Mark pattern as valid
scoreboard players set #pattern_valid rituals.temp 1

# Tag all participating totems
tag @s add rituals.active_ritual
tag @s add rituals.auto_breeding
execute positioned ~ ~ ~5 as @e[type=interaction,tag=rituals.totem,tag=rituals.pattern_totem,distance=..1.5] run tag @s add rituals.active_ritual
execute positioned ~ ~ ~5 as @e[type=interaction,tag=rituals.totem,tag=rituals.pattern_totem,distance=..1.5] run tag @s add rituals.auto_breeding
execute positioned ~5 ~ ~ as @e[type=interaction,tag=rituals.totem,tag=rituals.pattern_totem,distance=..1.5] run tag @s add rituals.active_ritual
execute positioned ~5 ~ ~ as @e[type=interaction,tag=rituals.totem,tag=rituals.pattern_totem,distance=..1.5] run tag @s add rituals.auto_breeding
execute positioned ~ ~ ~-5 as @e[type=interaction,tag=rituals.totem,tag=rituals.pattern_totem,distance=..1.5] run tag @s add rituals.active_ritual
execute positioned ~ ~ ~-5 as @e[type=interaction,tag=rituals.totem,tag=rituals.pattern_totem,distance=..1.5] run tag @s add rituals.auto_breeding
execute positioned ~-5 ~ ~ as @e[type=interaction,tag=rituals.totem,tag=rituals.pattern_totem,distance=..1.5] run tag @s add rituals.active_ritual
execute positioned ~-5 ~ ~ as @e[type=interaction,tag=rituals.totem,tag=rituals.pattern_totem,distance=..1.5] run tag @s add rituals.auto_breeding

# Set ritual effect type (11 = auto-breeding)
scoreboard players set @s rituals.effect 11
execute positioned ~ ~ ~5 as @e[type=interaction,tag=rituals.auto_breeding,distance=..1.5] run scoreboard players set @s rituals.effect 11
execute positioned ~5 ~ ~ as @e[type=interaction,tag=rituals.auto_breeding,distance=..1.5] run scoreboard players set @s rituals.effect 11
execute positioned ~ ~ ~-5 as @e[type=interaction,tag=rituals.auto_breeding,distance=..1.5] run scoreboard players set @s rituals.effect 11
execute positioned ~-5 ~ ~ as @e[type=interaction,tag=rituals.auto_breeding,distance=..1.5] run scoreboard players set @s rituals.effect 11

# Start ritual timer (reset to 0)
scoreboard players set @s rituals.timer 0
execute positioned ~ ~ ~5 as @e[type=interaction,tag=rituals.auto_breeding,distance=..1.5] run scoreboard players set @s rituals.timer 0
execute positioned ~5 ~ ~ as @e[type=interaction,tag=rituals.auto_breeding,distance=..1.5] run scoreboard players set @s rituals.timer 0
execute positioned ~ ~ ~-5 as @e[type=interaction,tag=rituals.auto_breeding,distance=..1.5] run scoreboard players set @s rituals.timer 0
execute positioned ~-5 ~ ~ as @e[type=interaction,tag=rituals.auto_breeding,distance=..1.5] run scoreboard players set @s rituals.timer 0

# Visual and audio feedback
particle minecraft:heart ~ ~2 ~ 5 2 5 0.5 200 force
particle minecraft:happy_villager ~ ~2 ~ 5 2 5 0.3 150 force
particle minecraft:composter ~ ~2 ~ 4 1 4 0.1 100 force

playsound minecraft:entity.chicken.egg master @a ~ ~ ~ 2.0 1.2
playsound minecraft:entity.cow.ambient master @a ~ ~ ~ 1.5 0.8
playsound minecraft:entity.sheep.ambient master @a ~ ~ ~ 1.5 1.0

# Success message
tellraw @a[distance=..32] [{"text":"💚 ","color":"green"},{"text":"Auto-Breeding","bold":true,"color":"yellow"},{"text":" ritual activated! Animals in range will now breed automatically!","color":"green"}]

# Clean up pattern totem tags
tag @e[type=interaction,tag=rituals.pattern_totem] remove rituals.pattern_totem


