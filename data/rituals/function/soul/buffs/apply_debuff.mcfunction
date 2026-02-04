# ========================================
# Apply Debuff to Soul Weapon (With Compatibility Checks)
# ========================================
# Adds or UPGRADES a debuff in the item's custom_data
# Respects max levels and incompatibilities

# Initialize storage structures if not present
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs run data modify storage rituals:temp item.components."minecraft:custom_data".soul_debuffs set value []
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels run data modify storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels set value {}

# === CHECK INCOMPATIBILITIES ===
# If debuff would cancel out a buff, skip it

# Heavy incompatible with Swift buff
execute if data storage rituals:temp new_debuff{id:"heavy"} if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"swift"}] run data modify storage rituals:temp debuff_blocked set value 1b
execute if data storage rituals:temp new_debuff{id:"heavy"} if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"swift"}] run tellraw @a[distance=..16] [{"text":"  ✓ ","color":"green"},{"text":"Heavy blocked by Swift buff!","color":"gray"}]

# Unlucky incompatible with Lucky buff
execute if data storage rituals:temp new_debuff{id:"unlucky"} if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"lucky"}] run data modify storage rituals:temp debuff_blocked set value 1b
execute if data storage rituals:temp new_debuff{id:"unlucky"} if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"lucky"}] run tellraw @a[distance=..16] [{"text":"  ✓ ","color":"green"},{"text":"Unlucky blocked by Lucky buff!","color":"gray"}]

# Fragile incompatible with Repair and Unbreaking buffs
execute if data storage rituals:temp new_debuff{id:"fragile"} if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"repair"}] run data modify storage rituals:temp debuff_blocked set value 1b
execute if data storage rituals:temp new_debuff{id:"fragile"} if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"unbreaking"}] run data modify storage rituals:temp debuff_blocked set value 1b
execute if data storage rituals:temp new_debuff{id:"fragile"} if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"repair"}] run tellraw @a[distance=..16] [{"text":"  ✓ ","color":"green"},{"text":"Fragile blocked by Soul Mending!","color":"gray"}]
execute if data storage rituals:temp new_debuff{id:"fragile"} if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"unbreaking"}] run tellraw @a[distance=..16] [{"text":"  ✓ ","color":"green"},{"text":"Fragile blocked by Eternal Edge!","color":"gray"}]

# Hungry incompatible with Saturation buff
execute if data storage rituals:temp new_debuff{id:"hungry"} if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"saturation"}] run data modify storage rituals:temp debuff_blocked set value 1b
execute if data storage rituals:temp new_debuff{id:"hungry"} if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"saturation"}] run tellraw @a[distance=..16] [{"text":"  ✓ ","color":"green"},{"text":"Hungry blocked by Saturation!","color":"gray"}]

# Chatty incompatible with Reserved buff
execute if data storage rituals:temp new_debuff{id:"chatty"} if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"reserved"}] run data modify storage rituals:temp debuff_blocked set value 1b
execute if data storage rituals:temp new_debuff{id:"chatty"} if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"reserved"}] run tellraw @a[distance=..16] [{"text":"  ✓ ","color":"green"},{"text":"Chatty blocked by Reserved!","color":"gray"}]

# If blocked, skip applying
execute if data storage rituals:temp debuff_blocked run data remove storage rituals:temp debuff_blocked
execute if data storage rituals:temp debuff_blocked run data remove storage rituals:temp new_debuff
execute if data storage rituals:temp debuff_blocked run return 0

# === APPLY OR UPGRADE DEBUFF ===
function rituals:soul/buffs/check_stack_debuff

# Clean up
data remove storage rituals:temp new_debuff
