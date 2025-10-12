# ========================================
# Totem Rituals Datapack - Tick Function
# ========================================
# This function runs every game tick (20 times per second)

# Reduce placement cooldown
scoreboard players remove @a[scores={rituals.temp=1..}] rituals.temp 1

# Check for totem placement (check for both int and byte for compatibility)
execute as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{rituals_totem:1}}}}] at @s run function rituals:totem/check_place
execute as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{rituals_totem:1b}}}}] at @s run function rituals:totem/check_place

# Update all active totems
execute as @e[type=interaction,tag=rituals.totem] at @s run function rituals:totem/update

# Check for ritual activation
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item] at @s run function rituals:ritual/check_activation

# Update active rituals
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.active_ritual] at @s run function rituals:ritual/update_active

# Update sentry projectiles
execute as @e[type=marker,tag=rituals.sentry_projectile] at @s run function rituals:ritual/effects/sentry_projectile_motion

# Handle menu triggers
function rituals:menu/handler

