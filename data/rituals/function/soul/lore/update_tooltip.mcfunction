# Update Soul Item Tooltip
# Called when a soul-embodied item's essence shifts (level-up, ascension, etc.)
#
# Lore is rebuilt on totem sync and scrying glass use via lore/apply_full.
# This function notifies the player and reminds them to sync for an updated tooltip.

execute if entity @s[type=player] run tellraw @s ["",{"text":"✦ ","color":"dark_purple"},{"text":"Your soul item's essence has shifted!","color":"gray"}]
tellraw @s ["",{"text":"  → ","color":"gray"},{"text":"Sync at a totem or use a Scrying Glass to refresh tooltip","color":"yellow","italic":true}]

