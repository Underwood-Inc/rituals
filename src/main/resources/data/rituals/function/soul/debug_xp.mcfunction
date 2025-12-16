# ========================================
# Debug Soul XP System
# ========================================
# Run this to diagnose XP tracking issues
# Usage: /function rituals:soul/debug_xp

tellraw @s [{"text":"━━━ SOUL XP DEBUG ━━━","color":"gold","bold":true}]

# Check if player has a soul weapon
execute if data entity @s SelectedItem.components."minecraft:custom_data".soul_embodied run tellraw @s [{"text":"✓ ","color":"green"},{"text":"Holding soul weapon","color":"gray"}]
execute unless data entity @s SelectedItem.components."minecraft:custom_data".soul_embodied run tellraw @s [{"text":"✗ ","color":"red"},{"text":"NOT holding soul weapon","color":"gray"}]

# Show soul type
execute if data entity @s SelectedItem.components."minecraft:custom_data".soul_type run tellraw @s [{"text":"  Soul Type: ","color":"gray"},{"nbt":"SelectedItem.components.\"minecraft:custom_data\".soul_type","entity":"@s","color":"aqua"}]

# Check vanilla stat tracking (show current values)
tellraw @s [{"text":"","color":"gray"}]
tellraw @s [{"text":"Vanilla Stats (from statistics):","color":"yellow"}]
tellraw @s [{"text":"  Dirt mined: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.m_dirt"},"color":"aqua"},{"text":" (rituals.m_dirt)","color":"dark_gray"}]
tellraw @s [{"text":"  Stone mined: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.m_stone"},"color":"aqua"},{"text":" (rituals.m_stone)","color":"dark_gray"}]
tellraw @s [{"text":"  Grass mined: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.m_grass_block"},"color":"aqua"},{"text":" (rituals.m_grass_block)","color":"dark_gray"}]

# Check calculated totals
tellraw @s [{"text":"","color":"gray"}]
tellraw @s [{"text":"Running Totals:","color":"yellow"}]
tellraw @s [{"text":"  Shovel total: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.shovel_mined"},"color":"aqua"}]
tellraw @s [{"text":"  Prev shovel: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.prev_shovel"},"color":"yellow"}]
tellraw @s [{"text":"  Pickaxe total: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.pickaxe_mined"},"color":"aqua"}]
tellraw @s [{"text":"  Prev pickaxe: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.prev_mined"},"color":"yellow"}]

# Check pending XP
tellraw @s [{"text":"","color":"gray"}]
tellraw @s [{"text":"Pending XP: ","color":"yellow"},{"score":{"name":"@s","objective":"rituals.soul_xp_gain"},"color":"green"}]

# Check if scoreboard objectives exist
tellraw @s [{"text":"","color":"gray"}]
tellraw @s [{"text":"Scoreboard Objectives Test:","color":"yellow"}]
execute store success score #test rituals.temp run scoreboard objectives add rituals.m_dirt minecraft.mined:minecraft.dirt
execute if score #test rituals.temp matches 0 run tellraw @s [{"text":"  ✓ rituals.m_dirt exists","color":"green"}]
execute if score #test rituals.temp matches 1 run tellraw @s [{"text":"  ✗ rituals.m_dirt was just created (wasn't loaded!)","color":"red"}]

execute store success score #test rituals.temp run scoreboard objectives add rituals.m_grass_block minecraft.mined:minecraft.grass_block
execute if score #test rituals.temp matches 0 run tellraw @s [{"text":"  ✓ rituals.m_grass_block exists","color":"green"}]
execute if score #test rituals.temp matches 1 run tellraw @s [{"text":"  ✗ rituals.m_grass_block was just created (wasn't loaded!)","color":"red"}]

tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━","color":"gold"}]
tellraw @s [{"text":"Tip: Enable debug mode to see live XP tracking","color":"gray","italic":true}]
tellraw @s [{"text":"[Enable Debug Mode]","color":"aqua","underlined":true,"clickEvent":{"action":"run_command","value":"/function rituals:admin/enable_debug_mode"}}]


