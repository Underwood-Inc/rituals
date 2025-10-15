# ========================================
# Detect Offerings Around Totem
# ========================================
# Checks for catalyst items in the 4 cardinal directions
# Runs as and at the totem

# Just check for ANY valid catalyst items and activate
# Simplified - no tier checking since scoreboards break

# Count coal nearby (black beams)
scoreboard players set #offerings_found rituals.temp 0
execute positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run function rituals:visual/spawn_beam {x:0,y:0,z:-2,r:0.1,g:0.1,b:0.1}
execute positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run function rituals:visual/spawn_beam {x:0,y:0,z:2,r:0.1,g:0.1,b:0.1}
execute positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run function rituals:visual/spawn_beam {x:2,y:0,z:0,r:0.1,g:0.1,b:0.1}
execute positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run function rituals:visual/spawn_beam {x:-2,y:0,z:0,r:0.1,g:0.1,b:0.1}
execute if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_coal

# Count copper (copper/orange beams)
scoreboard players set #offerings_found rituals.temp 0
execute positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:0,y:0,z:-2,r:0.72,g:0.45,b:0.2}
execute positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:0,y:0,z:2,r:0.72,g:0.45,b:0.2}
execute positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:2,y:0,z:0,r:0.72,g:0.45,b:0.2}
execute positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:-2,y:0,z:0,r:0.72,g:0.45,b:0.2}
execute if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_copper

# Count iron (gray beams)
scoreboard players set #offerings_found rituals.temp 0
execute positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:0,y:0,z:-2,r:0.8,g:0.8,b:0.8}
execute positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:0,y:0,z:2,r:0.8,g:0.8,b:0.8}
execute positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:2,y:0,z:0,r:0.8,g:0.8,b:0.8}
execute positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:-2,y:0,z:0,r:0.8,g:0.8,b:0.8}
execute if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_iron

# Count gold (golden yellow beams)
scoreboard players set #offerings_found rituals.temp 0
execute positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:0,y:0,z:-2,r:1.0,g:0.84,b:0.0}
execute positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:0,y:0,z:2,r:1.0,g:0.84,b:0.0}
execute positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:2,y:0,z:0,r:1.0,g:0.84,b:0.0}
execute positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:-2,y:0,z:0,r:1.0,g:0.84,b:0.0}
execute if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_gold

# Count diamonds (cyan beams)
scoreboard players set #offerings_found rituals.temp 0
execute positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run function rituals:visual/spawn_beam {x:0,y:0,z:-2,r:0.0,g:1.0,b:1.0}
execute positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run function rituals:visual/spawn_beam {x:0,y:0,z:2,r:0.0,g:1.0,b:1.0}
execute positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run function rituals:visual/spawn_beam {x:2,y:0,z:0,r:0.0,g:1.0,b:1.0}
execute positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run function rituals:visual/spawn_beam {x:-2,y:0,z:0,r:0.0,g:1.0,b:1.0}
execute if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_diamond

# Count netherite (dark purple beams)
scoreboard players set #offerings_found rituals.temp 0
execute positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:0,y:0,z:-2,r:0.3,g:0.15,b:0.3}
execute positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:0,y:0,z:2,r:0.3,g:0.15,b:0.3}
execute positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:2,y:0,z:0,r:0.3,g:0.15,b:0.3}
execute positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:-2,y:0,z:0,r:0.3,g:0.15,b:0.3}
execute if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_netherite


