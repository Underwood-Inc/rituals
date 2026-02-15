# ========================================
# Warn player that ritual item is locked
# ========================================
# Runs as and at the totem with active ritual
# Player UUID in rituals:temp interacting_uuid (macro)

$tellraw @a[nbt={UUID:$(interacting_uuid)}] [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"⚠ Active ritual in progress! ","color":"red","bold":false},{"text":"The displayed item is locked. Break the totem to stop the ritual.","color":"yellow"}]
$playsound entity.villager.no block @a[nbt={UUID:$(interacting_uuid)}] ~ ~ ~ 0.8 1.0
particle block{block_state:{Name:"minecraft:barrier"}} ~ ~2.2 ~ 0.3 0.3 0.3 0 5
