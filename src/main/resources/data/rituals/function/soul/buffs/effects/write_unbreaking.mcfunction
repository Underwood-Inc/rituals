# Macro function: writes restored durability to the correct inventory slot.
$execute store result entity @s Inventory[{Slot:$(repair_slot)b}].components."minecraft:damage" int 1 run scoreboard players get #ub_damage rituals.soul_temp
