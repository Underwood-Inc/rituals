# ========================================
# Detect Auto-Farming Pattern (Square - 4 Diagonal Corners)
# ========================================
# Central Item: Diamond Hoe
# Pattern: 4 totems in diagonal corners at 5 blocks distance
# Required Items:
#   NE Corner (+5, 0, +5): Wheat
#   SE Corner (+5, 0, -5): Carrot
#   SW Corner (-5, 0, -5): Potato
#   NW Corner (-5, 0, +5): Beetroot

# Skip detection if this ritual is already active
execute if entity @s[tag=rituals.active_ritual] run return 0

# Skip detection if the item already has ritual_active tag (bypass prevention)
scoreboard players operation #check_id rituals.temp = @s rituals.id
execute store result score #has_ritual_tag rituals.temp run execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #check_id rituals.temp if data entity @s item.components."minecraft:custom_data".ritual_active
execute if score #has_ritual_tag rituals.temp matches 1.. run return 0

# Show helpful setup message (only once per totem)
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"🌾 ","color":"gold"},{"text":"Auto-Farming Pattern Setup:","bold":true,"color":"yellow"}]
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"  Place totems 5 blocks away at diagonal corners:","color":"gray"}]
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"  • NE Corner: ","color":"gray"},{"text":"Wheat","color":"yellow","bold":true}]
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"  • SE Corner: ","color":"gray"},{"text":"Carrot","color":"#FF8C00","bold":true}]
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"  • SW Corner: ","color":"gray"},{"text":"Potato","color":"#CD853F","bold":true}]
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"  • NW Corner: ","color":"gray"},{"text":"Beetroot","color":"red","bold":true}]
tag @s add rituals.pattern_help_shown

# Reset pattern validation
scoreboard players set #pattern_valid rituals.temp 0
scoreboard players set #totems_found rituals.temp 0

# Check NE Corner (+5, 0, +5) - Requires Wheat
scoreboard players set #found_ne rituals.temp 0
execute positioned ~5 ~ ~5 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/square/check_ne

# Check SE Corner (+5, 0, -5) - Requires Carrot
scoreboard players set #found_se rituals.temp 0
execute positioned ~5 ~ ~-5 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/square/check_se

# Check SW Corner (-5, 0, -5) - Requires Potato
scoreboard players set #found_sw rituals.temp 0
execute positioned ~-5 ~ ~-5 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/square/check_sw

# Check NW Corner (-5, 0, +5) - Requires Beetroot
scoreboard players set #found_nw rituals.temp 0
execute positioned ~-5 ~ ~5 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/square/check_nw

# Calculate total found
scoreboard players operation #totems_found rituals.temp = #found_ne rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_se rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_sw rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_nw rituals.temp

# If all 4 corners found with correct items, pattern is valid
# Fire is already verified by the fire sacrifice system before this is called
# Just activate directly!
execute if score #totems_found rituals.temp matches 4 run function rituals:ritual/patterns/square/activate_auto_farming
