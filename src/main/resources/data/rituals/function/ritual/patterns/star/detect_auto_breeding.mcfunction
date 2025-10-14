# ========================================
# Detect Auto-Breeding Pattern (Star - 4 Cardinals)
# ========================================
# Central Item: Wheat
# Pattern: 4 totems in cardinal directions (N/E/S/W) at 5 blocks distance
# Required Items:
#   North (0, +5): Seeds
#   East (+5, 0): Carrot
#   South (0, -5): Potato
#   West (-5, 0): Beetroot Seeds

# Skip detection if this ritual is already active
execute if entity @s[tag=rituals.active_ritual] run return 0

# Skip detection if the item already has ritual_active tag (bypass prevention)
scoreboard players operation #check_id rituals.temp = @s rituals.id
execute store result score #has_ritual_tag rituals.temp run execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #check_id rituals.temp if data entity @s item.components."minecraft:custom_data".ritual_active
execute if score #has_ritual_tag rituals.temp matches 1.. run return 0

# Show helpful setup message (only once per totem)
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"🌾 ","color":"gold"},{"text":"Auto-Breeding Pattern Setup:","bold":true,"color":"yellow"}]
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"  Place totems 5 blocks away in cardinal directions:","color":"gray"}]
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"  • North: ","color":"gray"},{"text":"Seeds","color":"green","bold":true},{"text":" (🟢 Green particles)","color":"green"}]
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"  • East: ","color":"gray"},{"text":"Carrot","color":"#FF8C00","bold":true},{"text":" (🟠 Orange particles)","color":"#FF8C00"}]
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"  • South: ","color":"gray"},{"text":"Potato","color":"#CD853F","bold":true},{"text":" (🟤 Brown particles)","color":"#CD853F"}]
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"  • West: ","color":"gray"},{"text":"Beetroot Seeds","color":"red","bold":true},{"text":" (🔴 Red particles)","color":"red"}]
tag @s add rituals.pattern_help_shown

# Reset pattern validation
scoreboard players set #pattern_valid rituals.temp 0
scoreboard players set #totems_found rituals.temp 0

# Check North (+0, 0, +5) - Requires Seeds
scoreboard players set #found_n rituals.temp 0
execute positioned ~ ~ ~5 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/star/check_north

# Check East (+5, 0, 0) - Requires Carrot
scoreboard players set #found_e rituals.temp 0
execute positioned ~5 ~ ~ as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/star/check_east

# Check South (0, 0, -5) - Requires Potato
scoreboard players set #found_s rituals.temp 0
execute positioned ~ ~ ~-5 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/star/check_south

# Check West (-5, 0, 0) - Requires Beetroot Seeds
scoreboard players set #found_w rituals.temp 0
execute positioned ~-5 ~ ~ as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/star/check_west

# Calculate total found
scoreboard players operation #totems_found rituals.temp = #found_n rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_e rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_s rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_w rituals.temp

# If all 4 cardinals found with correct items, pattern is valid
execute if score #totems_found rituals.temp matches 4 run function rituals:ritual/patterns/star/activate_auto_breeding

# Pattern validation particles (only show if pattern incomplete)
# Show visual indicators at expected totem positions
execute unless score #totems_found rituals.temp matches 4 unless score #found_n rituals.temp matches 1 positioned ~ ~ ~5 run particle minecraft:dust{color:[0.0,1.0,0.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force
execute unless score #totems_found rituals.temp matches 4 unless score #found_e rituals.temp matches 1 positioned ~5 ~ ~ run particle minecraft:dust{color:[1.0,0.5,0.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force
execute unless score #totems_found rituals.temp matches 4 unless score #found_s rituals.temp matches 1 positioned ~ ~ ~-5 run particle minecraft:dust{color:[0.8,0.6,0.4],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force
execute unless score #totems_found rituals.temp matches 4 unless score #found_w rituals.temp matches 1 positioned ~-5 ~ ~ run particle minecraft:dust{color:[0.8,0.0,0.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force


