# ========================================
# Scrying Glass - Check Level Up (Direct)
# ========================================
# Checks if synced XP causes level up, modifies offhand directly

# Get current level and cap from offhand
execute store result score #current_level rituals.soul_temp run data get entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".soul_level
execute store result score #level_cap rituals.soul_temp run data get entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".soul_level_cap

# Calculate XP needed (level * 10)
scoreboard players operation #xp_needed rituals.soul_temp = #current_level rituals.soul_temp
scoreboard players operation #xp_needed rituals.soul_temp *= #10 rituals.data

# Check if level up needed
execute if score #current_xp rituals.soul_temp >= #xp_needed rituals.soul_temp if score #current_level rituals.soul_temp < #level_cap rituals.soul_temp run function rituals:soul/scrying_do_levelup_direct

