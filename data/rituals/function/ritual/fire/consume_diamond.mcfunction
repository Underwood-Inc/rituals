# ========================================
# Consume Diamond Offerings
# ========================================

playsound minecraft:block.portal.trigger block @a ~ ~ ~ 0.5 1.8
playsound minecraft:entity.blaze.shoot block @a ~ ~ ~ 0.8 0.8
particle flame ~ ~0.5 ~ 0.3 0.3 0.3 0.05 50
particle lava ~ ~0.5 ~ 0.5 0.5 0.5 0.1 10

execute positioned ~ ~ ~-2 as @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run kill @s
execute positioned ~ ~ ~2 as @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run kill @s
execute positioned ~2 ~ ~ as @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run kill @s
execute positioned ~-2 ~ ~ as @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run kill @s

particle soul_fire_flame ~2 ~ ~ 0.1 0.5 0.1 0.02 20
particle soul_fire_flame ~-2 ~ ~ 0.1 0.5 0.1 0.02 20
particle soul_fire_flame ~ ~ ~2 0.1 0.5 0.1 0.02 20
particle soul_fire_flame ~ ~ ~-2 0.1 0.5 0.1 0.02 20
particle enchant ~ ~0.5 ~ 0.3 1 0.3 0.3 100
particle end_rod ~ ~0.5 ~ 0.2 1 0.2 0.05 30

execute if block ~ ~ ~ minecraft:fire run setblock ~ ~ ~ minecraft:air
execute if block ~ ~ ~ minecraft:soul_fire run setblock ~ ~ ~ minecraft:air
execute if block ~ ~-1 ~ minecraft:fire run setblock ~ ~-1 ~ minecraft:air
execute if block ~ ~-1 ~ minecraft:soul_fire run setblock ~ ~-1 ~ minecraft:air
execute if block ~1 ~ ~ minecraft:fire run setblock ~1 ~ ~ minecraft:air
execute if block ~1 ~ ~ minecraft:soul_fire run setblock ~1 ~ ~ minecraft:air
execute if block ~-1 ~ ~ minecraft:fire run setblock ~-1 ~ ~ minecraft:air
execute if block ~-1 ~ ~ minecraft:soul_fire run setblock ~-1 ~ ~ minecraft:air
execute if block ~ ~ ~1 minecraft:fire run setblock ~ ~ ~1 minecraft:air
execute if block ~ ~ ~1 minecraft:soul_fire run setblock ~ ~ ~1 minecraft:air
execute if block ~ ~ ~-1 minecraft:fire run setblock ~ ~ ~-1 minecraft:air
execute if block ~ ~ ~-1 minecraft:soul_fire run setblock ~ ~ ~-1 minecraft:air

tellraw @a[distance=..16] [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"Fire sacrifice accepted! ","color":"red"},{"text":"(consumed 4x Diamond)","color":"gray","italic":true}]

function rituals:ritual/detect_type

