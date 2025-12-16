# ========================================
# Roll Random Buff on Level Up (BALANCED)
# ========================================
# Called when a soul weapon levels up
# Rolls for a random buff (and possibly debuff)

# Roll for buff (always get one) - 20 possible buffs
scoreboard players set #roll rituals.soul_temp 0
execute store result score #roll rituals.soul_temp run random value 1..20

# Select buff based on roll (balanced distribution)
execute if score #roll rituals.soul_temp matches 1 run data modify storage rituals:temp new_buff set value {id:"haste",level:1}
execute if score #roll rituals.soul_temp matches 2 run data modify storage rituals:temp new_buff set value {id:"glow",level:1}
execute if score #roll rituals.soul_temp matches 3 run data modify storage rituals:temp new_buff set value {id:"magnetic",level:1}
execute if score #roll rituals.soul_temp matches 4 run data modify storage rituals:temp new_buff set value {id:"reach",level:1}
execute if score #roll rituals.soul_temp matches 5 run data modify storage rituals:temp new_buff set value {id:"repair",level:1}
execute if score #roll rituals.soul_temp matches 6 run data modify storage rituals:temp new_buff set value {id:"lucky",level:1}
execute if score #roll rituals.soul_temp matches 7 run data modify storage rituals:temp new_buff set value {id:"swift",level:1}
execute if score #roll rituals.soul_temp matches 8 run data modify storage rituals:temp new_buff set value {id:"strong",level:1}
execute if score #roll rituals.soul_temp matches 9 run data modify storage rituals:temp new_buff set value {id:"tough",level:1}
execute if score #roll rituals.soul_temp matches 10 run data modify storage rituals:temp new_buff set value {id:"nimble",level:1}
execute if score #roll rituals.soul_temp matches 11 run data modify storage rituals:temp new_buff set value {id:"soulfire",level:1}
execute if score #roll rituals.soul_temp matches 12 run data modify storage rituals:temp new_buff set value {id:"lifesteal",level:1}
execute if score #roll rituals.soul_temp matches 13 run data modify storage rituals:temp new_buff set value {id:"xpboost",level:1}
execute if score #roll rituals.soul_temp matches 14 run data modify storage rituals:temp new_buff set value {id:"looting",level:1}
execute if score #roll rituals.soul_temp matches 15 run data modify storage rituals:temp new_buff set value {id:"unbreaking",level:1}
execute if score #roll rituals.soul_temp matches 16 run data modify storage rituals:temp new_buff set value {id:"nightvision",level:1}
execute if score #roll rituals.soul_temp matches 17 run data modify storage rituals:temp new_buff set value {id:"waterbreath",level:1}
execute if score #roll rituals.soul_temp matches 18 run data modify storage rituals:temp new_buff set value {id:"fireresist",level:1}
execute if score #roll rituals.soul_temp matches 19 run data modify storage rituals:temp new_buff set value {id:"saturation",level:1}
execute if score #roll rituals.soul_temp matches 20 run data modify storage rituals:temp new_buff set value {id:"reserved",level:1}

# Apply the buff to item storage (handles stacking and incompatibilities)
function rituals:soul/buffs/apply_buff

# Roll for debuff (30% chance)
execute store result score #debuff_roll rituals.soul_temp run random value 1..100
execute if score #debuff_roll rituals.soul_temp matches 1..30 run function rituals:soul/buffs/roll_debuff

# Roll for FRACTURED (10% chance) - catastrophic permanent debuff
# Only if not already fractured
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_fractured run function rituals:soul/buffs/roll_fracture

# Announce the buff (handled in apply_buff now with level info)

