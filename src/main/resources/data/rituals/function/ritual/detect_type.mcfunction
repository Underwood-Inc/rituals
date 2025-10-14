# ========================================
# Detect what type of ritual is being performed
# ========================================
# Runs as and at a totem checking for rituals

# Store displayed item for checking
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify storage rituals:temp check_item set from entity @s item.id

# Check for different ritual types based on item combinations

# === GROWTH RITUAL === (Emeralds)
# Effect: Bonemeal effect on crops/plants
execute if data storage rituals:temp {check_item:"minecraft:emerald"} run function rituals:ritual/types/check_growth

# === STRENGTH RITUAL === (Diamonds)
# Effect: Strength and resistance to nearby players
execute if data storage rituals:temp {check_item:"minecraft:diamond"} run function rituals:ritual/types/check_strength

# === PROSPERITY RITUAL === (Netherite Blocks)
# Effect: Attract nearby items and occasionally spawn experience orbs
execute if data storage rituals:temp {check_item:"minecraft:netherite_block"} run function rituals:ritual/types/check_prosperity

# === PROTECTION RITUAL === (Iron Ingots)
# Effect: Damage nearby hostile mobs
execute if data storage rituals:temp {check_item:"minecraft:iron_ingot"} run function rituals:ritual/types/check_protection

# === HEALING RITUAL === (Nether Stars)
# Effect: Heal nearby players and animals
execute if data storage rituals:temp {check_item:"minecraft:nether_star"} run function rituals:ritual/types/check_healing

# === SENTRY RITUAL === (Arrows)
# Effect: Creates a magical projectile-firing sentry totem
execute if data storage rituals:temp {check_item:"minecraft:arrow"} run function rituals:ritual/types/check_sentry

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

