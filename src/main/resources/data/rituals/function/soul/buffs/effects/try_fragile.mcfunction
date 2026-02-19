# ========================================
# Brittle Edge - Extra Durability Loss on USE
# ========================================
# Triggers when the item takes damage from normal use.
# Tracks previous damage; if damage increased, rolls extra loss.
# Level 1: 50% chance +1, Level 2: guaranteed +1
# Expects: #fragile_lvl rituals.soul_temp (1-2)

execute unless score @s rituals.prev_damage matches 0.. run scoreboard players set @s rituals.prev_damage -1

execute store result score #frag_current rituals.soul_temp run data get entity @s SelectedItem.components."minecraft:damage"

# If damage hasn't increased since last check, item wasn't used
execute unless score #frag_current rituals.soul_temp > @s rituals.prev_damage run scoreboard players operation @s rituals.prev_damage = #frag_current rituals.soul_temp
execute unless score #frag_current rituals.soul_temp > @s rituals.prev_damage run return 0

# Level 1: 50% chance to skip
execute if score #fragile_lvl rituals.soul_temp matches 1 store result score #frag_roll rituals.soul_temp run random value 1..2
execute if score #fragile_lvl rituals.soul_temp matches 1 if score #frag_roll rituals.soul_temp matches 2 run scoreboard players operation @s rituals.prev_damage = #frag_current rituals.soul_temp
execute if score #fragile_lvl rituals.soul_temp matches 1 if score #frag_roll rituals.soul_temp matches 2 run return 0

# Don't exceed max damage - 1
execute store result score #frag_max rituals.soul_temp run data get entity @s SelectedItem.components."minecraft:max_damage"
scoreboard players add #frag_current rituals.soul_temp 1
scoreboard players operation #frag_cap rituals.soul_temp = #frag_max rituals.soul_temp
scoreboard players remove #frag_cap rituals.soul_temp 1
execute if score #frag_current rituals.soul_temp > #frag_cap rituals.soul_temp run scoreboard players operation #frag_current rituals.soul_temp = #frag_cap rituals.soul_temp

# Write back via item modify (SelectedItem is read-only in 1.20.5+)
execute store result storage rituals:temp new_damage int 1 run scoreboard players get #frag_current rituals.soul_temp
function rituals:soul/buffs/effects/write_damage with storage rituals:temp

scoreboard players operation @s rituals.prev_damage = #frag_current rituals.soul_temp
