# ========================================
# Announce Debuff
# ========================================
# Shows the debuff that was applied

data modify storage rituals:temp announce_debuff set from storage rituals:temp item.components."minecraft:custom_data".soul_debuffs[-1]

tellraw @a[distance=..16] [{"text":"  ","color":"gray"},{"text":"...but the soul whispers of a cost...","color":"dark_gray","italic":true}]

execute if data storage rituals:temp announce_debuff{id:"hungry"} run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"red"},{"text":"Ravenous Soul","color":"dark_red"},{"text":" - Increased hunger drain","color":"gray"}]
execute if data storage rituals:temp announce_debuff{id:"heavy"} run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"red"},{"text":"Burdened","color":"dark_red"},{"text":" - Movement slowed","color":"gray"}]
execute if data storage rituals:temp announce_debuff{id:"cursed"} run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"red"},{"text":"Cursed Aura","color":"dark_red"},{"text":" - Bad Omen lingers","color":"gray"}]
execute if data storage rituals:temp announce_debuff{id:"fragile"} run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"red"},{"text":"Brittle Edge","color":"dark_red"},{"text":" - Faster durability loss","color":"gray"}]
execute if data storage rituals:temp announce_debuff{id:"loud"} run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"red"},{"text":"Restless Soul","color":"dark_red"},{"text":" - Alerts nearby mobs","color":"gray"}]
execute if data storage rituals:temp announce_debuff{id:"clumsy"} run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"red"},{"text":"Clumsy Grip","color":"dark_red"},{"text":" - Occasional mining fatigue","color":"gray"}]
execute if data storage rituals:temp announce_debuff{id:"unlucky"} run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"red"},{"text":"Misfortune","color":"dark_red"},{"text":" - Reduced luck","color":"gray"}]
execute if data storage rituals:temp announce_debuff{id:"gluttony"} run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"red"},{"text":"Soul Hunger","color":"dark_red"},{"text":" - Consumes more XP","color":"gray"}]
execute if data storage rituals:temp announce_debuff{id:"paranoid"} run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"red"},{"text":"Paranoid Soul","color":"dark_red"},{"text":" - Hears strange sounds","color":"gray"}]
execute if data storage rituals:temp announce_debuff{id:"bloodthirst"} run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"red"},{"text":"Bloodthirst","color":"dark_red"},{"text":" - Demands blood or hurts you","color":"gray"}]
execute if data storage rituals:temp announce_debuff{id:"chatty"} run tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"red"},{"text":"Chatty Soul","color":"dark_red"},{"text":" - Won't stop talking!","color":"gray"}]

# Fractured is announced separately with dramatic effect (see roll_fracture.mcfunction)

data remove storage rituals:temp announce_debuff

