# ========================================
# On Tool Use - Award Soul XP
# ========================================
# Called when a soul weapon's durability decreases (it was used)
# Awards XP based on tool type

# Determine XP amount based on tool type
scoreboard players set #xp_gain rituals.soul_temp 1

# Pickaxes get 2 XP per use (mining)
execute if data entity @s SelectedItem.components."minecraft:custom_data"{soul_type:"pickaxe"} run scoreboard players set #xp_gain rituals.soul_temp 2

# Axes get 2 XP per use (chopping/combat)
execute if data entity @s SelectedItem.components."minecraft:custom_data"{soul_type:"axe"} run scoreboard players set #xp_gain rituals.soul_temp 2

# Swords get 3 XP per use (combat)
execute if data entity @s SelectedItem.components."minecraft:custom_data"{soul_type:"sword"} run scoreboard players set #xp_gain rituals.soul_temp 3

# Shovels get 1 XP per use (digging)
execute if data entity @s SelectedItem.components."minecraft:custom_data"{soul_type:"shovel"} run scoreboard players set #xp_gain rituals.soul_temp 1

# Hoes get 1 XP per use (harvesting)
execute if data entity @s SelectedItem.components."minecraft:custom_data"{soul_type:"hoe"} run scoreboard players set #xp_gain rituals.soul_temp 1

# Ranged weapons get 5 XP per use
execute if data entity @s SelectedItem.components."minecraft:custom_data"{soul_type:"bow"} run scoreboard players set #xp_gain rituals.soul_temp 5
execute if data entity @s SelectedItem.components."minecraft:custom_data"{soul_type:"crossbow"} run scoreboard players set #xp_gain rituals.soul_temp 5
execute if data entity @s SelectedItem.components."minecraft:custom_data"{soul_type:"trident"} run scoreboard players set #xp_gain rituals.soul_temp 5

# Award the XP
function rituals:soul/award_xp

