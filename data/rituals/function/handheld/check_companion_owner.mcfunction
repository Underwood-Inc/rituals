# Check if this companion's owner still has a companion totem
# Runs as the companion

# Try to find owner with matching ID and companion totem
execute store result score #has_owner rituals.temp if entity @a[nbt={Inventory:[{Slot:-106b,components:{"minecraft:custom_data":{rituals_companion:1}}}]},scores={rituals.id=0..}] if score @s rituals.id = @a[nbt={Inventory:[{Slot:-106b,components:{"minecraft:custom_data":{rituals_companion:1}}}]},scores={rituals.id=0..},limit=1] rituals.id

# If no owner found, despawn with effects
execute if score #has_owner rituals.temp matches 0 run particle poof ~ ~0.5 ~ 0.3 0.3 0.3 0.05 15
execute if score #has_owner rituals.temp matches 0 run playsound entity.silverfish.death master @a ~ ~ ~ 1.0 1.5
execute if score #has_owner rituals.temp matches 0 run tp @s ~ ~-500 ~
execute if score #has_owner rituals.temp matches 0 run kill @s

