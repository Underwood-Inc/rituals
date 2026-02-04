# ========================================
# Soul Buffs/Debuffs Registry (BALANCED)
# ========================================
# Initializes all possible buffs and debuffs for soul weapons
# Called from soul/init.mcfunction

# === BUFF REGISTRY ===
# Each buff has: id, name, description, max_level, effect_type, power_tier
# power_tier: 1=common, 2=uncommon, 3=rare (affects roll weight)
# incompatible: list of buff/debuff ids that cannot coexist

data modify storage rituals:soul buffs set value [\
  {id:"haste",name:"Soul Haste",desc:"Mining speed +10% per level",max_level:3,type:"attribute",tier:1,per_level:0.10},\
  {id:"glow",name:"Soul Sight",desc:"Nearby entities glow",max_level:1,type:"special",tier:2},\
  {id:"magnetic",name:"Magnetic Pull",desc:"Items attracted within 5+2/lvl blocks",max_level:2,type:"special",tier:2},\
  {id:"reach",name:"Extended Reach",desc:"+0.5 block range per level",max_level:3,type:"attribute",tier:2,per_level:0.5},\
  {id:"repair",name:"Soul Mending",desc:"0.5% chance/tick to repair per level",max_level:3,type:"special",tier:3,incompatible:["fragile"]},\
  {id:"lucky",name:"Fortune's Favor",desc:"+0.5 luck per level",max_level:2,type:"attribute",tier:2,per_level:0.5,incompatible:["unlucky"]},\
  {id:"swift",name:"Soul Speed",desc:"+3% movement per level",max_level:3,type:"attribute",tier:1,per_level:0.03,incompatible:["heavy"]},\
  {id:"strong",name:"Soul Strength",desc:"+0.5 attack damage per level",max_level:4,type:"attribute",tier:2,per_level:0.5},\
  {id:"tough",name:"Soul Armor",desc:"+1 armor per level",max_level:3,type:"attribute",tier:2,per_level:1.0},\
  {id:"nimble",name:"Featherweight",desc:"Jump Boost I",max_level:1,type:"potion",tier:2},\
  {id:"soulfire",name:"Soul Flame",desc:"10% chance to ignite per level",max_level:2,type:"special",tier:3,incompatible:["fireresist"]},\
  {id:"lifesteal",name:"Soul Leech",desc:"5% of damage healed per level",max_level:2,type:"special",tier:3},\
  {id:"xpboost",name:"Soul Wisdom",desc:"+10% XP per level",max_level:2,type:"special",tier:2},\
  {id:"looting",name:"Soul Harvest",desc:"Extra drops (like Looting I per level)",max_level:2,type:"special",tier:3},\
  {id:"unbreaking",name:"Eternal Edge",desc:"25% less durability loss per level",max_level:2,type:"special",tier:2,incompatible:["fragile"]},\
  {id:"nightvision",name:"Dark Vision",desc:"See in darkness",max_level:1,type:"potion",tier:1},\
  {id:"waterbreath",name:"Aquatic Soul",desc:"Breathe underwater",max_level:1,type:"potion",tier:2,incompatible:["fireresist"]},\
  {id:"fireresist",name:"Flame Ward",desc:"Resist fire damage",max_level:1,type:"potion",tier:2,incompatible:["waterbreath","soulfire"]},\
  {id:"saturation",name:"Soul Sustenance",desc:"Reduced hunger drain",max_level:2,type:"special",tier:1,incompatible:["hungry"]},\
  {id:"reserved",name:"Reserved Soul",desc:"Soul speaks less often",max_level:1,type:"personality",tier:1,incompatible:["chatty"]}\
]

# === DEBUFF REGISTRY (30% chance to apply) ===
data modify storage rituals:soul debuffs set value [\
  {id:"hungry",name:"Ravenous Soul",desc:"Occasional hunger effect",max_level:2,type:"special",incompatible:["saturation"]},\
  {id:"heavy",name:"Burdened",desc:"-3% movement per level",max_level:2,type:"attribute",per_level:-0.03,incompatible:["swift"]},\
  {id:"cursed",name:"Cursed Aura",desc:"Rare Bad Omen",max_level:1,type:"special"},\
  {id:"fragile",name:"Brittle Edge",desc:"+25% durability loss per level",max_level:2,type:"special",incompatible:["unbreaking","repair"]},\
  {id:"loud",name:"Restless Soul",desc:"Alerts nearby mobs",max_level:1,type:"special"},\
  {id:"clumsy",name:"Clumsy Grip",desc:"Occasional mining fatigue",max_level:2,type:"special"},\
  {id:"unlucky",name:"Misfortune",desc:"-0.5 luck per level",max_level:2,type:"attribute",per_level:-0.5,incompatible:["lucky"]},\
  {id:"gluttony",name:"Soul Hunger",desc:"+20% XP needed per level",max_level:2,type:"special"},\
  {id:"paranoid",name:"Paranoid Soul",desc:"Random spooky sounds",max_level:1,type:"special"},\
  {id:"bloodthirst",name:"Bloodthirst",desc:"1 damage/30s if no combat",max_level:1,type:"special"},\
  {id:"chatty",name:"Chatty Soul",desc:"Soul speaks more often",max_level:1,type:"personality",incompatible:["reserved"]}\
]

# Removed veinminer - too complex and overpowered for datapack implementation

# Buff weights (rarity tiers)
# Tier 1 (common): weight 10
# Tier 2 (uncommon): weight 6
# Tier 3 (rare): weight 3
data modify storage rituals:soul buff_weights set value {haste:10,glow:6,magnetic:6,reach:6,repair:3,lucky:6,swift:10,strong:6,tough:6,nimble:6,soulfire:3,lifesteal:3,xpboost:6,looting:3,unbreaking:6,nightvision:10,waterbreath:6,fireresist:6,saturation:10,reserved:10}

# Total buff count for random selection (20 buffs now, removed veinminer)
scoreboard players set #buff_count rituals.soul 20
scoreboard players set #debuff_count rituals.soul 11

# Debuff chance (30 = 30%)
scoreboard players set #debuff_chance rituals.soul 30

# Fractured chance (10 = 10%) - PERMANENT, prevents ascension forever
scoreboard players set #fracture_chance rituals.soul 10

# Fractured debuff (special catastrophic debuff)
data modify storage rituals:soul fractured_debuff set value {id:"fractured",name:"Fractured Soul",desc:"The soul has shattered. Maximum level can never be increased. Ascension is impossible.",max_level:1,type:"permanent"}

