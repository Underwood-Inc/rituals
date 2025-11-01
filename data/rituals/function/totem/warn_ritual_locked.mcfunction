# ========================================
# Warn player that ritual item is locked
# ========================================
# Runs as and at the totem with active ritual
# Active rituals cannot have their items changed - only breaking the totem can stop it

tellraw @p[distance=..5] [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"⚠ Active ritual in progress! ","color":"red","bold":false},{"text":"The displayed item is locked. Break the totem to stop the ritual.","color":"yellow"}]
playsound entity.villager.no block @p[distance=..5] ~ ~ ~ 0.8 1.0
particle barrier ~ ~2.2 ~ 0.3 0.3 0.3 0 5

