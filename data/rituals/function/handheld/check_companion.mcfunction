# Check if player has a companion totem equipped
execute as @a[nbt={Inventory:[{Slot:-106b,components:{"minecraft:custom_data":{rituals_companion:1}}}]}] at @s run function rituals:handheld/companion_tick

