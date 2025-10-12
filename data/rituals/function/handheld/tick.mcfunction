# Check all players with handheld totems in offhand
execute as @a[nbt={Inventory:[{Slot:-106b,components:{"minecraft:custom_data":{rituals_handheld:1}}}]}] at @s run function rituals:handheld/check_held

# Check all players with companion totems in offhand
execute as @a at @s run function rituals:handheld/check_companion

# Cleanup companions whose owners unequipped
function rituals:handheld/cleanup_companions

# Remove temporary tags
tag @a remove rituals.has_companion_totem

