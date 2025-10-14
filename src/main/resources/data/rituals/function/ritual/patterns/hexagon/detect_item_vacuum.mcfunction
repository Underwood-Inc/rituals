# ========================================
# Detect Item Vacuum Pattern (Hexagon - 6 Around)
# ========================================
# Central Item: Hopper
# Pattern: 6 totems in hexagon at 6 blocks radius
# Required Items:
#   North (0, +6): Ender Pearl
#   NE (+5, +3): Iron Ingot (Magnet)
#   SE (+5, -3): Redstone Dust
#   South (0, -6): Dropper
#   SW (-5, -3): Chest
#   NW (-5, +3): Observer

# Skip detection if this ritual is already active
execute if entity @s[tag=rituals.active_ritual] run return 0

# Skip detection if the item already has ritual_active tag (bypass prevention)
scoreboard players operation #check_id rituals.temp = @s rituals.id
execute store result score #has_ritual_tag rituals.temp run execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #check_id rituals.temp if data entity @s item.components."minecraft:custom_data".ritual_active
execute if score #has_ritual_tag rituals.temp matches 1.. run return 0

# Show helpful setup message (only once per totem)
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"🔹 ","color":"aqua"},{"text":"Item Vacuum Pattern Setup:","bold":true,"color":"cyan"}]
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"  Place 6 totems in hexagon around center:","color":"gray"}]
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"  • N/NE/SE/S/SW/NW: ","color":"gray"},{"text":"Any ritual items","color":"cyan","bold":true},{"text":" (🔵 Cyan particles)","color":"cyan"}]
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"  Enchants the hopper with vacuum power!","color":"aqua","italic":true}]
tag @s add rituals.pattern_help_shown

# Reset pattern validation
scoreboard players set #pattern_valid rituals.temp 0
scoreboard players set #totems_found rituals.temp 0

# Check North (0, 0, +6) - Requires Ender Pearl
scoreboard players set #found_n rituals.temp 0
execute positioned ~ ~ ~6 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/hexagon/check_north_vacuum

# Check NE (+5, 0, +3) - Requires Iron Ingot
scoreboard players set #found_ne rituals.temp 0
execute positioned ~5 ~ ~3 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/hexagon/check_ne_vacuum

# Check SE (+5, 0, -3) - Requires Redstone Dust
scoreboard players set #found_se rituals.temp 0
execute positioned ~5 ~ ~-3 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/hexagon/check_se_vacuum

# Check South (0, 0, -6) - Requires Dropper
scoreboard players set #found_s rituals.temp 0
execute positioned ~ ~ ~-6 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/hexagon/check_south_vacuum

# Check SW (-5, 0, -3) - Requires Chest
scoreboard players set #found_sw rituals.temp 0
execute positioned ~-5 ~ ~-3 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/hexagon/check_sw_vacuum

# Check NW (-5, 0, +3) - Requires Observer
scoreboard players set #found_nw rituals.temp 0
execute positioned ~-5 ~ ~3 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/hexagon/check_nw_vacuum

# Calculate total found
scoreboard players operation #totems_found rituals.temp = #found_n rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_ne rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_se rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_s rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_sw rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_nw rituals.temp

# If all 6 hexagon points found with correct items, pattern is valid
execute if score #totems_found rituals.temp matches 6 run function rituals:ritual/patterns/hexagon/activate_item_vacuum

# If pattern incomplete, show debug message
# Pattern validation particles (visual indicators at missing hexagon positions)
execute unless score #totems_found rituals.temp matches 6 unless score #found_n rituals.temp matches 1 positioned ~ ~ ~5 run particle minecraft:dust{color:[0.0,0.8,1.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force
execute unless score #totems_found rituals.temp matches 6 unless score #found_ne rituals.temp matches 1 positioned ~4 ~ ~3 run particle minecraft:dust{color:[0.0,0.8,1.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force
execute unless score #totems_found rituals.temp matches 6 unless score #found_se rituals.temp matches 1 positioned ~4 ~ ~-3 run particle minecraft:dust{color:[0.0,0.8,1.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force
execute unless score #totems_found rituals.temp matches 6 unless score #found_s rituals.temp matches 1 positioned ~ ~ ~-5 run particle minecraft:dust{color:[0.0,0.8,1.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force
execute unless score #totems_found rituals.temp matches 6 unless score #found_sw rituals.temp matches 1 positioned ~-4 ~ ~-3 run particle minecraft:dust{color:[0.0,0.8,1.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force
execute unless score #totems_found rituals.temp matches 6 unless score #found_nw rituals.temp matches 1 positioned ~-4 ~ ~3 run particle minecraft:dust{color:[0.0,0.8,1.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force


