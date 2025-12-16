# ========================================
# Build Full Soul Weapon Lore
# ========================================
# Creates complete dynamic lore showing level, XP, all buffs, all debuffs
# Called after any sync/level up
# Expects: storage rituals:temp item (the item to update)

# Clear existing lore and build fresh
data modify storage rituals:temp new_lore set value []

# === HEADER ===
data modify storage rituals:temp new_lore append value {"text":"━━━━━━━━━━━━━━━━━━━━","color":"dark_purple"}

# === LEVEL & XP (will be replaced by macro) ===
# Placeholder - actual values injected by macro function
data modify storage rituals:temp new_lore append value {"text":"LEVEL_PLACEHOLDER","color":"gray"}
data modify storage rituals:temp new_lore append value {"text":"XP_PLACEHOLDER","color":"gray"}

# === BUFFS SECTION ===
# Check if any buffs exist
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[0] run data modify storage rituals:temp new_lore append value {"text":"","color":"gray"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[0] run data modify storage rituals:temp new_lore append value {"text":"✦ Boons:","color":"green"}

# Check each possible buff and add to lore
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"haste"}] run data modify storage rituals:temp new_lore append value {"text":" ⚡ Soul Haste","color":"yellow"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"glow"}] run data modify storage rituals:temp new_lore append value {"text":" ✨ Soul Sight","color":"yellow"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"magnetic"}] run data modify storage rituals:temp new_lore append value {"text":" 🧲 Magnetic Pull","color":"aqua"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"reach"}] run data modify storage rituals:temp new_lore append value {"text":" 🖐 Extended Reach","color":"white"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"repair"}] run data modify storage rituals:temp new_lore append value {"text":" 🔧 Soul Mending","color":"green"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"lucky"}] run data modify storage rituals:temp new_lore append value {"text":" 🍀 Fortunes Favor","color":"green"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"swift"}] run data modify storage rituals:temp new_lore append value {"text":" 💨 Soul Speed","color":"white"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"strong"}] run data modify storage rituals:temp new_lore append value {"text":" 💪 Soul Strength","color":"red"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"tough"}] run data modify storage rituals:temp new_lore append value {"text":" 🛡 Soul Armor","color":"blue"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"nimble"}] run data modify storage rituals:temp new_lore append value {"text":" 🦘 Featherweight","color":"white"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"soulfire"}] run data modify storage rituals:temp new_lore append value {"text":" 🔥 Soul Flame","color":"gold"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"lifesteal"}] run data modify storage rituals:temp new_lore append value {"text":" ❤ Soul Leech","color":"dark_red"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"xpboost"}] run data modify storage rituals:temp new_lore append value {"text":" ✦ Soul Wisdom","color":"green"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"looting"}] run data modify storage rituals:temp new_lore append value {"text":" 💎 Soul Harvest","color":"aqua"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"unbreaking"}] run data modify storage rituals:temp new_lore append value {"text":" ♦ Eternal Edge","color":"gray"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"nightvision"}] run data modify storage rituals:temp new_lore append value {"text":" 👁 Dark Vision","color":"yellow"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"waterbreath"}] run data modify storage rituals:temp new_lore append value {"text":" 🫧 Aquatic Soul","color":"aqua"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"fireresist"}] run data modify storage rituals:temp new_lore append value {"text":" 🔥 Flame Ward","color":"gold"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"saturation"}] run data modify storage rituals:temp new_lore append value {"text":" 🍖 Soul Sustenance","color":"gold"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_buffs[{id:"reserved"}] run data modify storage rituals:temp new_lore append value {"text":" 🤫 Reserved Soul","color":"gray"}

# === DEBUFFS SECTION ===
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[0] run data modify storage rituals:temp new_lore append value {"text":"","color":"gray"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[0] run data modify storage rituals:temp new_lore append value {"text":"⚠ Curses:","color":"red"}

# Check each possible debuff
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"hungry"}] run data modify storage rituals:temp new_lore append value {"text":" ⚠ Ravenous Soul","color":"dark_red"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"heavy"}] run data modify storage rituals:temp new_lore append value {"text":" ⚠ Burdened","color":"dark_red"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"cursed"}] run data modify storage rituals:temp new_lore append value {"text":" ⚠ Cursed Aura","color":"dark_red"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"fragile"}] run data modify storage rituals:temp new_lore append value {"text":" ⚠ Brittle Edge","color":"dark_red"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"loud"}] run data modify storage rituals:temp new_lore append value {"text":" ⚠ Restless Soul","color":"dark_red"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"clumsy"}] run data modify storage rituals:temp new_lore append value {"text":" ⚠ Clumsy Grip","color":"dark_red"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"unlucky"}] run data modify storage rituals:temp new_lore append value {"text":" ⚠ Misfortune","color":"dark_red"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"gluttony"}] run data modify storage rituals:temp new_lore append value {"text":" ⚠ Soul Hunger","color":"dark_red"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"paranoid"}] run data modify storage rituals:temp new_lore append value {"text":" ⚠ Paranoid Soul","color":"dark_red"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"bloodthirst"}] run data modify storage rituals:temp new_lore append value {"text":" ⚠ Bloodthirst","color":"dark_red"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[{id:"chatty"}] run data modify storage rituals:temp new_lore append value {"text":" ⚠ Chatty Soul","color":"dark_red"}

# === FRACTURED STATUS ===
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_fractured run data modify storage rituals:temp new_lore append value {"text":"","color":"gray"}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_fractured run data modify storage rituals:temp new_lore append value {"text":"💔 FRACTURED SOUL","color":"dark_red","bold":true}
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_fractured run data modify storage rituals:temp new_lore append value {"text":"Cannot ascend further","color":"gray","italic":true}

# === FOOTER ===
data modify storage rituals:temp new_lore append value {"text":"━━━━━━━━━━━━━━━━━━━━","color":"dark_purple"}
# Show the soul's true name (identity) - this never changes
execute store success score #has_soul_name rituals.temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_name
execute if score #has_soul_name rituals.temp matches 1 run function rituals:soul/lore/add_soul_identity
execute if score #has_soul_name rituals.temp matches 0 run data modify storage rituals:temp new_lore append value {"text":"✦ Soul-Bound Weapon ✦","color":"light_purple"}

