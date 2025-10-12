# ========================================
# Reload Config from storage
# ========================================

function rituals:config/load

# Apply fire sacrifice mode flag
execute store result score #fire_sacrifice_mode rituals.data if data storage rituals:config {require_fire_sacrifice:true}

tellraw @s [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"Config reloaded!","color":"green"}]

