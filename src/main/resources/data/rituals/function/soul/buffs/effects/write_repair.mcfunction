# Macro function: writes repaired damage value to the correct inventory slot.
# Called with {repair_slot: <0-8>} from try_repair.mcfunction.
# SelectedItem is read-only in 1.20.5+, so we target Inventory directly.
$execute store result entity @s Inventory[{Slot:$(repair_slot)b}].components."minecraft:damage" int 1 run scoreboard players get #current_damage rituals.soul_temp
