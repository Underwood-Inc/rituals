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

# Fire detected! Now check for offerings around the totem
function rituals:ritual/fire/detect_offerings


