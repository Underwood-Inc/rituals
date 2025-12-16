# ========================================
# Apply Bonus Enchantment
# ========================================
# 50% chance on ascension to add a bonus enchantment
# Called when the bonus roll succeeds

# Increment bonus enchant counter
execute as @e[type=item_display,tag=rituals.totem_display,distance=..2,limit=1] store result score #bonus_count rituals.soul_temp run data get entity @s item.components."minecraft:custom_data".soul_bonus_enchants
scoreboard players add #bonus_count rituals.soul_temp 1
execute store result entity @e[type=item_display,tag=rituals.totem_display,distance=..2,limit=1] item.components."minecraft:custom_data".soul_bonus_enchants int 1 run scoreboard players get #bonus_count rituals.soul_temp

# Get the soul type to determine valid enchantments
data modify storage rituals:temp bonus_soul_type set from entity @e[type=item_display,tag=rituals.totem_display,distance=..2,limit=1] item.components."minecraft:custom_data".soul_type

# For now, apply a generic enchant based on tool type
# NOTE: Actually applying enchantments to items requires more complex NBT manipulation
# The mod can handle this more elegantly; datapack shows the notification

# Visual celebration
particle minecraft:totem_of_undying ~ ~2 ~ 0.5 1 0.5 1 100 force
particle minecraft:enchanted_hit ~ ~1.5 ~ 0.5 0.5 0.5 0.5 50 force

# Sound
playsound minecraft:block.enchantment_table.use master @a ~ ~ ~ 2.0 1.0
playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1.5 0.5

# Determine bonus text based on soul type
# Swords
execute if data storage rituals:temp {bonus_soul_type:"sword"} run tellraw @a[distance=..32] [{"text":"   ","color":"gray"},{"text":"★ BONUS: ","color":"gold","bold":true},{"text":"Sharpness +1!","color":"aqua"}]

# Pickaxes
execute if data storage rituals:temp {bonus_soul_type:"pickaxe"} run tellraw @a[distance=..32] [{"text":"   ","color":"gray"},{"text":"★ BONUS: ","color":"gold","bold":true},{"text":"Efficiency +1!","color":"aqua"}]

# Axes
execute if data storage rituals:temp {bonus_soul_type:"axe"} run tellraw @a[distance=..32] [{"text":"   ","color":"gray"},{"text":"★ BONUS: ","color":"gold","bold":true},{"text":"Efficiency +1!","color":"aqua"}]

# Shovels
execute if data storage rituals:temp {bonus_soul_type:"shovel"} run tellraw @a[distance=..32] [{"text":"   ","color":"gray"},{"text":"★ BONUS: ","color":"gold","bold":true},{"text":"Efficiency +1!","color":"aqua"}]

# Hoes
execute if data storage rituals:temp {bonus_soul_type:"hoe"} run tellraw @a[distance=..32] [{"text":"   ","color":"gray"},{"text":"★ BONUS: ","color":"gold","bold":true},{"text":"Fortune +1!","color":"aqua"}]

# Bows
execute if data storage rituals:temp {bonus_soul_type:"bow"} run tellraw @a[distance=..32] [{"text":"   ","color":"gray"},{"text":"★ BONUS: ","color":"gold","bold":true},{"text":"Power +1!","color":"aqua"}]

# Crossbows
execute if data storage rituals:temp {bonus_soul_type:"crossbow"} run tellraw @a[distance=..32] [{"text":"   ","color":"gray"},{"text":"★ BONUS: ","color":"gold","bold":true},{"text":"Quick Charge +1!","color":"aqua"}]

# Tridents
execute if data storage rituals:temp {bonus_soul_type:"trident"} run tellraw @a[distance=..32] [{"text":"   ","color":"gray"},{"text":"★ BONUS: ","color":"gold","bold":true},{"text":"Loyalty +1!","color":"aqua"}]

# Generic fallback
execute if data storage rituals:temp {bonus_soul_type:"generic"} run tellraw @a[distance=..32] [{"text":"   ","color":"gray"},{"text":"★ BONUS: ","color":"gold","bold":true},{"text":"Unbreaking +1!","color":"aqua"}]

# Clean up
data remove storage rituals:temp bonus_soul_type

