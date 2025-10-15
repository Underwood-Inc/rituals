# ========================================
# Check for Fire Sacrifice Ritual
# ========================================
# Runs as and at totems that have items displayed
# Checks if player has placed offerings and lit fire to activate ritual

# Skip if already performing a ritual
execute if entity @s[tag=rituals.active_ritual] run return 0

# Check if there's fire at the totem base (check multiple positions)
scoreboard players set #has_fire rituals.temp 0

# Check at totem position
execute if block ~ ~ ~ minecraft:fire run scoreboard players set #has_fire rituals.temp 1
execute if block ~ ~ ~ minecraft:soul_fire run scoreboard players set #has_fire rituals.temp 1

# Check one block below
execute if block ~ ~-1 ~ minecraft:fire run scoreboard players set #has_fire rituals.temp 1
execute if block ~ ~-1 ~ minecraft:soul_fire run scoreboard players set #has_fire rituals.temp 1

# Check adjacent blocks at base level
execute if block ~1 ~ ~ minecraft:fire run scoreboard players set #has_fire rituals.temp 1
execute if block ~1 ~ ~ minecraft:soul_fire run scoreboard players set #has_fire rituals.temp 1
execute if block ~-1 ~ ~ minecraft:fire run scoreboard players set #has_fire rituals.temp 1
execute if block ~-1 ~ ~ minecraft:soul_fire run scoreboard players set #has_fire rituals.temp 1
execute if block ~ ~ ~1 minecraft:fire run scoreboard players set #has_fire rituals.temp 1
execute if block ~ ~ ~1 minecraft:soul_fire run scoreboard players set #has_fire rituals.temp 1
execute if block ~ ~ ~-1 minecraft:fire run scoreboard players set #has_fire rituals.temp 1
execute if block ~ ~ ~-1 minecraft:soul_fire run scoreboard players set #has_fire rituals.temp 1

# If no fire detected, don't continue
execute if score #has_fire rituals.temp matches 0 run return 0

# Fire detected! Get the item displayed on this totem
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify storage rituals:temp sacrifice_item set from entity @s item.id

# Route to appropriate offering detection based on pattern type
# SQUARE PATTERN (diagonal corners): Diamond Hoe
execute if data storage rituals:temp {sacrifice_item:"minecraft:diamond_hoe"} run return run function rituals:ritual/fire/detect_offerings_square

# Default: CARDINAL POSITIONS (standard rituals)
function rituals:ritual/fire/detect_offerings


