# ========================================
# Detect Auto-Farming Ritual Pattern (REWRITTEN)
# ========================================
# Square pattern: 1 central totem (diamond hoe) + 4 corner totems (crops)
# Central: Diamond Hoe
# NE Corner (+5, 0, +5): Wheat
# SE Corner (+5, 0, -5): Carrot
# SW Corner (-5, 0, -5): Potato
# NW Corner (-5, 0, +5): Beetroot

# Initialize: Assume all corners are valid, then check each
scoreboard players set #pattern_valid rituals.temp 1
scoreboard players set #corner_count rituals.temp 0

# ========================================
# Check NE Corner (+5, 0, +5) - MUST be Wheat
# ========================================
scoreboard players set #corner_ne rituals.temp 0
execute positioned ~5 ~ ~5 if entity @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run scoreboard players set #corner_ne rituals.temp 1
execute if score #corner_ne rituals.temp matches 1 positioned ~5 ~ ~5 unless entity @e[type=item_display,tag=rituals.totem_display,distance=..2,nbt={item:{id:"minecraft:wheat"}}] run scoreboard players set #corner_ne rituals.temp 0
execute if score #corner_ne rituals.temp matches 1 run scoreboard players add #corner_count rituals.temp 1

# ========================================
# Check SE Corner (+5, 0, -5) - MUST be Carrot
# ========================================
scoreboard players set #corner_se rituals.temp 0
execute positioned ~5 ~ ~-5 if entity @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run scoreboard players set #corner_se rituals.temp 1
execute if score #corner_se rituals.temp matches 1 positioned ~5 ~ ~-5 unless entity @e[type=item_display,tag=rituals.totem_display,distance=..2,nbt={item:{id:"minecraft:carrot"}}] run scoreboard players set #corner_se rituals.temp 0
execute if score #corner_se rituals.temp matches 1 run scoreboard players add #corner_count rituals.temp 1

# ========================================
# Check SW Corner (-5, 0, -5) - MUST be Potato
# ========================================
scoreboard players set #corner_sw rituals.temp 0
execute positioned ~-5 ~ ~-5 if entity @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run scoreboard players set #corner_sw rituals.temp 1
execute if score #corner_sw rituals.temp matches 1 positioned ~-5 ~ ~-5 unless entity @e[type=item_display,tag=rituals.totem_display,distance=..2,nbt={item:{id:"minecraft:potato"}}] run scoreboard players set #corner_sw rituals.temp 0
execute if score #corner_sw rituals.temp matches 1 run scoreboard players add #corner_count rituals.temp 1

# ========================================
# Check NW Corner (-5, 0, +5) - MUST be Beetroot
# ========================================
scoreboard players set #corner_nw rituals.temp 0
execute positioned ~-5 ~ ~5 if entity @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run scoreboard players set #corner_nw rituals.temp 1
execute if score #corner_nw rituals.temp matches 1 positioned ~-5 ~ ~5 unless entity @e[type=item_display,tag=rituals.totem_display,distance=..2,nbt={item:{id:"minecraft:beetroot"}}] run scoreboard players set #corner_nw rituals.temp 0
execute if score #corner_nw rituals.temp matches 1 run scoreboard players add #corner_count rituals.temp 1

# ========================================
# Validation: Need ALL 4 corners with correct items
# ========================================
execute unless score #corner_count rituals.temp matches 4 run scoreboard players set #pattern_valid rituals.temp 0

# ========================================
# Activate if pattern is complete
# ========================================
execute if score #pattern_valid rituals.temp matches 1 run function rituals:ritual/patterns/square/activate_auto_farming


