# ========================================
# DEBUG: Soul XP Tracking Diagnostics
# ========================================
# Run with: /function rituals:soul/debug_tracking
# Reports exactly where the tracking chain breaks

tellraw @s [{"text":"=== SOUL XP DEBUG ===","color":"gold","bold":true}]

# --- CHECK 1: Is player holding a soul weapon? ---
execute store result score #dbg_soul rituals.soul_temp run data get entity @s SelectedItem.components."minecraft:custom_data".soul_embodied
tellraw @s [{"text":"[1] soul_embodied = ","color":"gray"},{"score":{"name":"#dbg_soul","objective":"rituals.soul_temp"},"color":"yellow"},{"text":" (need 1)","color":"dark_gray"}]

# --- CHECK 2: Do the tracking scoreboards exist? ---
execute store success score #dbg_obj rituals.soul_temp run scoreboard players get @s rituals.m_dirt
tellraw @s [{"text":"[2] rituals.m_dirt exists = ","color":"gray"},{"score":{"name":"#dbg_obj","objective":"rituals.soul_temp"},"color":"yellow"},{"text":" (need 1)","color":"dark_gray"}]

# --- CHECK 3: What is the player's dirt mined count? ---
execute store result score #dbg_dirt rituals.soul_temp run scoreboard players get @s rituals.m_dirt
tellraw @s [{"text":"[3] dirt mined count = ","color":"gray"},{"score":{"name":"#dbg_dirt","objective":"rituals.soul_temp"},"color":"yellow"}]

# --- CHECK 4: Does rituals.soul_temp exist? ---
execute store success score #dbg_temp rituals.soul_temp run scoreboard players get #total rituals.soul_temp
tellraw @s [{"text":"[4] rituals.soul_temp exists = ","color":"gray"},{"score":{"name":"#dbg_temp","objective":"rituals.soul_temp"},"color":"yellow"},{"text":" (need 1)","color":"dark_gray"}]

# --- CHECK 5: Does rituals.data have constants? ---
execute store result score #dbg_const rituals.soul_temp run scoreboard players get #2 rituals.data
tellraw @s [{"text":"[5] #2 rituals.data = ","color":"gray"},{"score":{"name":"#dbg_const","objective":"rituals.soul_temp"},"color":"yellow"},{"text":" (need 2)","color":"dark_gray"}]
execute store result score #dbg_const rituals.soul_temp run scoreboard players get #100 rituals.data
tellraw @s [{"text":"[5b] #100 rituals.data = ","color":"gray"},{"score":{"name":"#dbg_const","objective":"rituals.soul_temp"},"color":"yellow"},{"text":" (need 100)","color":"dark_gray"}]

# --- CHECK 6: blocks_initialized tag? ---
execute if entity @s[tag=rituals.blocks_initialized] run tellraw @s [{"text":"[6] blocks_initialized = ","color":"gray"},{"text":"YES","color":"green"}]
execute unless entity @s[tag=rituals.blocks_initialized] run tellraw @s [{"text":"[6] blocks_initialized = ","color":"gray"},{"text":"NO","color":"red"}]

# --- CHECK 7: prev_blocks score? ---
execute store result score #dbg_prev rituals.soul_temp run scoreboard players get @s rituals.prev_blocks
tellraw @s [{"text":"[7] prev_blocks = ","color":"gray"},{"score":{"name":"#dbg_prev","objective":"rituals.soul_temp"},"color":"yellow"}]

# --- CHECK 8: Run track_blocks and show result ---
scoreboard players set #total rituals.soul_temp 0
function rituals:soul/track_blocks/shovel
tellraw @s [{"text":"[8] shovel #total after sum = ","color":"gray"},{"score":{"name":"#total","objective":"rituals.soul_temp"},"color":"yellow"}]

# --- CHECK 9: What would xp_gain be? ---
scoreboard players operation #dbg_xp rituals.soul_temp = #total rituals.soul_temp
scoreboard players operation #dbg_xp rituals.soul_temp -= @s rituals.prev_blocks
tellraw @s [{"text":"[9] xp_gain (total - prev) = ","color":"gray"},{"score":{"name":"#dbg_xp","objective":"rituals.soul_temp"},"color":"yellow"}]

# --- CHECK 10: Item's current soul data ---
execute store result score #dbg_xp rituals.soul_temp run data get entity @s SelectedItem.components."minecraft:custom_data".soul_xp
execute store result score #dbg_lvl rituals.soul_temp run data get entity @s SelectedItem.components."minecraft:custom_data".soul_level
execute store result score #dbg_cap rituals.soul_temp run data get entity @s SelectedItem.components."minecraft:custom_data".soul_level_cap
tellraw @s [{"text":"[10] Item: xp=","color":"gray"},{"score":{"name":"#dbg_xp","objective":"rituals.soul_temp"},"color":"yellow"},{"text":" level=","color":"gray"},{"score":{"name":"#dbg_lvl","objective":"rituals.soul_temp"},"color":"yellow"},{"text":" cap=","color":"gray"},{"score":{"name":"#dbg_cap","objective":"rituals.soul_temp"},"color":"yellow"}]

# --- CHECK 11: had_soul_weapon tag? ---
execute if entity @s[tag=rituals.had_soul_weapon] run tellraw @s [{"text":"[11] had_soul_weapon = ","color":"gray"},{"text":"YES","color":"green"}]
execute unless entity @s[tag=rituals.had_soul_weapon] run tellraw @s [{"text":"[11] had_soul_weapon = ","color":"gray"},{"text":"NO","color":"red"}]

# --- CHECK 12: Does the item modifier exist? Test it ---
data modify storage rituals:temp soul_update set value {soul_xp:0}
execute store success score #dbg_mod rituals.soul_temp run item modify entity @s weapon.mainhand rituals:update_soul_xp
tellraw @s [{"text":"[12] item modify success = ","color":"gray"},{"score":{"name":"#dbg_mod","objective":"rituals.soul_temp"},"color":"yellow"},{"text":" (need 1)","color":"dark_gray"}]
data remove storage rituals:temp soul_update

tellraw @s [{"text":"=== END DEBUG ===","color":"gold","bold":true}]
tellraw @s [{"text":"Break 1 dirt block then run this again to compare check [3] and [8]","color":"aqua"}]
