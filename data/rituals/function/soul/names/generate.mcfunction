# Generate a random soul name for the weapon
# Uses a pseudo-random selection from preset names

# Generate a random number 0-49 (50 names per category for datapack version)
# Use #name_roll fake player instead of @s since this runs as item_display entity
execute store result score #name_roll rituals.temp run random value 0..49

# Select name based on tool type and random number
# Swords
execute if data storage rituals:temp {soul_type:"sword"} if score #name_roll rituals.temp matches 0 run data modify storage rituals:temp soul_name set value "Vexbane"
execute if data storage rituals:temp {soul_type:"sword"} if score #name_roll rituals.temp matches 1 run data modify storage rituals:temp soul_name set value "Soulreaver"
execute if data storage rituals:temp {soul_type:"sword"} if score #name_roll rituals.temp matches 2 run data modify storage rituals:temp soul_name set value "Grimfang"
execute if data storage rituals:temp {soul_type:"sword"} if score #name_roll rituals.temp matches 3 run data modify storage rituals:temp soul_name set value "Bloodthirst"
execute if data storage rituals:temp {soul_type:"sword"} if score #name_roll rituals.temp matches 4 run data modify storage rituals:temp soul_name set value "Nightfall"
execute if data storage rituals:temp {soul_type:"sword"} if score #name_roll rituals.temp matches 5 run data modify storage rituals:temp soul_name set value "Duskbringer"
execute if data storage rituals:temp {soul_type:"sword"} if score #name_roll rituals.temp matches 6 run data modify storage rituals:temp soul_name set value "Razorwind"
execute if data storage rituals:temp {soul_type:"sword"} if score #name_roll rituals.temp matches 7 run data modify storage rituals:temp soul_name set value "Whispercut"
execute if data storage rituals:temp {soul_type:"sword"} if score #name_roll rituals.temp matches 8 run data modify storage rituals:temp soul_name set value "Dreadmaw"
execute if data storage rituals:temp {soul_type:"sword"} if score #name_roll rituals.temp matches 9 run data modify storage rituals:temp soul_name set value "Shadowpiercer"
execute if data storage rituals:temp {soul_type:"sword"} if score #name_roll rituals.temp matches 10 run data modify storage rituals:temp soul_name set value "Venomstrike"
execute if data storage rituals:temp {soul_type:"sword"} if score #name_roll rituals.temp matches 11 run data modify storage rituals:temp soul_name set value "Hellrazor"
execute if data storage rituals:temp {soul_type:"sword"} if score #name_roll rituals.temp matches 12 run data modify storage rituals:temp soul_name set value "Frostbite"
execute if data storage rituals:temp {soul_type:"sword"} if score #name_roll rituals.temp matches 13 run data modify storage rituals:temp soul_name set value "Doomblade"
execute if data storage rituals:temp {soul_type:"sword"} if score #name_roll rituals.temp matches 14 run data modify storage rituals:temp soul_name set value "Wrathseeker"
execute if data storage rituals:temp {soul_type:"sword"} if score #name_roll rituals.temp matches 15 run data modify storage rituals:temp soul_name set value "Spiritcleaver"
execute if data storage rituals:temp {soul_type:"sword"} if score #name_roll rituals.temp matches 16 run data modify storage rituals:temp soul_name set value "Ashrender"
execute if data storage rituals:temp {soul_type:"sword"} if score #name_roll rituals.temp matches 17 run data modify storage rituals:temp soul_name set value "Voidtooth"
execute if data storage rituals:temp {soul_type:"sword"} if score #name_roll rituals.temp matches 18 run data modify storage rituals:temp soul_name set value "Stormcaller"
execute if data storage rituals:temp {soul_type:"sword"} if score #name_roll rituals.temp matches 19 run data modify storage rituals:temp soul_name set value "Bonechill"
execute if data storage rituals:temp {soul_type:"sword"} if score #name_roll rituals.temp matches 20..49 run function rituals:soul/names/sword_extended

# Pickaxes
execute if data storage rituals:temp {soul_type:"pickaxe"} if score #name_roll rituals.temp matches 0 run data modify storage rituals:temp soul_name set value "Earthshatter"
execute if data storage rituals:temp {soul_type:"pickaxe"} if score #name_roll rituals.temp matches 1 run data modify storage rituals:temp soul_name set value "Orebiter"
execute if data storage rituals:temp {soul_type:"pickaxe"} if score #name_roll rituals.temp matches 2 run data modify storage rituals:temp soul_name set value "Stoneheart"
execute if data storage rituals:temp {soul_type:"pickaxe"} if score #name_roll rituals.temp matches 3 run data modify storage rituals:temp soul_name set value "Deepdelver"
execute if data storage rituals:temp {soul_type:"pickaxe"} if score #name_roll rituals.temp matches 4 run data modify storage rituals:temp soul_name set value "Crystalmaw"
execute if data storage rituals:temp {soul_type:"pickaxe"} if score #name_roll rituals.temp matches 5 run data modify storage rituals:temp soul_name set value "Veinseeker"
execute if data storage rituals:temp {soul_type:"pickaxe"} if score #name_roll rituals.temp matches 6 run data modify storage rituals:temp soul_name set value "Rockcrusher"
execute if data storage rituals:temp {soul_type:"pickaxe"} if score #name_roll rituals.temp matches 7 run data modify storage rituals:temp soul_name set value "Mountainbane"
execute if data storage rituals:temp {soul_type:"pickaxe"} if score #name_roll rituals.temp matches 8 run data modify storage rituals:temp soul_name set value "Cavernhowl"
execute if data storage rituals:temp {soul_type:"pickaxe"} if score #name_roll rituals.temp matches 9 run data modify storage rituals:temp soul_name set value "Gemgnasher"
execute if data storage rituals:temp {soul_type:"pickaxe"} if score #name_roll rituals.temp matches 10..49 run function rituals:soul/names/pickaxe_extended

# Axes
execute if data storage rituals:temp {soul_type:"axe"} if score #name_roll rituals.temp matches 0 run data modify storage rituals:temp soul_name set value "Timberfall"
execute if data storage rituals:temp {soul_type:"axe"} if score #name_roll rituals.temp matches 1 run data modify storage rituals:temp soul_name set value "Skullsplitter"
execute if data storage rituals:temp {soul_type:"axe"} if score #name_roll rituals.temp matches 2 run data modify storage rituals:temp soul_name set value "Woodwrath"
execute if data storage rituals:temp {soul_type:"axe"} if score #name_roll rituals.temp matches 3 run data modify storage rituals:temp soul_name set value "Groverender"
execute if data storage rituals:temp {soul_type:"axe"} if score #name_roll rituals.temp matches 4 run data modify storage rituals:temp soul_name set value "Barkbreaker"
execute if data storage rituals:temp {soul_type:"axe"} if score #name_roll rituals.temp matches 5 run data modify storage rituals:temp soul_name set value "Forestfury"
execute if data storage rituals:temp {soul_type:"axe"} if score #name_roll rituals.temp matches 6 run data modify storage rituals:temp soul_name set value "Branchbane"
execute if data storage rituals:temp {soul_type:"axe"} if score #name_roll rituals.temp matches 7 run data modify storage rituals:temp soul_name set value "Treefeller"
execute if data storage rituals:temp {soul_type:"axe"} if score #name_roll rituals.temp matches 8 run data modify storage rituals:temp soul_name set value "Lumberdoom"
execute if data storage rituals:temp {soul_type:"axe"} if score #name_roll rituals.temp matches 9 run data modify storage rituals:temp soul_name set value "Chopwrath"
execute if data storage rituals:temp {soul_type:"axe"} if score #name_roll rituals.temp matches 10..49 run function rituals:soul/names/axe_extended

# Generic/Other tools
execute if data storage rituals:temp {soul_type:"generic"} run function rituals:soul/names/generic
execute if data storage rituals:temp {soul_type:"shovel"} run function rituals:soul/names/shovel
execute if data storage rituals:temp {soul_type:"hoe"} run function rituals:soul/names/hoe
execute if data storage rituals:temp {soul_type:"bow"} run function rituals:soul/names/ranged
execute if data storage rituals:temp {soul_type:"crossbow"} run function rituals:soul/names/ranged
execute if data storage rituals:temp {soul_type:"trident"} run function rituals:soul/names/ranged

# Fallback name if nothing matched (check if soul_name doesn't exist)
execute unless data storage rituals:temp soul_name run data modify storage rituals:temp soul_name set value "Soulbound"

# Debug: confirm what name was generated
execute if entity @a[tag=rituals.debug] run tellraw @a[tag=rituals.debug] [{"text":"[Soul Names] ","color":"gold"},{"text":"Generated name: ","color":"gray"},{"nbt":"soul_name","storage":"rituals:temp","color":"green"}]

