# ========================================
# Detect Auto-Farming Ritual Pattern
# ========================================
# Square pattern: 1 central totem + 4 corner totems
# Central: Diamond Hoe
# Corners: Specific farming-related items

# Initialize counters
scoreboard players set #totems_found rituals.temp 0

# Check each corner position (5 blocks away diagonally)
# NE Corner (+X, +Z)
execute positioned ~5 ~ ~5 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/square/check_ne_corner

# SE Corner (+X, -Z)
execute positioned ~5 ~ ~-5 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/square/check_se_corner

# SW Corner (-X, -Z)
execute positioned ~-5 ~ ~-5 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/square/check_sw_corner

# NW Corner (-X, +Z)
execute positioned ~-5 ~ ~5 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/square/check_nw_corner

# If all 4 corners found, activate the ritual
execute if score #totems_found rituals.temp matches 4 run function rituals:ritual/patterns/square/activate_auto_farming


