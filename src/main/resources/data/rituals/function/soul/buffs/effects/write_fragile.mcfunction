# Macro function: writes fragile extra damage to the correct inventory slot.
$execute store result entity @s Inventory[{Slot:$(repair_slot)b}].components."minecraft:damage" int 1 run scoreboard players get #frag_current rituals.soul_temp
