# ========================================
# Initialize Registry - Manual trigger
# ========================================
# Run this function manually if registry doesn't exist
# Or use: /function rituals:config/registry/load

function rituals:config/registry/load
tellraw @s [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Registry initialized!","color":"green"}]

