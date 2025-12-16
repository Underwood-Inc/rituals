# ========================================
# Apply Buff to Soul Weapon (With Level Tracking)
# ========================================
# Adds or UPGRADES a buff in the item's custom_data
# Respects max levels and incompatibilities

# Initialize storage structures if not present
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buffs run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buffs set value []
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels set value {}

# Reset block flag
scoreboard players set #buff_blocked rituals.temp 0

# === CHECK INCOMPATIBILITIES ===
# If buff is incompatible with existing debuff, skip it

# Swift incompatible with Heavy debuff
execute if data storage rituals:temp new_buff{id:"swift"} if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"heavy"}] run scoreboard players set #buff_blocked rituals.temp 1
execute if data storage rituals:temp new_buff{id:"swift"} if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"heavy"}] run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Swift blocked by Heavy debuff!","color":"gray"}]

# Lucky incompatible with Unlucky debuff  
execute if data storage rituals:temp new_buff{id:"lucky"} if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"unlucky"}] run scoreboard players set #buff_blocked rituals.temp 1
execute if data storage rituals:temp new_buff{id:"lucky"} if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"unlucky"}] run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Lucky blocked by Unlucky debuff!","color":"gray"}]

# Repair incompatible with Fragile debuff
execute if data storage rituals:temp new_buff{id:"repair"} if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"fragile"}] run scoreboard players set #buff_blocked rituals.temp 1
execute if data storage rituals:temp new_buff{id:"repair"} if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"fragile"}] run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Repair blocked by Fragile debuff!","color":"gray"}]

# Unbreaking incompatible with Fragile debuff
execute if data storage rituals:temp new_buff{id:"unbreaking"} if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"fragile"}] run scoreboard players set #buff_blocked rituals.temp 1
execute if data storage rituals:temp new_buff{id:"unbreaking"} if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"fragile"}] run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Unbreaking blocked by Fragile debuff!","color":"gray"}]

# Saturation incompatible with Hungry debuff
execute if data storage rituals:temp new_buff{id:"saturation"} if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"hungry"}] run scoreboard players set #buff_blocked rituals.temp 1
execute if data storage rituals:temp new_buff{id:"saturation"} if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"hungry"}] run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Saturation blocked by Hungry debuff!","color":"gray"}]

# Reserved incompatible with Chatty debuff
execute if data storage rituals:temp new_buff{id:"reserved"} if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"chatty"}] run scoreboard players set #buff_blocked rituals.temp 1
execute if data storage rituals:temp new_buff{id:"reserved"} if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"chatty"}] run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Reserved blocked by Chatty debuff!","color":"gray"}]

# Fireresist incompatible with Waterbreath and Soulfire (elemental conflict)
execute if data storage rituals:temp new_buff{id:"fireresist"} if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"waterbreath"}] run scoreboard players set #buff_blocked rituals.temp 1
execute if data storage rituals:temp new_buff{id:"fireresist"} if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"soulfire"}] run scoreboard players set #buff_blocked rituals.temp 1
execute if data storage rituals:temp new_buff{id:"waterbreath"} if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"fireresist"}] run scoreboard players set #buff_blocked rituals.temp 1
execute if data storage rituals:temp new_buff{id:"soulfire"} if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"fireresist"}] run scoreboard players set #buff_blocked rituals.temp 1

# === APPLY OR SKIP BASED ON BLOCK STATUS ===
# If blocked, just clean up and exit
execute if score #buff_blocked rituals.temp matches 1 run data remove storage rituals:temp new_buff
execute if score #buff_blocked rituals.temp matches 1 run return 0

# Not blocked - apply or upgrade the buff
function rituals:soul/buffs/check_stack_buff

# Clean up
data remove storage rituals:temp new_buff

