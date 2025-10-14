# ========================================
# Check if a ritual can be activated
# ========================================
# Runs as and at totems that have items displayed

# Only check every 20 ticks to save performance
scoreboard players add @s rituals.timer 1
execute unless score @s rituals.timer matches 20.. run return 0
scoreboard players reset @s rituals.timer

# Skip if already performing a ritual
execute if entity @s[tag=rituals.active_ritual] run return 0

# Skip if this is a pattern totem (part of another ritual)
execute if entity @s[tag=rituals.pattern_totem] run return 0

# Count nearby totems with items within range (including self = +1)
scoreboard players set #totem_count rituals.temp 1
execute store result score #nearby_totems rituals.temp if entity @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=0.1..32]
scoreboard players operation #totem_count rituals.temp += #nearby_totems rituals.temp

# Check if we have enough totems (configurable, default 1)
execute if score #totem_count rituals.temp < #min_totems rituals.data run return 0

# Detect ritual type based on displayed items
function rituals:ritual/detect_type

