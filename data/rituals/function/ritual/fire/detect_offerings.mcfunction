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
execute positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run function rituals:visual/spawn_beam {x:0,y:0,z:-2,color:"black"}
execute positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run function rituals:visual/spawn_beam {x:0,y:0,z:2,color:"black"}
execute positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run function rituals:visual/spawn_beam {x:2,y:0,z:0,color:"black"}
execute positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run function rituals:visual/spawn_beam {x:-2,y:0,z:0,color:"black"}
execute if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_coal

# Count copper (copper/orange beams)
scoreboard players set #offerings_found rituals.temp 0
execute positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:0,y:0,z:-2,color:"orange"}
execute positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:0,y:0,z:2,color:"orange"}
execute positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:2,y:0,z:0,color:"orange"}
execute positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:-2,y:0,z:0,color:"orange"}
execute if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_copper

# Count iron (gray beams)
scoreboard players set #offerings_found rituals.temp 0
execute positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:0,y:0,z:-2,color:"light_gray"}
execute positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:0,y:0,z:2,color:"light_gray"}
execute positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:2,y:0,z:0,color:"light_gray"}
execute positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:-2,y:0,z:0,color:"light_gray"}
execute if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_iron

# Count gold (golden yellow beams)
scoreboard players set #offerings_found rituals.temp 0
execute positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:0,y:0,z:-2,color:"yellow"}
execute positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:0,y:0,z:2,color:"yellow"}
execute positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:2,y:0,z:0,color:"yellow"}
execute positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:-2,y:0,z:0,color:"yellow"}
execute if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_gold

# Count diamonds (cyan beams)
scoreboard players set #offerings_found rituals.temp 0
execute positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run function rituals:visual/spawn_beam {x:0,y:0,z:-2,color:"cyan"}
execute positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run function rituals:visual/spawn_beam {x:0,y:0,z:2,color:"cyan"}
execute positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run function rituals:visual/spawn_beam {x:2,y:0,z:0,color:"cyan"}
execute positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run function rituals:visual/spawn_beam {x:-2,y:0,z:0,color:"cyan"}
execute if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_diamond

# Count netherite (dark purple beams)
scoreboard players set #offerings_found rituals.temp 0
execute positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:0,y:0,z:-2,color:"purple"}
execute positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:0,y:0,z:2,color:"purple"}
execute positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:2,y:0,z:0,color:"purple"}
execute positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:-2,y:0,z:0,color:"purple"}
execute if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_netherite


