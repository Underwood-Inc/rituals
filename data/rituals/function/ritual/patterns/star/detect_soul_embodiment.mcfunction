# ========================================
# Detect Soul Embodiment Pattern (Star - 4 Cardinals)
# ========================================
# Central Item: Any item (soul embodiment is universal)
# Pattern: 4 totems in cardinal directions (N/E/S/W) at 5 blocks distance
# Required Items:
#   North (0, +5): Soul Sand
#   East (+5, 0): Ender Pearl
#   South (0, -5): Glowstone Dust
#   West (-5, 0): Amethyst Shard

# Skip if already an active ritual
execute if entity @s[tag=rituals.active_ritual] run return 0

# Get this totem's ID
scoreboard players operation #check_soul_id rituals.temp = @s rituals.id

# Skip if the central item is already soul-embodied
execute store result score #is_soul_item rituals.temp run execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #check_soul_id rituals.temp if data entity @s item.components."minecraft:custom_data".soul_embodied
execute if score #is_soul_item rituals.temp matches 1.. run return 0

# Show setup help message (only once per totem)
execute unless entity @s[tag=rituals.soul_help_shown] run tellraw @a[distance=..10] [{"text":"✦ ","color":"light_purple"},{"text":"Soul Embodiment Pattern Setup:","bold":true,"color":"dark_purple"}]
execute unless entity @s[tag=rituals.soul_help_shown] run tellraw @a[distance=..10] [{"text":"  Place totems 5 blocks away in cardinal directions:","color":"gray"}]
execute unless entity @s[tag=rituals.soul_help_shown] run tellraw @a[distance=..10] [{"text":"  • North: ","color":"gray"},{"text":"Soul Sand","color":"#8B6914","bold":true}]
execute unless entity @s[tag=rituals.soul_help_shown] run tellraw @a[distance=..10] [{"text":"  • East: ","color":"gray"},{"text":"Ender Pearl","color":"#0A7A7A","bold":true}]
execute unless entity @s[tag=rituals.soul_help_shown] run tellraw @a[distance=..10] [{"text":"  • South: ","color":"gray"},{"text":"Glowstone Dust","color":"#FFCC00","bold":true}]
execute unless entity @s[tag=rituals.soul_help_shown] run tellraw @a[distance=..10] [{"text":"  • West: ","color":"gray"},{"text":"Amethyst Shard","color":"#9966CC","bold":true}]
tag @s add rituals.soul_help_shown

# Reset pattern validation
scoreboard players set #pattern_valid rituals.temp 0
scoreboard players set #totems_found rituals.temp 0

# Check North (+0, 0, +5) - Requires Soul Sand
scoreboard players set #found_n rituals.temp 0
execute positioned ~ ~ ~5 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/star/check_soul_north

# Check East (+5, 0, 0) - Requires Ender Pearl
scoreboard players set #found_e rituals.temp 0
execute positioned ~5 ~ ~ as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/star/check_soul_east

# Check South (0, 0, -5) - Requires Glowstone Dust
scoreboard players set #found_s rituals.temp 0
execute positioned ~ ~ ~-5 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/star/check_soul_south

# Check West (-5, 0, 0) - Requires Amethyst Shard
scoreboard players set #found_w rituals.temp 0
execute positioned ~-5 ~ ~ as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/star/check_soul_west

# Calculate total found
scoreboard players operation #totems_found rituals.temp = #found_n rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_e rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_s rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_w rituals.temp

# If all 4 cardinals found with correct items, activate!
execute if score #totems_found rituals.temp matches 4 run function rituals:ritual/patterns/star/activate_soul_embodiment

# Show visual indicators at expected positions if pattern incomplete
execute unless score #totems_found rituals.temp matches 4 unless score #found_n rituals.temp matches 1 positioned ~ ~ ~5 run particle minecraft:dust{color:[0.55,0.41,0.08],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force
execute unless score #totems_found rituals.temp matches 4 unless score #found_e rituals.temp matches 1 positioned ~5 ~ ~ run particle minecraft:dust{color:[0.04,0.48,0.48],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force
execute unless score #totems_found rituals.temp matches 4 unless score #found_s rituals.temp matches 1 positioned ~ ~ ~-5 run particle minecraft:dust{color:[1.0,0.8,0.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force
execute unless score #totems_found rituals.temp matches 4 unless score #found_w rituals.temp matches 1 positioned ~-5 ~ ~ run particle minecraft:dust{color:[0.6,0.4,0.8],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 3 force
