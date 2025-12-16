# ========================================
# Detect Soul Ascension (for already-awakened items)
# ========================================
# Checks if a soul-embodied item is ready for ascension
# Same star pattern but for items that already have soul_embodied=true
# NOTE: XP sync is handled by sync_from_totem when item is placed!

# Skip if already an active ritual
execute if entity @s[tag=rituals.active_ritual] run return 0

# Check if the central item IS already soul-embodied
scoreboard players operation #check_ascend_id rituals.temp = @s rituals.id
execute store result score #is_soul_item rituals.temp run execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #check_ascend_id rituals.temp if data entity @s item.components."minecraft:custom_data".soul_embodied

# If not a soul item, skip (let detect_soul_embodiment handle it)
execute if score #is_soul_item rituals.temp matches 0 run return 0

# Check if ready to ascend
execute store result score #ready_ascend rituals.temp run execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #check_ascend_id rituals.temp if data entity @s item.components."minecraft:custom_data"{soul_ready_ascend:1b}

# If not ready to ascend, nothing to do here - sync_from_totem already handled XP
execute if score #ready_ascend rituals.temp matches 0 run return 0

# Item is ready for ascension! Check the pattern
# Reset pattern validation
scoreboard players set #totems_found rituals.temp 0

# Check all four cardinal positions (same items as initial awakening)
scoreboard players set #found_n rituals.temp 0
execute positioned ~ ~ ~5 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/star/check_soul_north

scoreboard players set #found_e rituals.temp 0
execute positioned ~5 ~ ~ as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/star/check_soul_east

scoreboard players set #found_s rituals.temp 0
execute positioned ~ ~ ~-5 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/star/check_soul_south

scoreboard players set #found_w rituals.temp 0
execute positioned ~-5 ~ ~ as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/star/check_soul_west

# Calculate total found
scoreboard players operation #totems_found rituals.temp = #found_n rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_e rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_s rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_w rituals.temp

# If all 4 found, perform ascension!
execute if score #totems_found rituals.temp matches 4 run function rituals:ritual/patterns/star/activate_soul_ascension

# Visual indicators if pattern incomplete
execute unless score #totems_found rituals.temp matches 4 run tellraw @a[distance=..10] [{"text":"✦ ","color":"light_purple"},{"text":"Ascension requires the same ritual pattern!","color":"gray"}]

