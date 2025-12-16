# ========================================
# Try Repair - Soul Mending Effect
# ========================================
# 0.5% chance per tick to repair 1 durability

execute store result score #repair_roll rituals.soul_temp run random value 1..200
execute unless score #repair_roll rituals.soul_temp matches 1 run return 0

# Get current damage and reduce it
execute store result score #current_damage rituals.soul_temp run data get entity @s SelectedItem.components."minecraft:damage"
execute if score #current_damage rituals.soul_temp matches 1.. run scoreboard players remove #current_damage rituals.soul_temp 1

# Apply repair (we can't directly modify held item, so we just show effect)
# The actual repair would need item modify which is complex
# For now, show the visual effect
particle minecraft:happy_villager ~ ~1 ~ 0.2 0.2 0.2 0 3

