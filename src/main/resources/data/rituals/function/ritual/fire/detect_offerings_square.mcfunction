# ========================================
# Detect Offerings for SQUARE Pattern Rituals
# ========================================
# Checks for catalyst items at the 4 DIAGONAL CORNER positions
# Used for: Auto-Farming (Diamond Hoe)
# Positions: NE (+5,+5), SE (+5,-5), SW (-5,-5), NW (-5,+5)

# Count coal (black beams for detection)
scoreboard players set #offerings_found rituals.temp 0
execute positioned ~5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run function rituals:visual/spawn_beam {x:5,y:0,z:5,r:0.1,g:0.1,b:0.1}
execute positioned ~5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run function rituals:visual/spawn_beam {x:5,y:0,z:-5,r:0.1,g:0.1,b:0.1}
execute positioned ~-5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run function rituals:visual/spawn_beam {x:-5,y:0,z:-5,r:0.1,g:0.1,b:0.1}
execute positioned ~-5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run function rituals:visual/spawn_beam {x:-5,y:0,z:5,r:0.1,g:0.1,b:0.1}
execute if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_square {item:"minecraft:coal",name:"Coal"}

# Count copper (copper/orange beams)
scoreboard players set #offerings_found rituals.temp 0
execute positioned ~5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:5,y:0,z:5,r:0.72,g:0.45,b:0.2}
execute positioned ~5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:5,y:0,z:-5,r:0.72,g:0.45,b:0.2}
execute positioned ~-5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:-5,y:0,z:-5,r:0.72,g:0.45,b:0.2}
execute positioned ~-5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:-5,y:0,z:5,r:0.72,g:0.45,b:0.2}
execute if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_square {item:"minecraft:copper_ingot",name:"Copper Ingot"}

# Count iron (gray beams)
scoreboard players set #offerings_found rituals.temp 0
execute positioned ~5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:5,y:0,z:5,r:0.8,g:0.8,b:0.8}
execute positioned ~5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:5,y:0,z:-5,r:0.8,g:0.8,b:0.8}
execute positioned ~-5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:-5,y:0,z:-5,r:0.8,g:0.8,b:0.8}
execute positioned ~-5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:-5,y:0,z:5,r:0.8,g:0.8,b:0.8}
execute if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_square {item:"minecraft:iron_ingot",name:"Iron Ingot"}

# Count gold (golden yellow beams)
scoreboard players set #offerings_found rituals.temp 0
execute positioned ~5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:5,y:0,z:5,r:1.0,g:0.84,b:0.0}
execute positioned ~5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:5,y:0,z:-5,r:1.0,g:0.84,b:0.0}
execute positioned ~-5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:-5,y:0,z:-5,r:1.0,g:0.84,b:0.0}
execute positioned ~-5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:-5,y:0,z:5,r:1.0,g:0.84,b:0.0}
execute if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_square {item:"minecraft:gold_ingot",name:"Gold Ingot"}

# Count diamond (cyan beams)
scoreboard players set #offerings_found rituals.temp 0
execute positioned ~5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run function rituals:visual/spawn_beam {x:5,y:0,z:5,r:0.0,g:1.0,b:1.0}
execute positioned ~5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run function rituals:visual/spawn_beam {x:5,y:0,z:-5,r:0.0,g:1.0,b:1.0}
execute positioned ~-5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run function rituals:visual/spawn_beam {x:-5,y:0,z:-5,r:0.0,g:1.0,b:1.0}
execute positioned ~-5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run function rituals:visual/spawn_beam {x:-5,y:0,z:5,r:0.0,g:1.0,b:1.0}
execute if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_square {item:"minecraft:diamond",name:"Diamond"}

# Count netherite (dark purple beams)
scoreboard players set #offerings_found rituals.temp 0
execute positioned ~5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:5,y:0,z:5,r:0.3,g:0.15,b:0.3}
execute positioned ~5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:5,y:0,z:-5,r:0.3,g:0.15,b:0.3}
execute positioned ~-5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:-5,y:0,z:-5,r:0.3,g:0.15,b:0.3}
execute positioned ~-5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run function rituals:visual/spawn_beam {x:-5,y:0,z:5,r:0.3,g:0.15,b:0.3}
execute if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_square {item:"minecraft:netherite_ingot",name:"Netherite Ingot"}



