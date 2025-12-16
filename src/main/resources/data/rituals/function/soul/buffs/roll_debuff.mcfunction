# ========================================
# Roll Random Debuff
# ========================================
# 30% chance to apply a debuff on level up

execute store result score #debuff_roll rituals.soul_temp run random value 1..11

execute if score #debuff_roll rituals.soul_temp matches 1 run data modify storage rituals:temp new_debuff set value {id:"hungry",level:1}
execute if score #debuff_roll rituals.soul_temp matches 2 run data modify storage rituals:temp new_debuff set value {id:"heavy",level:1}
execute if score #debuff_roll rituals.soul_temp matches 3 run data modify storage rituals:temp new_debuff set value {id:"cursed",level:1}
execute if score #debuff_roll rituals.soul_temp matches 4 run data modify storage rituals:temp new_debuff set value {id:"fragile",level:1}
execute if score #debuff_roll rituals.soul_temp matches 5 run data modify storage rituals:temp new_debuff set value {id:"loud",level:1}
execute if score #debuff_roll rituals.soul_temp matches 6 run data modify storage rituals:temp new_debuff set value {id:"clumsy",level:1}
execute if score #debuff_roll rituals.soul_temp matches 7 run data modify storage rituals:temp new_debuff set value {id:"unlucky",level:1}
execute if score #debuff_roll rituals.soul_temp matches 8 run data modify storage rituals:temp new_debuff set value {id:"gluttony",level:1}
execute if score #debuff_roll rituals.soul_temp matches 9 run data modify storage rituals:temp new_debuff set value {id:"paranoid",level:1}
execute if score #debuff_roll rituals.soul_temp matches 10 run data modify storage rituals:temp new_debuff set value {id:"bloodthirst",level:1}
execute if score #debuff_roll rituals.soul_temp matches 11 run data modify storage rituals:temp new_debuff set value {id:"chatty",level:1}

# Apply debuff to item storage
function rituals:soul/buffs/apply_debuff

