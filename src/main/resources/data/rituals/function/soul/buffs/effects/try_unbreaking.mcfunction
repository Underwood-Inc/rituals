# ========================================
# Eternal Edge - Reduce Durability Loss
# ========================================
# Periodically undoes durability damage on the held item.
# Runs every tick; chance-based to approximate vanilla unbreaking.
#
# Vanilla unbreaking ignores damage (100/(level+1))% of the time.
# We approximate: 1/(300/level) chance per tick to restore 1 damage.
# Level 1: 1/300 per tick, Level 2: 1/150, Level 3: 1/100
# Expects: #unbreaking_lvl rituals.soul_temp (1-3)

scoreboard players set #ub_range rituals.soul_temp 300
execute if score #unbreaking_lvl rituals.soul_temp matches 2 run scoreboard players set #ub_range rituals.soul_temp 150
execute if score #unbreaking_lvl rituals.soul_temp matches 3.. run scoreboard players set #ub_range rituals.soul_temp 100

execute store result score #ub_roll rituals.soul_temp run random value 1..300
execute if score #ub_roll rituals.soul_temp > #ub_range rituals.soul_temp run return 0

# Get current damage
execute store result score #ub_damage rituals.soul_temp run data get entity @s SelectedItem.components."minecraft:damage"
execute if score #ub_damage rituals.soul_temp matches ..0 run return 0

# Restore 1 durability
scoreboard players remove #ub_damage rituals.soul_temp 1
execute store result entity @s SelectedItem.components."minecraft:damage" int 1 run scoreboard players get #ub_damage rituals.soul_temp
