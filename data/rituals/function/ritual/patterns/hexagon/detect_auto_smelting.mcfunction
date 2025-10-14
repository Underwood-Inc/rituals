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

# Skip detection if this ritual is already active
execute if entity @s[tag=rituals.active_ritual] run return 0

# Skip detection if the item already has ritual_active tag (bypass prevention)
scoreboard players operation #check_id rituals.temp = @s rituals.id
execute store result score #has_ritual_tag rituals.temp run execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #check_id rituals.temp if data entity @s item.components."minecraft:custom_data".ritual_active
execute if score #has_ritual_tag rituals.temp matches 1.. run return 0

# Show helpful setup message (only once per totem)
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"🔥 ","color":"gold"},{"text":"Auto-Smelting Pattern Setup:","bold":true,"color":"#FF8C00"}]
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"  Place 6 totems in hexagon around center:","color":"gray"}]
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"  • N/NE/SE/S/SW/NW: ","color":"gray"},{"text":"Any ritual items","color":"#FF8C00","bold":true},{"text":" (🟠 Orange particles)","color":"#FF8C00"}]
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"  Enchants furnace for instant smelting!","color":"yellow","italic":true}]
tag @s add rituals.pattern_help_shown

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
# Fire is already verified by the fire sacrifice system before this is called
execute if score #totems_found rituals.temp matches 6 run function rituals:ritual/patterns/hexagon/activate_auto_smelting

# If pattern incomplete, show debug message
# Pattern validation particles (visual indicators at missing hexagon positions)
execute unless score #totems_found rituals.temp matches 6 unless score #found_n rituals.temp matches 1 positioned ~ ~ ~5 run particle minecraft:dust{color:[1.0,0.4,0.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force
execute unless score #totems_found rituals.temp matches 6 unless score #found_ne rituals.temp matches 1 positioned ~4 ~ ~3 run particle minecraft:dust{color:[1.0,0.4,0.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force
execute unless score #totems_found rituals.temp matches 6 unless score #found_se rituals.temp matches 1 positioned ~4 ~ ~-3 run particle minecraft:dust{color:[1.0,0.4,0.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force
execute unless score #totems_found rituals.temp matches 6 unless score #found_s rituals.temp matches 1 positioned ~ ~ ~-5 run particle minecraft:dust{color:[1.0,0.4,0.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force
execute unless score #totems_found rituals.temp matches 6 unless score #found_sw rituals.temp matches 1 positioned ~-4 ~ ~-3 run particle minecraft:dust{color:[1.0,0.4,0.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force
execute unless score #totems_found rituals.temp matches 6 unless score #found_nw rituals.temp matches 1 positioned ~-4 ~ ~3 run particle minecraft:dust{color:[1.0,0.4,0.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force


