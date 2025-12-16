# ========================================
# Check and Stack Buff (With Max Level Enforcement)
# ========================================
# If buff exists, increment level (respecting max). Otherwise add new.

# === STACKABLE BUFFS WITH MAX LEVELS ===

# Haste (max 3)
execute if data storage rituals:temp new_buff{id:"haste"} run function rituals:soul/buffs/stack/haste_check

# Reach (max 3)
execute if data storage rituals:temp new_buff{id:"reach"} run function rituals:soul/buffs/stack/reach_check

# Repair (max 3)
execute if data storage rituals:temp new_buff{id:"repair"} run function rituals:soul/buffs/stack/repair_check

# Lucky (max 2)
execute if data storage rituals:temp new_buff{id:"lucky"} run function rituals:soul/buffs/stack/lucky_check

# Swift (max 3)
execute if data storage rituals:temp new_buff{id:"swift"} run function rituals:soul/buffs/stack/swift_check

# Strong (max 4)
execute if data storage rituals:temp new_buff{id:"strong"} run function rituals:soul/buffs/stack/strong_check

# Tough (max 3)
execute if data storage rituals:temp new_buff{id:"tough"} run function rituals:soul/buffs/stack/tough_check

# Magnetic (max 2)
execute if data storage rituals:temp new_buff{id:"magnetic"} run function rituals:soul/buffs/stack/magnetic_check

# Soulfire (max 2)
execute if data storage rituals:temp new_buff{id:"soulfire"} run function rituals:soul/buffs/stack/soulfire_check

# Lifesteal (max 2)
execute if data storage rituals:temp new_buff{id:"lifesteal"} run function rituals:soul/buffs/stack/lifesteal_check

# XP Boost (max 2)
execute if data storage rituals:temp new_buff{id:"xpboost"} run function rituals:soul/buffs/stack/xpboost_check

# Looting (max 2)
execute if data storage rituals:temp new_buff{id:"looting"} run function rituals:soul/buffs/stack/looting_check

# Unbreaking (max 2)
execute if data storage rituals:temp new_buff{id:"unbreaking"} run function rituals:soul/buffs/stack/unbreaking_check

# Saturation (max 2)
execute if data storage rituals:temp new_buff{id:"saturation"} run function rituals:soul/buffs/stack/saturation_check

# === NON-STACKABLE BUFFS (max 1) ===
execute if data storage rituals:temp new_buff{id:"glow"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"glow"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buffs append from storage rituals:temp new_buff
execute if data storage rituals:temp new_buff{id:"glow"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"glow"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.glow set value 1

execute if data storage rituals:temp new_buff{id:"nimble"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"nimble"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buffs append from storage rituals:temp new_buff
execute if data storage rituals:temp new_buff{id:"nimble"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"nimble"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.nimble set value 1

execute if data storage rituals:temp new_buff{id:"nightvision"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"nightvision"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buffs append from storage rituals:temp new_buff
execute if data storage rituals:temp new_buff{id:"nightvision"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"nightvision"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.nightvision set value 1

execute if data storage rituals:temp new_buff{id:"waterbreath"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"waterbreath"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buffs append from storage rituals:temp new_buff
execute if data storage rituals:temp new_buff{id:"waterbreath"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"waterbreath"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.waterbreath set value 1

execute if data storage rituals:temp new_buff{id:"fireresist"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"fireresist"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buffs append from storage rituals:temp new_buff
execute if data storage rituals:temp new_buff{id:"fireresist"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"fireresist"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.fireresist set value 1

execute if data storage rituals:temp new_buff{id:"reserved"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"reserved"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buffs append from storage rituals:temp new_buff
execute if data storage rituals:temp new_buff{id:"reserved"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"reserved"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_buff_levels.reserved set value 1

# If already at max, tell the player
execute if data storage rituals:temp new_buff{id:"glow"} if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"glow"}] run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Soul Sight already at max!","color":"gray"}]
execute if data storage rituals:temp new_buff{id:"nimble"} if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"nimble"}] run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Featherweight already at max!","color":"gray"}]
execute if data storage rituals:temp new_buff{id:"nightvision"} if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"nightvision"}] run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Dark Vision already at max!","color":"gray"}]
execute if data storage rituals:temp new_buff{id:"waterbreath"} if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"waterbreath"}] run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Aquatic Soul already at max!","color":"gray"}]
execute if data storage rituals:temp new_buff{id:"fireresist"} if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"fireresist"}] run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Flame Ward already at max!","color":"gray"}]
execute if data storage rituals:temp new_buff{id:"reserved"} if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"reserved"}] run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Reserved Soul already at max!","color":"gray"}]

