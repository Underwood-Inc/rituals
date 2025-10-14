# ========================================
# Detect Auto-Smelting Pattern (Hexagon - 6 Around)
# ========================================
# Central Item: Blast Furnace
# Pattern: 6 totems in hexagon at 6 blocks radius
# Required Items:
#   North (0, +6): Blaze Rod
#   NE (+5, +3): Coal Block
#   SE (+5, -3): Lava Bucket
#   South (0, -6): Fire Charge
#   SW (-5, -3): Magma Block
#   NW (-5, +3): Soul Campfire

# Reset pattern validation
scoreboard players set #pattern_valid rituals.temp 0
scoreboard players set #totems_found rituals.temp 0

# Check North (0, 0, +6) - Requires Blaze Rod
scoreboard players set #found_n rituals.temp 0
execute positioned ~ ~ ~6 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/hexagon/check_north_smelting

# Check NE (+5, 0, +3) - Requires Coal Block
scoreboard players set #found_ne rituals.temp 0
execute positioned ~5 ~ ~3 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/hexagon/check_ne_smelting

# Check SE (+5, 0, -3) - Requires Lava Bucket
scoreboard players set #found_se rituals.temp 0
execute positioned ~5 ~ ~-3 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/hexagon/check_se_smelting

# Check South (0, 0, -6) - Requires Fire Charge
scoreboard players set #found_s rituals.temp 0
execute positioned ~ ~ ~-6 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/hexagon/check_south_smelting

# Check SW (-5, 0, -3) - Requires Magma Block
scoreboard players set #found_sw rituals.temp 0
execute positioned ~-5 ~ ~-3 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/hexagon/check_sw_smelting

# Check NW (-5, 0, +3) - Requires Soul Campfire
scoreboard players set #found_nw rituals.temp 0
execute positioned ~-5 ~ ~3 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/hexagon/check_nw_smelting

# Calculate total found
scoreboard players operation #totems_found rituals.temp = #found_n rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_ne rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_se rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_s rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_sw rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_nw rituals.temp

# If all 6 hexagon points found with correct items, pattern is valid
execute if score #totems_found rituals.temp matches 6 run function rituals:ritual/patterns/hexagon/activate_auto_smelting

# If pattern incomplete, show debug message
execute unless score #totems_found rituals.temp matches 6 run tellraw @a[distance=..10] {"text":"❌ Auto-Smelting pattern incomplete! Found ","color":"red","extra":[{"score":{"name":"#totems_found","objective":"rituals.temp"}},{"text":"/6 totems with correct items."}]}


