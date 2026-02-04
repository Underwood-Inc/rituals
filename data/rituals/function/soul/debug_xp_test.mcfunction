# ========================================
# DEBUG: Test XP System
# ========================================
# Run this while holding a soul weapon to see what's happening
# Usage: /function rituals:soul/debug_xp_test

tellraw @s [{"text":"=== SOUL XP DEBUG ===","color":"gold","bold":true}]

# Check if holding soul item
execute unless data entity @s SelectedItem.components."minecraft:custom_data".soul_embodied run tellraw @s [{"text":"❌ ERROR: Not holding a soul-embodied item!","color":"red"}]
execute unless data entity @s SelectedItem.components."minecraft:custom_data".soul_embodied run return 0

tellraw @s [{"text":"✓ Holding soul item","color":"green"}]

# Show soul type
tellraw @s [{"text":"Soul Type: ","color":"gray"},{"nbt":"SelectedItem.components.\"minecraft:custom_data\".soul_type","entity":"@s","color":"aqua"}]

# Check soul_type value
execute if data entity @s SelectedItem.components."minecraft:custom_data"{soul_type:"pickaxe"} run tellraw @s [{"text":"  → Type is PICKAXE","color":"green"}]
execute if data entity @s SelectedItem.components."minecraft:custom_data"{soul_type:"shovel"} run tellraw @s [{"text":"  → Type is SHOVEL","color":"green"}]
execute if data entity @s SelectedItem.components."minecraft:custom_data"{soul_type:"axe"} run tellraw @s [{"text":"  → Type is AXE","color":"green"}]
execute if data entity @s SelectedItem.components."minecraft:custom_data"{soul_type:"hoe"} run tellraw @s [{"text":"  → Type is HOE","color":"green"}]
execute if data entity @s SelectedItem.components."minecraft:custom_data"{soul_type:"sword"} run tellraw @s [{"text":"  → Type is SWORD","color":"green"}]
execute if data entity @s SelectedItem.components."minecraft:custom_data"{soul_type:"generic"} run tellraw @s [{"text":"  → Type is GENERIC (this is wrong!)","color":"red"}]
execute unless data entity @s SelectedItem.components."minecraft:custom_data".soul_type run tellraw @s [{"text":"  → Type is MISSING!","color":"red"}]

# Show pending XP
tellraw @s [{"text":"Pending XP: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.soul_xp_gain"},"color":"yellow"}]

# Show some block stats (stone mining)
tellraw @s [{"text":"=== BLOCK STATS (lifetime) ===","color":"gold"}]
tellraw @s [{"text":"Stone mined: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.m_stone"},"color":"aqua"}]
tellraw @s [{"text":"Cobblestone mined: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.m_cobblestone"},"color":"aqua"}]
tellraw @s [{"text":"Deepslate mined: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.m_deepslate"},"color":"aqua"}]
tellraw @s [{"text":"Dirt mined: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.m_dirt"},"color":"aqua"}]

# Show tracking scoreboards
tellraw @s [{"text":"=== TRACKING ===","color":"gold"}]
tellraw @s [{"text":"pickaxe_mined: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.pickaxe_mined"},"color":"aqua"}]
tellraw @s [{"text":"prev_mined: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.prev_mined"},"color":"yellow"}]

# Check if scoreboards exist
execute unless score @s rituals.m_stone matches -2147483648.. run tellraw @s [{"text":"❌ SCOREBOARDS NOT INITIALIZED - run /reload!","color":"red"}]

tellraw @s [{"text":"=== END DEBUG ===","color":"gold","bold":true}]

