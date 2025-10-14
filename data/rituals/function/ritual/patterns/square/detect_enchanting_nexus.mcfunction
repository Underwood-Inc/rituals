# ========================================
# Detect Enchanting Nexus Pattern (Square - 4 Corners)
# ========================================
# Central Item: Enchanting Table
# Pattern: 4 totems at corners of a 4×4 block square
# Required Items at each corner:
#   NE (+4, +4): Lapis Lazuli Block
#   SE (+4, -4): Bookshelf
#   SW (-4, -4): Amethyst Shard
#   NW (-4, +4): Experience Bottle

# Reset pattern validation
scoreboard players set #pattern_valid rituals.temp 0
scoreboard players set #totems_found rituals.temp 0

# Store this totem's position for relative checking
execute store result score #center_x rituals.temp run data get entity @s Pos[0]
execute store result score #center_y rituals.temp run data get entity @s Pos[1]
execute store result score #center_z rituals.temp run data get entity @s Pos[2]

# Check NE Corner (+4, 0, +4) - Requires Lapis Lazuli Block
scoreboard players set #found_ne rituals.temp 0
execute positioned ~4 ~ ~4 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/square/check_ne_corner

# Check SE Corner (+4, 0, -4) - Requires Bookshelf
scoreboard players set #found_se rituals.temp 0
execute positioned ~4 ~ ~-4 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/square/check_se_corner

# Check SW Corner (-4, 0, -4) - Requires Amethyst Shard
scoreboard players set #found_sw rituals.temp 0
execute positioned ~-4 ~ ~-4 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/square/check_sw_corner

# Check NW Corner (-4, 0, +4) - Requires Experience Bottle
scoreboard players set #found_nw rituals.temp 0
execute positioned ~-4 ~ ~4 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/square/check_nw_corner

# Calculate total found
scoreboard players operation #totems_found rituals.temp = #found_ne rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_se rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_sw rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_nw rituals.temp

# If all 4 corners found with correct items, pattern is valid
execute if score #totems_found rituals.temp matches 4 run function rituals:ritual/patterns/square/activate_enchanting_nexus

# If pattern incomplete, show debug message (optional)
execute unless score #totems_found rituals.temp matches 4 run tellraw @a[distance=..10] {"text":"❌ Enchanting Nexus pattern incomplete! Found ","color":"red","extra":[{"score":{"name":"#totems_found","objective":"rituals.temp"}},{"text":"/4 totems with correct items."}]}


