# ========================================
# Detect Offerings for SQUARE Pattern Rituals
# ========================================
# Checks for catalyst items at the 4 DIAGONAL CORNER positions
# Used for: Auto-Farming (Diamond Hoe)
# Positions: NE (+5,+5), SE (+5,-5), SW (-5,-5), NW (-5,+5)

# Count coal
scoreboard players set #offerings_found rituals.temp 0
execute positioned ~5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_square {item:"minecraft:coal",name:"Coal"}

# Count copper
scoreboard players set #offerings_found rituals.temp 0
execute positioned ~5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_square {item:"minecraft:copper_ingot",name:"Copper Ingot"}

# Count iron
scoreboard players set #offerings_found rituals.temp 0
execute positioned ~5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_square {item:"minecraft:iron_ingot",name:"Iron Ingot"}

# Count gold
scoreboard players set #offerings_found rituals.temp 0
execute positioned ~5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_square {item:"minecraft:gold_ingot",name:"Gold Ingot"}

# Count diamond
scoreboard players set #offerings_found rituals.temp 0
execute positioned ~5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_square {item:"minecraft:diamond",name:"Diamond"}

# Count netherite
scoreboard players set #offerings_found rituals.temp 0
execute positioned ~5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-5 ~ ~-5 if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute positioned ~-5 ~ ~5 if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_square {item:"minecraft:netherite_ingot",name:"Netherite Ingot"}



