# ========================================
# Eternal Edge - Reduce Durability Loss
# ========================================
# Chance-based durability restoration.
# Level 1: 1/300, Level 2: 1/150, Level 3: 1/100
# Expects: #unbreaking_lvl rituals.soul_temp (1-3)

scoreboard players set #ub_range rituals.soul_temp 300
execute if score #unbreaking_lvl rituals.soul_temp matches 2 run scoreboard players set #ub_range rituals.soul_temp 150
execute if score #unbreaking_lvl rituals.soul_temp matches 3.. run scoreboard players set #ub_range rituals.soul_temp 100

execute store result score #ub_roll rituals.soul_temp run random value 1..300
execute if score #ub_roll rituals.soul_temp > #ub_range rituals.soul_temp run return 0

execute store result score #ub_damage rituals.soul_temp run data get entity @s SelectedItem.components."minecraft:damage"
execute if score #ub_damage rituals.soul_temp matches ..0 run return 0

scoreboard players remove #ub_damage rituals.soul_temp 1

# Write back via item modify (SelectedItem is read-only in 1.20.5+)
execute store result storage rituals:temp new_damage int 1 run scoreboard players get #ub_damage rituals.soul_temp
function rituals:soul/buffs/effects/write_damage with storage rituals:temp
