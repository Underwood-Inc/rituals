# ========================================
# Load Ritual Registry - Sets default ritual items
# ========================================
# This registry stores all configurable ritual items
# Can be modified via commands, GUI, or direct storage access

# Initialize storage with empty arrays
execute unless data storage rituals:registry run data modify storage rituals:registry set value {single_rituals:[],pattern_rituals:[]}
execute if data storage rituals:registry run data modify storage rituals:registry single_rituals set value []
execute if data storage rituals:registry run data modify storage rituals:registry pattern_rituals set value []

# ==================== SINGLE-TOTEM RITUALS ====================
# Growth Ritual
data modify storage rituals:registry single_rituals append value {id:"growth",item:"minecraft:emerald",enabled:1b,display_name:"Growth Ritual"}

# Strength Ritual
data modify storage rituals:registry single_rituals append value {id:"strength",item:"minecraft:diamond",enabled:1b,display_name:"Strength Ritual"}

# Prosperity Ritual
data modify storage rituals:registry single_rituals append value {id:"prosperity",item:"minecraft:netherite_block",enabled:1b,display_name:"Prosperity Ritual"}

# Protection Ritual
data modify storage rituals:registry single_rituals append value {id:"protection",item:"minecraft:iron_ingot",enabled:1b,display_name:"Protection Ritual"}

# Healing Ritual
data modify storage rituals:registry single_rituals append value {id:"healing",item:"minecraft:nether_star",enabled:1b,display_name:"Healing Ritual"}

# Sentry Ritual
data modify storage rituals:registry single_rituals append value {id:"sentry",item:"minecraft:arrow",enabled:1b,display_name:"Sentry Ritual"}

# ==================== PATTERN RITUALS ====================
# Auto-Farming (Square Pattern)
data modify storage rituals:registry pattern_rituals append value {id:"auto_farming",central_item:"minecraft:diamond_hoe",pattern_type:"square",enabled:1b,display_name:"Auto-Farming Ritual",supplementary_items:{ne:"minecraft:wheat",se:"minecraft:carrot",sw:"minecraft:potato",nw:"minecraft:beetroot"}}

# Auto-Breeding (Star Pattern)
data modify storage rituals:registry pattern_rituals append value {id:"auto_breeding",central_item:"minecraft:wheat",pattern_type:"star",enabled:1b,display_name:"Auto-Breeding Ritual",supplementary_items:{north:"minecraft:wheat_seeds",east:"minecraft:carrot",south:"minecraft:potato",west:"minecraft:beetroot_seeds"}}

# ==================== FIRE SACRIFICE CATALYSTS ====================
# Tier 1 (Wood) - Coal
data modify storage rituals:registry catalysts.tier1 set value {item:"minecraft:coal",quantity:4}

# Tier 2 (Copper) - Copper Ingot
data modify storage rituals:registry catalysts.tier2 set value {item:"minecraft:copper_ingot",quantity:4}

# Tier 3 (Iron) - Iron Ingot
data modify storage rituals:registry catalysts.tier3 set value {item:"minecraft:iron_ingot",quantity:4}

# Tier 4 (Gold) - Gold Ingot
data modify storage rituals:registry catalysts.tier4 set value {item:"minecraft:gold_ingot",quantity:4}

# Tier 5 (Diamond) - Diamond
data modify storage rituals:registry catalysts.tier5 set value {item:"minecraft:diamond",quantity:4}

# Tier 6 (Netherite) - Netherite Ingot
data modify storage rituals:registry catalysts.tier6 set value {item:"minecraft:netherite_ingot",quantity:4}

# Registry loaded - ready to use!

