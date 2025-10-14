# ========================================
# Detection Header (Unified Skip Logic)
# ========================================
# Common logic that runs at the start of all pattern detection functions
# Checks if ritual should skip detection and initializes validation scores
# No macros needed - this is 100% identical across all patterns

# Skip detection if this ritual is already active
execute if entity @s[tag=rituals.active_ritual] run return 0

# Skip detection if the central item already has ritual_active tag
scoreboard players operation #check_id rituals.temp = @s rituals.id
execute store result score #has_ritual_tag rituals.temp run execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #check_id rituals.temp if data entity @s item.components."minecraft:custom_data".ritual_active
execute if score #has_ritual_tag rituals.temp matches 1.. run return 0

# Reset pattern validation scores
scoreboard players set #pattern_valid rituals.temp 0
scoreboard players set #totems_found rituals.temp 0

