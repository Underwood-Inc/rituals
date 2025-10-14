# ========================================
# Detect XP Harvester Pattern (Pentagon - 5 Around)
# ========================================
# Central Item: Experience Bottle
# Pattern: 5 totems in pentagon at 5 blocks radius
# Required Items: Any items (will be consumed)

# Skip detection if this ritual is already active
execute if entity @s[tag=rituals.active_ritual] run return 0

# Skip detection if the item already has ritual_active tag (bypass prevention)
scoreboard players operation #check_id rituals.temp = @s rituals.id
execute store result score #has_ritual_tag rituals.temp run execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #check_id rituals.temp if data entity @s item.components."minecraft:custom_data".ritual_active
execute if score #has_ritual_tag rituals.temp matches 1.. run return 0

# Show helpful setup message (only once per totem)
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"✨ ","color":"aqua"},{"text":"XP Harvester Pattern Setup:","bold":true,"color":"light_purple"}]
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"  Place 5 totems in pentagon around center:","color":"gray"}]
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"  • 5 positions at 72° intervals","color":"gray"},{"text":" (💜 Purple particles)","color":"light_purple"}]
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"  Generates XP automatically!","color":"yellow","italic":true}]
tag @s add rituals.pattern_help_shown

# Reset pattern validation
scoreboard players set #pattern_valid rituals.temp 0
scoreboard players set #totems_found rituals.temp 0

# Pentagon pattern - 5 positions at 72° intervals (5 blocks radius)
# North: (0, 5)
# NE: (4.75, 1.5)  
# SE: (2.94, -4.05)
# SW: (-2.94, -4.05)
# NW: (-4.75, 1.5)

# Check North (0, 0, 5)
scoreboard players set #found_1 rituals.temp 0
execute positioned ~ ~ ~5 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/pentagon/check_pos1

# Check NE (~5, 0, ~2)
scoreboard players set #found_2 rituals.temp 0
execute positioned ~5 ~ ~2 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/pentagon/check_pos2

# Check SE (~3, 0, ~-4)
scoreboard players set #found_3 rituals.temp 0
execute positioned ~3 ~ ~-4 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/pentagon/check_pos3

# Check SW (~-3, 0, ~-4)
scoreboard players set #found_4 rituals.temp 0
execute positioned ~-3 ~ ~-4 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/pentagon/check_pos4

# Check NW (~-5, 0, ~2)
scoreboard players set #found_5 rituals.temp 0
execute positioned ~-5 ~ ~2 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/pentagon/check_pos5

# Calculate total found
scoreboard players operation #totems_found rituals.temp = #found_1 rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_2 rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_3 rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_4 rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_5 rituals.temp

# If all 5 positions found with items, pattern is valid
# Fire is already verified by the fire sacrifice system before this is called
execute if score #totems_found rituals.temp matches 5 run function rituals:ritual/patterns/pentagon/activate_xp_harvester

# Pattern validation particles (only show if pattern incomplete)
# Show visual indicators at expected totem positions
execute unless score #totems_found rituals.temp matches 5 unless score #found_1 rituals.temp matches 1 positioned ~ ~ ~5 run particle minecraft:dust{color:[0.8,0.0,1.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force
execute unless score #totems_found rituals.temp matches 5 unless score #found_2 rituals.temp matches 1 positioned ~5 ~ ~2 run particle minecraft:dust{color:[0.8,0.0,1.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force
execute unless score #totems_found rituals.temp matches 5 unless score #found_3 rituals.temp matches 1 positioned ~3 ~ ~-4 run particle minecraft:dust{color:[0.8,0.0,1.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force
execute unless score #totems_found rituals.temp matches 5 unless score #found_4 rituals.temp matches 1 positioned ~-3 ~ ~-4 run particle minecraft:dust{color:[0.8,0.0,1.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force
execute unless score #totems_found rituals.temp matches 5 unless score #found_5 rituals.temp matches 1 positioned ~-5 ~ ~2 run particle minecraft:dust{color:[0.8,0.0,1.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force

