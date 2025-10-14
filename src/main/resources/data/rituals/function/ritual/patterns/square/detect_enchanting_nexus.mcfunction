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

# Skip detection if this ritual is already active
execute if entity @s[tag=rituals.active_ritual] run return 0

# Skip detection if the item already has ritual_active tag (bypass prevention)
scoreboard players operation #check_id rituals.temp = @s rituals.id
execute store result score #has_ritual_tag rituals.temp run execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #check_id rituals.temp if data entity @s item.components."minecraft:custom_data".ritual_active
execute if score #has_ritual_tag rituals.temp matches 1.. run return 0

# Show helpful setup message (only once per totem)
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"📚 ","color":"dark_purple"},{"text":"Enchanting Nexus Pattern Setup:","bold":true,"color":"light_purple"}]
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"  Place totems at 4 corners (4 blocks diagonally):","color":"gray"}]
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"  • NE/NW/SE/SW: ","color":"gray"},{"text":"Any ritual item","color":"light_purple","bold":true},{"text":" (🟣 Purple particles)","color":"light_purple"}]
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"  Creates a magical enchanting area!","color":"aqua","italic":true}]
tag @s add rituals.pattern_help_shown

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
# Pattern validation particles (visual indicators at missing corners)
execute unless score #totems_found rituals.temp matches 4 unless score #found_ne rituals.temp matches 1 positioned ~4 ~ ~4 run particle minecraft:dust{color:[0.5,0.0,1.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force
execute unless score #totems_found rituals.temp matches 4 unless score #found_nw rituals.temp matches 1 positioned ~-4 ~ ~4 run particle minecraft:dust{color:[0.5,0.0,1.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force
execute unless score #totems_found rituals.temp matches 4 unless score #found_se rituals.temp matches 1 positioned ~4 ~ ~-4 run particle minecraft:dust{color:[0.5,0.0,1.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force
execute unless score #totems_found rituals.temp matches 4 unless score #found_sw rituals.temp matches 1 positioned ~-4 ~ ~-4 run particle minecraft:dust{color:[0.5,0.0,1.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force


