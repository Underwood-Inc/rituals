# ========================================
# Detect Ritual Type from Central Totem Item
# ========================================
# Runs when checking for pattern-based rituals
# Determines which pattern to check based on central totem's displayed item

# Get the item displayed on this totem
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify storage rituals:temp central_item set from entity @s item.id

# PATTERN-BASED AREA EFFECT RITUALS

# Auto-Farming - Square pattern (4 corners)
execute if data storage rituals:temp {central_item:"minecraft:diamond_hoe"} run function rituals:ritual/patterns/square/detect_auto_farming

# Auto-Breeding - Star pattern (4 cardinals)
execute if data storage rituals:temp {central_item:"minecraft:wheat"} run function rituals:ritual/patterns/star/detect_auto_breeding

# XP Harvester - Pentagon pattern (5 around)
execute if data storage rituals:temp {central_item:"minecraft:experience_bottle"} run function rituals:ritual/patterns/pentagon/detect_xp_harvester

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


