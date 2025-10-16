# ========================================
# Rituals Datapack - Tick Function
# ========================================
# This function runs every game tick (20 times per second)

# Reduce placement cooldown
scoreboard players remove @a[scores={rituals.temp=1..}] rituals.temp 1

# Check for totem placement (check for both int and byte for compatibility)
execute as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{rituals_totem:1}}}}] at @s run function rituals:totem/check_place
execute as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{rituals_totem:1b}}}}] at @s run function rituals:totem/check_place

# Check for illegally crafted totems (recipe progression enforcement)
execute as @a run function rituals:player/check_illegal_totem

# Update all active totems
execute as @e[type=interaction,tag=rituals.totem] at @s run function rituals:totem/update

# Check for ritual activation - use fire sacrifice or auto mode based on config
execute if score #fire_sacrifice_mode rituals.data matches 1 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item] at @s run function rituals:ritual/fire/check_sacrifice
execute if score #fire_sacrifice_mode rituals.data matches 0 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item] at @s run function rituals:ritual/check_activation

# Update active rituals
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.active_ritual] at @s run function rituals:ritual/update_active

# Update sentry projectiles
execute as @e[type=marker,tag=rituals.sentry_projectile] at @s run function rituals:ritual/effects/sentry_projectile_motion

# Check for ritual hammer usage
# execute as @a[scores={rituals.hammer_use=1..}] at @s run function rituals:hammer/check_use

# Handle menu triggers
function rituals:menu/handler

# Show kiwi mode indicator
execute if score #kiwi_mode rituals.data matches 1 run title @a actionbar [{"text":"🥝 ","color":"green"},{"text":"Kiwi Mode Active","color":"yellow"}]

