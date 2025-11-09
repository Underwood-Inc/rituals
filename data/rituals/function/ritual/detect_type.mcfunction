# ========================================
# Detect what type of ritual is being performed
# ========================================
# Runs as and at a totem checking for rituals

# Store displayed item for checking
scoreboard players operation #detect_totem_id rituals.temp = @s rituals.id
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #detect_totem_id rituals.temp run data modify storage rituals:temp check_item set from entity @s item.id

# Check for different ritual types based on registry (configurable via mod menu!)

# Check each registry entry to see if it matches check_item
# Growth
data modify storage rituals:temp test_item set from storage rituals:registry single_rituals[{id:"growth"}].item
execute store success score #match rituals.temp run data modify storage rituals:temp test_item set from storage rituals:temp check_item
execute if score #match rituals.temp matches 0 run function rituals:ritual/types/check_growth

# Strength  
data modify storage rituals:temp test_item set from storage rituals:registry single_rituals[{id:"strength"}].item
execute store success score #match rituals.temp run data modify storage rituals:temp test_item set from storage rituals:temp check_item
execute if score #match rituals.temp matches 0 run function rituals:ritual/types/check_strength

# Prosperity
data modify storage rituals:temp test_item set from storage rituals:registry single_rituals[{id:"prosperity"}].item
execute store success score #match rituals.temp run data modify storage rituals:temp test_item set from storage rituals:temp check_item
execute if score #match rituals.temp matches 0 run function rituals:ritual/types/check_prosperity

# Protection
data modify storage rituals:temp test_item set from storage rituals:registry single_rituals[{id:"protection"}].item
execute store success score #match rituals.temp run data modify storage rituals:temp test_item set from storage rituals:temp check_item
execute if score #match rituals.temp matches 0 run function rituals:ritual/types/check_protection

# Healing
data modify storage rituals:temp test_item set from storage rituals:registry single_rituals[{id:"healing"}].item
execute store success score #match rituals.temp run data modify storage rituals:temp test_item set from storage rituals:temp check_item
execute if score #match rituals.temp matches 0 run function rituals:ritual/types/check_healing

# Sentry
data modify storage rituals:temp test_item set from storage rituals:registry single_rituals[{id:"sentry"}].item
execute store success score #match rituals.temp run data modify storage rituals:temp test_item set from storage rituals:temp check_item
execute if score #match rituals.temp matches 0 run function rituals:ritual/types/check_sentry

# === AUTO-FARMING RITUAL === (Diamond Hoe) - NOW A PATTERN RITUAL
# Handled by pattern detection system in detect_central_ritual.mcfunction
# execute if data storage rituals:temp {check_item:"minecraft:diamond_hoe"} run function rituals:ritual/types/check_farming

# ========================================
# PATTERN-BASED RITUALS
# ========================================
# These rituals require specific multi-totem patterns with specific items at each position
# Check if this totem has an item that triggers a pattern ritual

# Pattern rituals (check for valid patterns and activate if complete)
function rituals:ritual/patterns/detect_central_ritual

# Clear temp storage
data remove storage rituals:temp check_item

