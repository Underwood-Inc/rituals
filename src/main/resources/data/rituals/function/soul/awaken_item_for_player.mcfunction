# Awaken Item For Player - Applies soul data to held item
# This injects soul_embodied custom data into the player's held item

# Store original item to temp storage
data modify storage rituals:temp awakening_item set from entity @s SelectedItem

# Determine tool type for name category
execute if entity @s[nbt={SelectedItem:{id:"minecraft:diamond_sword"}}] run scoreboard players set @s rituals.soul_temp 1
execute if entity @s[nbt={SelectedItem:{id:"minecraft:netherite_sword"}}] run scoreboard players set @s rituals.soul_temp 1
execute if entity @s[nbt={SelectedItem:{id:"minecraft:iron_sword"}}] run scoreboard players set @s rituals.soul_temp 1
execute if entity @s[nbt={SelectedItem:{id:"minecraft:golden_sword"}}] run scoreboard players set @s rituals.soul_temp 1
execute if entity @s[nbt={SelectedItem:{id:"minecraft:stone_sword"}}] run scoreboard players set @s rituals.soul_temp 1
execute if entity @s[nbt={SelectedItem:{id:"minecraft:wooden_sword"}}] run scoreboard players set @s rituals.soul_temp 1
execute if score @s rituals.soul_temp matches 1 run data modify storage rituals:temp soul_type set value "sword"

execute if entity @s[nbt={SelectedItem:{id:"minecraft:diamond_pickaxe"}}] run scoreboard players set @s rituals.soul_temp 2
execute if entity @s[nbt={SelectedItem:{id:"minecraft:netherite_pickaxe"}}] run scoreboard players set @s rituals.soul_temp 2
execute if entity @s[nbt={SelectedItem:{id:"minecraft:iron_pickaxe"}}] run scoreboard players set @s rituals.soul_temp 2
execute if entity @s[nbt={SelectedItem:{id:"minecraft:golden_pickaxe"}}] run scoreboard players set @s rituals.soul_temp 2
execute if entity @s[nbt={SelectedItem:{id:"minecraft:stone_pickaxe"}}] run scoreboard players set @s rituals.soul_temp 2
execute if entity @s[nbt={SelectedItem:{id:"minecraft:wooden_pickaxe"}}] run scoreboard players set @s rituals.soul_temp 2
execute if score @s rituals.soul_temp matches 2 run data modify storage rituals:temp soul_type set value "pickaxe"

execute if entity @s[nbt={SelectedItem:{id:"minecraft:diamond_axe"}}] run scoreboard players set @s rituals.soul_temp 3
execute if entity @s[nbt={SelectedItem:{id:"minecraft:netherite_axe"}}] run scoreboard players set @s rituals.soul_temp 3
execute if entity @s[nbt={SelectedItem:{id:"minecraft:iron_axe"}}] run scoreboard players set @s rituals.soul_temp 3
execute if entity @s[nbt={SelectedItem:{id:"minecraft:golden_axe"}}] run scoreboard players set @s rituals.soul_temp 3
execute if entity @s[nbt={SelectedItem:{id:"minecraft:stone_axe"}}] run scoreboard players set @s rituals.soul_temp 3
execute if entity @s[nbt={SelectedItem:{id:"minecraft:wooden_axe"}}] run scoreboard players set @s rituals.soul_temp 3
execute if score @s rituals.soul_temp matches 3 run data modify storage rituals:temp soul_type set value "axe"

execute if entity @s[nbt={SelectedItem:{id:"minecraft:diamond_shovel"}}] run scoreboard players set @s rituals.soul_temp 4
execute if entity @s[nbt={SelectedItem:{id:"minecraft:netherite_shovel"}}] run scoreboard players set @s rituals.soul_temp 4
execute if entity @s[nbt={SelectedItem:{id:"minecraft:iron_shovel"}}] run scoreboard players set @s rituals.soul_temp 4
execute if entity @s[nbt={SelectedItem:{id:"minecraft:golden_shovel"}}] run scoreboard players set @s rituals.soul_temp 4
execute if entity @s[nbt={SelectedItem:{id:"minecraft:stone_shovel"}}] run scoreboard players set @s rituals.soul_temp 4
execute if entity @s[nbt={SelectedItem:{id:"minecraft:wooden_shovel"}}] run scoreboard players set @s rituals.soul_temp 4
execute if score @s rituals.soul_temp matches 4 run data modify storage rituals:temp soul_type set value "shovel"

execute if entity @s[nbt={SelectedItem:{id:"minecraft:diamond_hoe"}}] run scoreboard players set @s rituals.soul_temp 5
execute if entity @s[nbt={SelectedItem:{id:"minecraft:netherite_hoe"}}] run scoreboard players set @s rituals.soul_temp 5
execute if entity @s[nbt={SelectedItem:{id:"minecraft:iron_hoe"}}] run scoreboard players set @s rituals.soul_temp 5
execute if entity @s[nbt={SelectedItem:{id:"minecraft:golden_hoe"}}] run scoreboard players set @s rituals.soul_temp 5
execute if entity @s[nbt={SelectedItem:{id:"minecraft:stone_hoe"}}] run scoreboard players set @s rituals.soul_temp 5
execute if entity @s[nbt={SelectedItem:{id:"minecraft:wooden_hoe"}}] run scoreboard players set @s rituals.soul_temp 5
execute if score @s rituals.soul_temp matches 5 run data modify storage rituals:temp soul_type set value "hoe"

execute if entity @s[nbt={SelectedItem:{id:"minecraft:bow"}}] run scoreboard players set @s rituals.soul_temp 6
execute if entity @s[nbt={SelectedItem:{id:"minecraft:crossbow"}}] run scoreboard players set @s rituals.soul_temp 7
execute if entity @s[nbt={SelectedItem:{id:"minecraft:trident"}}] run scoreboard players set @s rituals.soul_temp 8
execute if score @s rituals.soul_temp matches 6 run data modify storage rituals:temp soul_type set value "bow"
execute if score @s rituals.soul_temp matches 7 run data modify storage rituals:temp soul_type set value "crossbow"
execute if score @s rituals.soul_temp matches 8 run data modify storage rituals:temp soul_type set value "trident"

# Default to generic if not matched
execute unless score @s rituals.soul_temp matches 1..8 run data modify storage rituals:temp soul_type set value "generic"

# Generate a random soul name
function rituals:soul/names/generate

# Apply soul data to item
function rituals:soul/apply_soul_data

# Apply initial lore
function rituals:soul/lore/generate

# Notify player
tellraw @s ["",{"text":"","color":"dark_purple"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple"}]
tellraw @s ["",{"text":"  ✦ ","color":"dark_purple"},{"text":"SOUL EMBODIMENT COMPLETE","color":"light_purple","bold":true}]
tellraw @s ["",{"text":"  ","color":"gray"},{"text":"Your tool has awakened!","color":"gray"}]
tellraw @s ["",{"text":"  ","color":"gray"},{"text":"Soul Name: ","color":"gray"},{"storage":"rituals:temp","nbt":"soul_name","color":"white","bold":true}]
tellraw @s ["",{"text":"  ","color":"gray"},{"text":"Use it to gain XP and level up!","color":"yellow"}]
tellraw @s ["",{"text":"","color":"dark_purple"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple"}]

# Play awakening sound
playsound minecraft:entity.warden.sonic_boom master @s ~ ~ ~ 0.3 1.5
playsound minecraft:block.enchantment_table.use master @s ~ ~ ~ 1 0.5

# Particles
particle soul_fire_flame ~ ~1 ~ 0.5 0.5 0.5 0.05 50
particle enchant ~ ~1 ~ 0.5 0.5 0.5 1 100

