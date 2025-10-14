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

# If pattern incomplete, show debug message
execute unless score #totems_found rituals.temp matches 4 run tellraw @a[distance=..10] {"text":"❌ Auto-Breeding pattern incomplete! Found ","color":"red","extra":[{"score":{"name":"#totems_found","objective":"rituals.temp"}},{"text":"/4 totems with correct items."}]}


