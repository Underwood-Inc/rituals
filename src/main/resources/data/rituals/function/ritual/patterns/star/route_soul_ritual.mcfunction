# ========================================
# Route Soul Ritual - Awakening vs Ascension
# ========================================
# Determines whether to awaken a new soul or ascend an existing one
# Runs as the central totem

# Check if the item is ALREADY soul-embodied
scoreboard players operation #route_totem_id rituals.temp = @s rituals.id
execute store result score #is_already_soul rituals.temp run execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #route_totem_id rituals.temp if data entity @s item.components."minecraft:custom_data".soul_embodied

# If already soul-embodied → ascension/sync flow
execute if score #is_already_soul rituals.temp matches 1 run function rituals:ritual/patterns/star/detect_soul_ascension

# If NOT soul-embodied → initial awakening flow
execute if score #is_already_soul rituals.temp matches 0 run function rituals:ritual/patterns/star/detect_soul_embodiment


