# ========================================
# Spawn visual for Tier 1 (Wood) totem
# ========================================

# Prepare parameters for spawn helper
data modify storage rituals:temp block set value {Name:"minecraft:cobblestone_wall",Properties:{up:"true",north:"none",south:"none",east:"none",west:"none"}}
data modify storage rituals:temp scale set value 0.7
data modify storage rituals:temp height set value 2.0
data modify storage rituals:temp offset set value -0.35

# Spawn using helper
function rituals:totem/visuals/spawn_display with storage rituals:temp

