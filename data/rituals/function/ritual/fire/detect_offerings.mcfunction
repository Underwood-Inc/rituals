# ========================================
# Detect Offerings Around Totem
# ========================================
# Checks for catalyst items in the 4 cardinal directions
# Runs as and at the totem
# NOW WITH TIER CHECKING: Each tier requires its specific material

# Tier 1 (Wood) - Count coal nearby (black beams)
execute if score @s rituals.tier matches 1 run scoreboard players set #offerings_found rituals.temp 0
execute if score @s rituals.tier matches 1 positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score @s rituals.tier matches 1 positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score @s rituals.tier matches 1 positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score @s rituals.tier matches 1 positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:coal"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score @s rituals.tier matches 1 if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_coal

# Tier 2 (Copper) - Count copper (copper/orange beams)
execute if score @s rituals.tier matches 2 run scoreboard players set #offerings_found rituals.temp 0
execute if score @s rituals.tier matches 2 positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score @s rituals.tier matches 2 positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score @s rituals.tier matches 2 positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score @s rituals.tier matches 2 positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score @s rituals.tier matches 2 if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_copper

# Tier 3 (Iron) - Count iron (gray beams)
execute if score @s rituals.tier matches 3 run scoreboard players set #offerings_found rituals.temp 0
execute if score @s rituals.tier matches 3 positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score @s rituals.tier matches 3 positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score @s rituals.tier matches 3 positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score @s rituals.tier matches 3 positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score @s rituals.tier matches 3 if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_iron

# Tier 4 (Gold) - Count gold (golden yellow beams)
execute if score @s rituals.tier matches 4 run scoreboard players set #offerings_found rituals.temp 0
execute if score @s rituals.tier matches 4 positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score @s rituals.tier matches 4 positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score @s rituals.tier matches 4 positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score @s rituals.tier matches 4 positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score @s rituals.tier matches 4 if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_gold

# Tier 5 (Diamond) - Count diamonds (cyan beams)
execute if score @s rituals.tier matches 5 run scoreboard players set #offerings_found rituals.temp 0
execute if score @s rituals.tier matches 5 positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score @s rituals.tier matches 5 positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score @s rituals.tier matches 5 positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score @s rituals.tier matches 5 positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score @s rituals.tier matches 5 if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_diamond

# Tier 6 (Netherite) - Count netherite (dark purple beams)
execute if score @s rituals.tier matches 6 run scoreboard players set #offerings_found rituals.temp 0
execute if score @s rituals.tier matches 6 positioned ~ ~ ~-2 if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score @s rituals.tier matches 6 positioned ~ ~ ~2 if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score @s rituals.tier matches 6 positioned ~2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score @s rituals.tier matches 6 positioned ~-2 ~ ~ if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot"}},distance=..1] run scoreboard players add #offerings_found rituals.temp 1
execute if score @s rituals.tier matches 6 if score #offerings_found rituals.temp matches 4.. run function rituals:ritual/fire/consume_netherite


