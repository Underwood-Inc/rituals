# ========================================
# Detect Ritual Type from Central Totem Item
# ========================================
# Runs when checking for pattern-based rituals
# Determines which pattern to check based on central totem's displayed item
# Soul Embodiment accepts ANY item — specific rituals match first, everything else falls through

# Get the item displayed on this totem
scoreboard players operation #central_totem_id rituals.temp = @s rituals.id
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #central_totem_id rituals.temp run data modify storage rituals:temp central_item set from entity @s item.id

# === SOUL ASCENSION (already soul-embodied items, any type) ===
execute store result score #is_already_soul rituals.temp run execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #central_totem_id rituals.temp if data entity @s item.components."minecraft:custom_data".soul_embodied
execute if score #is_already_soul rituals.temp matches 1.. run function rituals:ritual/patterns/star/detect_soul_ascension
execute if score #is_already_soul rituals.temp matches 1.. run return 0

# === PATTERN-BASED AREA EFFECT RITUALS ===
# Specific items trigger specific rituals — checked before soul embodiment fallthrough

# Auto-Farming - Square pattern (4 corners)
execute if data storage rituals:temp {central_item:"minecraft:diamond_hoe"} run function rituals:ritual/patterns/square/detect_auto_farming
execute if data storage rituals:temp {central_item:"minecraft:diamond_hoe"} run return 0

# Auto-Breeding - Star pattern (4 cardinals)
execute if data storage rituals:temp {central_item:"minecraft:wheat"} run function rituals:ritual/patterns/star/detect_auto_breeding
execute if data storage rituals:temp {central_item:"minecraft:wheat"} run return 0

# Flight Zone - Septagon pattern (7 around) - NOT IMPLEMENTED YET
# execute if data storage rituals:temp {central_item:"minecraft:elytra"} run function rituals:ritual/patterns/septagon/detect_flight_zone
# execute if data storage rituals:temp {central_item:"minecraft:elytra"} run return 0

# Weather Control - Septagon pattern (7 around) - NOT IMPLEMENTED YET
# execute if data storage rituals:temp {central_item:"minecraft:lightning_rod"} run function rituals:ritual/patterns/septagon/detect_weather_control
# execute if data storage rituals:temp {central_item:"minecraft:lightning_rod"} run return 0

# Forcefield - Octagon pattern (8 around) - NOT IMPLEMENTED YET
# execute if data storage rituals:temp {central_item:"minecraft:end_crystal"} run function rituals:ritual/patterns/octagon/detect_forcefield
# execute if data storage rituals:temp {central_item:"minecraft:end_crystal"} run return 0

# Mob Repellent - Octagon pattern (8 around) - NOT IMPLEMENTED YET
# execute if data storage rituals:temp {central_item:"minecraft:zombie_head"} run function rituals:ritual/patterns/octagon/detect_mob_repellent
# execute if data storage rituals:temp {central_item:"minecraft:zombie_head"} run return 0

# Time Warp - Nonagon pattern (9 around) - NOT IMPLEMENTED YET
# execute if data storage rituals:temp {central_item:"minecraft:clock"} run function rituals:ritual/patterns/nonagon/detect_time_warp
# execute if data storage rituals:temp {central_item:"minecraft:clock"} run return 0

# === SOUL EMBODIMENT (any item not claimed by a specific ritual above) ===
function rituals:ritual/patterns/star/detect_soul_embodiment


