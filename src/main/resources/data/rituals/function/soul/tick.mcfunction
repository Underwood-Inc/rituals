# ========================================
# Soul Embodiment - Tick Function
# ========================================
# Runs every tick to track XP gains on soul weapons
# Called from the main tick.mcfunction

# Debug: Check if tick is running (only once per second)
execute if entity @a[tag=rituals.debug] if score #tick_counter rituals.temp matches 20.. run tellraw @a[tag=rituals.debug,limit=1] [{"text":"[Soul Tick] ","color":"dark_gray"},{"text":"Soul tick running...","color":"gray"}]
execute if score #tick_counter rituals.temp matches 20.. run scoreboard players set #tick_counter rituals.temp 0
scoreboard players add #tick_counter rituals.temp 1

# Check each player holding a soul-embodied item in their mainhand
execute as @a[gamemode=!spectator] at @s if data entity @s SelectedItem.components."minecraft:custom_data".soul_embodied run function rituals:soul/check_player_action

# Apply buff effects to players holding soul weapons
execute as @a[gamemode=!spectator] at @s if data entity @s SelectedItem.components."minecraft:custom_data".soul_embodied run function rituals:soul/buffs/apply_effects

# Remove effects from players NOT holding soul weapons (who previously were)
execute as @a[gamemode=!spectator,tag=rituals.had_soul_weapon] at @s unless data entity @s SelectedItem.components."minecraft:custom_data".soul_embodied run function rituals:soul/buffs/remove_effects
# Remove init tags so they re-initialize when picking up soul weapon again (prevents accumulated XP)
execute as @a[gamemode=!spectator,tag=rituals.had_soul_weapon] unless data entity @s SelectedItem.components."minecraft:custom_data".soul_embodied run tag @s remove rituals.blocks_initialized
execute as @a[gamemode=!spectator,tag=rituals.had_soul_weapon] unless data entity @s SelectedItem.components."minecraft:custom_data".soul_embodied run tag @s remove rituals.kills_initialized
execute as @a[gamemode=!spectator,tag=rituals.had_soul_weapon] unless data entity @s SelectedItem.components."minecraft:custom_data".soul_embodied run tag @s remove rituals.had_soul_weapon

# Tag players currently holding soul weapons
execute as @a[gamemode=!spectator] if data entity @s SelectedItem.components."minecraft:custom_data".soul_embodied run tag @s add rituals.had_soul_weapon

# Decrement notification cooldowns
scoreboard players remove @a[scores={rituals.soul_notify_cd=1..}] rituals.soul_notify_cd 1

# Decrement scrying glass cooldown
scoreboard players remove @a[scores={rituals.scrying_cd=1..}] rituals.scrying_cd 1

# Decrement soul speak cooldown
scoreboard players remove @a[scores={rituals.soul_speak_cd=1..}] rituals.soul_speak_cd 1

# Random quirky comments (every ~30 seconds on average per player)
execute as @a[gamemode=!spectator] at @s if data entity @s SelectedItem.components."minecraft:custom_data".soul_embodied run function rituals:soul/comments/try_speak
