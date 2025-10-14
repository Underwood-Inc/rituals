# ========================================
# Activate Enchanting Nexus Ritual
# ========================================
# Called when square pattern is detected with all correct items
# This is a CRAFTING ritual - it permanently enhances the enchanting table

# Mark pattern as valid
scoreboard players set #pattern_valid rituals.temp 1

# Tag all participating totems as part of pattern ritual
tag @s add rituals.pattern_ritual
tag @s add rituals.enchanting_nexus
execute positioned ~4 ~ ~4 as @e[type=interaction,tag=rituals.totem,tag=rituals.pattern_totem,distance=..1.5] run tag @s add rituals.enchanting_nexus
execute positioned ~4 ~ ~-4 as @e[type=interaction,tag=rituals.totem,tag=rituals.pattern_totem,distance=..1.5] run tag @s add rituals.enchanting_nexus
execute positioned ~-4 ~ ~-4 as @e[type=interaction,tag=rituals.totem,tag=rituals.pattern_totem,distance=..1.5] run tag @s add rituals.enchanting_nexus
execute positioned ~-4 ~ ~4 as @e[type=interaction,tag=rituals.totem,tag=rituals.pattern_totem,distance=..1.5] run tag @s add rituals.enchanting_nexus

# Set ritual effect type (10 = enchanting nexus)
scoreboard players set @s rituals.effect 10
execute positioned ~4 ~ ~4 as @e[type=interaction,tag=rituals.enchanting_nexus,distance=..1.5] run scoreboard players set @s rituals.effect 10
execute positioned ~4 ~ ~-4 as @e[type=interaction,tag=rituals.enchanting_nexus,distance=..1.5] run scoreboard players set @s rituals.effect 10
execute positioned ~-4 ~ ~-4 as @e[type=interaction,tag=rituals.enchanting_nexus,distance=..1.5] run scoreboard players set @s rituals.effect 10
execute positioned ~-4 ~ ~4 as @e[type=interaction,tag=rituals.enchanting_nexus,distance=..1.5] run scoreboard players set @s rituals.effect 10

# Start ritual timer (reset to 0)
scoreboard players set @s rituals.timer 0
execute positioned ~4 ~ ~4 as @e[type=interaction,tag=rituals.enchanting_nexus,distance=..1.5] run scoreboard players set @s rituals.timer 0
execute positioned ~4 ~ ~-4 as @e[type=interaction,tag=rituals.enchanting_nexus,distance=..1.5] run scoreboard players set @s rituals.timer 0
execute positioned ~-4 ~ ~-4 as @e[type=interaction,tag=rituals.enchanting_nexus,distance=..1.5] run scoreboard players set @s rituals.timer 0
execute positioned ~-4 ~ ~4 as @e[type=interaction,tag=rituals.enchanting_nexus,distance=..1.5] run scoreboard players set @s rituals.timer 0

# Visual and audio feedback - dramatic effect!
particle minecraft:enchant ~ ~2 ~ 5 2 5 1 500 force
particle minecraft:end_rod ~ ~2 ~ 0.5 0.5 0.5 0.2 100 force
particle minecraft:dragon_breath ~ ~2 ~ 4 1 4 0.1 200 force

playsound minecraft:block.enchantment_table.use master @a ~ ~ ~ 2.0 0.5
playsound minecraft:block.end_portal.spawn master @a ~ ~ ~ 1.0 1.5
playsound minecraft:entity.evoker.cast_spell master @a ~ ~ ~ 1.5 0.8

# Success message
tellraw @a[distance=..32] [{"text":"✨ ","color":"light_purple"},{"text":"Enchanting Nexus","bold":true,"color":"aqua"},{"text":" ritual activated! The enchanting table has been ","color":"light_purple"},{"text":"permanently enhanced","bold":true,"color":"gold"},{"text":"!","color":"light_purple"}]

# Store enhanced state on the enchanting table item
# This marks it as enhanced for future placement
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify entity @s item.components."minecraft:custom_data".enchanting_nexus set value 1b

# Clean up pattern totem tags
tag @e[type=interaction,tag=rituals.pattern_totem] remove rituals.pattern_totem


