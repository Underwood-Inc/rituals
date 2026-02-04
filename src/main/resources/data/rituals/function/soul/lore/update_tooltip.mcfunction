# Update Soul Weapon Tooltip (Datapack-only method)
# Called when a soul weapon needs its lore refreshed
# For full real-time updates, use the Fabric mod version

# This function is called by check_level_up and ascension functions
# It marks the item for tooltip refresh

# Set pending lore update flag
# The mod will handle this automatically if present
# For datapack-only users, they need to rename the item in an anvil

execute if entity @s[type=player] run tellraw @s ["",{"text":"✦ ","color":"dark_purple"},{"text":"Your soul weapon's essence has shifted!","color":"gray"}]

# If using mod, it will auto-refresh
# If datapack-only, inform player about anvil refresh
execute unless entity @s[type=player,nbt={SelectedItem:{components:{"minecraft:custom_data":{rituals_mod_present:true}}}}] run tellraw @s ["",{"text":"  → ","color":"gray"},{"text":"Rename in an anvil to refresh tooltip","color":"yellow","italic":true}]

