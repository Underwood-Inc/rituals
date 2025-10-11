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

# === PROSPERITY RITUAL === (Gold Ingots)
# Effect: Attract nearby items and occasionally spawn experience orbs
execute if data storage rituals:temp {check_item:"minecraft:gold_ingot"} run function rituals:ritual/types/check_prosperity

# === PROTECTION RITUAL === (Iron Ingots)
# Effect: Damage nearby hostile mobs
execute if data storage rituals:temp {check_item:"minecraft:iron_ingot"} run function rituals:ritual/types/check_protection

# === HEALING RITUAL === (Nether Stars)
# Effect: Heal nearby players and animals
execute if data storage rituals:temp {check_item:"minecraft:nether_star"} run function rituals:ritual/types/check_healing

# === SENTRY RITUAL === (Arrows)
# Effect: Creates a magical projectile-firing sentry totem
execute if data storage rituals:temp {check_item:"minecraft:arrow"} run function rituals:ritual/types/check_sentry

# Clear temp storage
data remove storage rituals:temp check_item

