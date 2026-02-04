# ========================================
# Check and Stack Debuff (With Max Level Enforcement)
# ========================================
# If debuff exists, increment level (respecting max). Otherwise add new.

# === STACKABLE DEBUFFS ===

# Hungry (max 2)
execute if data storage rituals:temp new_debuff{id:"hungry"} run function rituals:soul/buffs/stack/hungry_check

# Heavy (max 2)
execute if data storage rituals:temp new_debuff{id:"heavy"} run function rituals:soul/buffs/stack/heavy_check

# Fragile (max 2)
execute if data storage rituals:temp new_debuff{id:"fragile"} run function rituals:soul/buffs/stack/fragile_check

# Clumsy (max 2)
execute if data storage rituals:temp new_debuff{id:"clumsy"} run function rituals:soul/buffs/stack/clumsy_check

# Unlucky (max 2)
execute if data storage rituals:temp new_debuff{id:"unlucky"} run function rituals:soul/buffs/stack/unlucky_check

# Gluttony (max 2)
execute if data storage rituals:temp new_debuff{id:"gluttony"} run function rituals:soul/buffs/stack/gluttony_check

# === NON-STACKABLE DEBUFFS (max 1) ===

execute if data storage rituals:temp new_debuff{id:"cursed"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"cursed"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_debuffs append from storage rituals:temp new_debuff
execute if data storage rituals:temp new_debuff{id:"cursed"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"cursed"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels.cursed set value 1
execute if data storage rituals:temp new_debuff{id:"cursed"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"cursed"}] run tellraw @a[distance=..16] [{"text":"  ☠️ ","color":"dark_purple"},{"text":"Cursed Aura","color":"light_purple"},{"text":" afflicted!","color":"red"}]

execute if data storage rituals:temp new_debuff{id:"loud"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"loud"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_debuffs append from storage rituals:temp new_debuff
execute if data storage rituals:temp new_debuff{id:"loud"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"loud"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels.loud set value 1
execute if data storage rituals:temp new_debuff{id:"loud"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"loud"}] run tellraw @a[distance=..16] [{"text":"  📢 ","color":"yellow"},{"text":"Restless Soul","color":"gold"},{"text":" afflicted!","color":"red"}]

execute if data storage rituals:temp new_debuff{id:"paranoid"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"paranoid"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_debuffs append from storage rituals:temp new_debuff
execute if data storage rituals:temp new_debuff{id:"paranoid"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"paranoid"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels.paranoid set value 1
execute if data storage rituals:temp new_debuff{id:"paranoid"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"paranoid"}] run tellraw @a[distance=..16] [{"text":"  👻 ","color":"gray"},{"text":"Paranoid Soul","color":"white"},{"text":" afflicted!","color":"red"}]

execute if data storage rituals:temp new_debuff{id:"bloodthirst"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"bloodthirst"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_debuffs append from storage rituals:temp new_debuff
execute if data storage rituals:temp new_debuff{id:"bloodthirst"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"bloodthirst"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels.bloodthirst set value 1
execute if data storage rituals:temp new_debuff{id:"bloodthirst"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"bloodthirst"}] run tellraw @a[distance=..16] [{"text":"  🩸 ","color":"dark_red"},{"text":"Bloodthirst","color":"red"},{"text":" afflicted!","color":"red"}]

execute if data storage rituals:temp new_debuff{id:"chatty"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"chatty"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_debuffs append from storage rituals:temp new_debuff
execute if data storage rituals:temp new_debuff{id:"chatty"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"chatty"}] run data modify storage rituals:temp item.components."minecraft:custom_data".soul_debuff_levels.chatty set value 1
execute if data storage rituals:temp new_debuff{id:"chatty"} unless data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"chatty"}] run tellraw @a[distance=..16] [{"text":"  🗣️ ","color":"yellow"},{"text":"Chatty Soul","color":"gold"},{"text":" afflicted!","color":"red"}]

# Already at max messages
execute if data storage rituals:temp new_debuff{id:"cursed"} if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"cursed"}] run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Cursed Aura already present!","color":"gray"}]
execute if data storage rituals:temp new_debuff{id:"loud"} if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"loud"}] run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Restless Soul already present!","color":"gray"}]
execute if data storage rituals:temp new_debuff{id:"paranoid"} if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"paranoid"}] run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Paranoid Soul already present!","color":"gray"}]
execute if data storage rituals:temp new_debuff{id:"bloodthirst"} if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"bloodthirst"}] run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Bloodthirst already present!","color":"gray"}]
execute if data storage rituals:temp new_debuff{id:"chatty"} if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"chatty"}] run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"yellow"},{"text":"Chatty Soul already present!","color":"gray"}]

