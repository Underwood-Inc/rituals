# Check all players with handheld totems in offhand
execute as @a[nbt={Inventory:[{Slot:-106b,components:{"minecraft:custom_data":{rituals_handheld:1}}}]}] at @s run function rituals:handheld/check_held

