# ========================================
# Announce New Buff/Debuff
# ========================================
# Shows what buff was gained on level up

# Get buff ID for announcement
data modify storage rituals:temp announce_buff set from storage rituals:temp item.components."minecraft:custom_data".soul_buffs[-1]

# Announce based on buff type
execute if data storage rituals:temp announce_buff{id:"haste"} run tellraw @a[distance=..16] [{"text":"  ⚡ ","color":"yellow"},{"text":"Soul Haste","color":"gold"},{"text":" - Mining speed increased!","color":"gray"}]
execute if data storage rituals:temp announce_buff{id:"glow"} run tellraw @a[distance=..16] [{"text":"  ✨ ","color":"yellow"},{"text":"Soul Sight","color":"gold"},{"text":" - Entities glow nearby!","color":"gray"}]
execute if data storage rituals:temp announce_buff{id:"magnetic"} run tellraw @a[distance=..16] [{"text":"  🧲 ","color":"aqua"},{"text":"Magnetic Pull","color":"gold"},{"text":" - Items attracted to you!","color":"gray"}]
execute if data storage rituals:temp announce_buff{id:"reach"} run tellraw @a[distance=..16] [{"text":"  🖐 ","color":"white"},{"text":"Extended Reach","color":"gold"},{"text":" - Longer interaction range!","color":"gray"}]
execute if data storage rituals:temp announce_buff{id:"repair"} run tellraw @a[distance=..16] [{"text":"  🔧 ","color":"green"},{"text":"Soul Mending","color":"gold"},{"text":" - Occasionally repairs itself!","color":"gray"}]
execute if data storage rituals:temp announce_buff{id:"lucky"} run tellraw @a[distance=..16] [{"text":"  🍀 ","color":"green"},{"text":"Fortune's Favor","color":"gold"},{"text":" - Luck increased!","color":"gray"}]
execute if data storage rituals:temp announce_buff{id:"swift"} run tellraw @a[distance=..16] [{"text":"  💨 ","color":"white"},{"text":"Soul Speed","color":"gold"},{"text":" - Movement speed increased!","color":"gray"}]
execute if data storage rituals:temp announce_buff{id:"strong"} run tellraw @a[distance=..16] [{"text":"  💪 ","color":"red"},{"text":"Soul Strength","color":"gold"},{"text":" - Attack damage increased!","color":"gray"}]
execute if data storage rituals:temp announce_buff{id:"tough"} run tellraw @a[distance=..16] [{"text":"  🛡 ","color":"blue"},{"text":"Soul Armor","color":"gold"},{"text":" - Damage resistance increased!","color":"gray"}]
execute if data storage rituals:temp announce_buff{id:"nimble"} run tellraw @a[distance=..16] [{"text":"  🦘 ","color":"white"},{"text":"Featherweight","color":"gold"},{"text":" - Jump height increased!","color":"gray"}]
execute if data storage rituals:temp announce_buff{id:"soulfire"} run tellraw @a[distance=..16] [{"text":"  🔥 ","color":"light_purple"},{"text":"Soul Flame","color":"gold"},{"text":" - Attacks ignite enemies!","color":"gray"}]
execute if data storage rituals:temp announce_buff{id:"lifesteal"} run tellraw @a[distance=..16] [{"text":"  ❤ ","color":"dark_red"},{"text":"Soul Leech","color":"gold"},{"text":" - Heal on dealing damage!","color":"gray"}]
execute if data storage rituals:temp announce_buff{id:"xpboost"} run tellraw @a[distance=..16] [{"text":"  ✦ ","color":"green"},{"text":"Soul Wisdom","color":"gold"},{"text":" - Increased XP gains!","color":"gray"}]
execute if data storage rituals:temp announce_buff{id:"looting"} run tellraw @a[distance=..16] [{"text":"  💎 ","color":"aqua"},{"text":"Soul Harvest","color":"gold"},{"text":" - Increased mob drops!","color":"gray"}]
execute if data storage rituals:temp announce_buff{id:"unbreaking"} run tellraw @a[distance=..16] [{"text":"  ♦ ","color":"gray"},{"text":"Eternal Edge","color":"gold"},{"text":" - Reduced durability loss!","color":"gray"}]
execute if data storage rituals:temp announce_buff{id:"nightvision"} run tellraw @a[distance=..16] [{"text":"  👁 ","color":"yellow"},{"text":"Dark Vision","color":"gold"},{"text":" - See in darkness!","color":"gray"}]
execute if data storage rituals:temp announce_buff{id:"waterbreath"} run tellraw @a[distance=..16] [{"text":"  🫧 ","color":"aqua"},{"text":"Aquatic Soul","color":"gold"},{"text":" - Breathe underwater!","color":"gray"}]
execute if data storage rituals:temp announce_buff{id:"fireresist"} run tellraw @a[distance=..16] [{"text":"  🔥 ","color":"gold"},{"text":"Flame Ward","color":"gold"},{"text":" - Resist fire damage!","color":"gray"}]
execute if data storage rituals:temp announce_buff{id:"saturation"} run tellraw @a[distance=..16] [{"text":"  🍖 ","color":"gold"},{"text":"Soul Sustenance","color":"gold"},{"text":" - Reduced hunger drain!","color":"gray"}]
execute if data storage rituals:temp announce_buff{id:"veinminer"} run tellraw @a[distance=..16] [{"text":"  ⛏ ","color":"gray"},{"text":"Ore Sense","color":"gold"},{"text":" - Break connected ores!","color":"gray"}]
execute if data storage rituals:temp announce_buff{id:"reserved"} run tellraw @a[distance=..16] [{"text":"  🤫 ","color":"gray"},{"text":"Reserved Soul","color":"gold"},{"text":" - Soul speaks less often!","color":"gray"}]

# Check for debuff announcement
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[-1] run function rituals:soul/buffs/announce_debuff

data remove storage rituals:temp announce_buff

