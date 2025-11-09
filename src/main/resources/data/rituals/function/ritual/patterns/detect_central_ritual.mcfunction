# ========================================
# Detect Ritual Type from Central Totem Item
# ========================================
# Runs when checking for pattern-based rituals
# Determines which pattern to check based on central totem's displayed item

# Get the item displayed on this totem
scoreboard players operation #central_totem_id rituals.temp = @s rituals.id
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #central_totem_id rituals.temp run data modify storage rituals:temp central_item set from entity @s item.id

# PATTERN-BASED AREA EFFECT RITUALS - now configurable via mod menu!
# Just check the patterns and activate if valid - that's it!

# Auto-Farming - Square pattern (4 corners)
data modify storage rituals:temp test_item set from storage rituals:registry pattern_rituals[{id:"auto_farming"}].central_item
execute store success score #match rituals.temp run data modify storage rituals:temp test_item set from storage rituals:temp central_item
execute if score #match rituals.temp matches 0 run function rituals:ritual/patterns/square/detect_auto_farming

# Auto-Breeding - Star pattern (4 cardinals)
data modify storage rituals:temp test_item set from storage rituals:registry pattern_rituals[{id:"auto_breeding"}].central_item
execute store success score #match rituals.temp run data modify storage rituals:temp test_item set from storage rituals:temp central_item
execute if score #match rituals.temp matches 0 run function rituals:ritual/patterns/star/detect_auto_breeding

# Flight Zone - Septagon pattern (7 around) - NOT IMPLEMENTED YET
# execute if data storage rituals:temp {central_item:"minecraft:elytra"} run function rituals:ritual/patterns/septagon/detect_flight_zone

# Weather Control - Septagon pattern (7 around) - NOT IMPLEMENTED YET
# execute if data storage rituals:temp {central_item:"minecraft:lightning_rod"} run function rituals:ritual/patterns/septagon/detect_weather_control

# Forcefield - Octagon pattern (8 around) - NOT IMPLEMENTED YET
# execute if data storage rituals:temp {central_item:"minecraft:end_crystal"} run function rituals:ritual/patterns/octagon/detect_forcefield

# Mob Repellent - Octagon pattern (8 around) - NOT IMPLEMENTED YET
# execute if data storage rituals:temp {central_item:"minecraft:zombie_head"} run function rituals:ritual/patterns/octagon/detect_mob_repellent

# Time Warp - Nonagon pattern (9 around) - NOT IMPLEMENTED YET
# execute if data storage rituals:temp {central_item:"minecraft:clock"} run function rituals:ritual/patterns/nonagon/detect_time_warp


