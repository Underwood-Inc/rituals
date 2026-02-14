# Update Soul Item Tooltip
# Called when a soul-embodied item's essence shifts (level-up, ascension, etc.)
#
# DATAPACK: Lore is rebuilt on every totem sync and scrying glass use via
#           lore/apply_full, which calculates a proportional XP bar.
#           No manual anvil refresh needed — next sync picks it up.
# MOD:     The mod auto-refreshes in real-time via SoulEmbodimentManager.
#
# This function just notifies the player that something changed.

execute if entity @s[type=player] run tellraw @s ["",{"text":"✦ ","color":"dark_purple"},{"text":"Your soul item's essence has shifted!","color":"gray"}]

# Datapack-only: remind to sync via totem or scrying glass to see updated lore
execute unless entity @s[type=player,nbt={SelectedItem:{components:{"minecraft:custom_data":{rituals_mod_present:true}}}}] run tellraw @s ["",{"text":"  → ","color":"gray"},{"text":"Sync at a totem or use a Scrying Glass to refresh tooltip","color":"yellow","italic":true}]

