# Apply motion to projectile based on tier

# Base motion is tier-dependent (gets faster at higher tiers)
# Using small values since fireball motion is already fast

execute if score @e[type=interaction,tag=rituals.totem,tag=rituals.active_ritual,limit=1,sort=nearest] rituals.tier matches 1 run data merge entity @s {power:[0.0,-0.02,0.0]}
execute if score @e[type=interaction,tag=rituals.totem,tag=rituals.active_ritual,limit=1,sort=nearest] rituals.tier matches 2 run data merge entity @s {power:[0.0,-0.03,0.0]}
execute if score @e[type=interaction,tag=rituals.totem,tag=rituals.active_ritual,limit=1,sort=nearest] rituals.tier matches 3 run data merge entity @s {power:[0.0,-0.04,0.0]}
execute if score @e[type=interaction,tag=rituals.totem,tag=rituals.active_ritual,limit=1,sort=nearest] rituals.tier matches 4 run data merge entity @s {power:[0.0,-0.05,0.0]}
execute if score @e[type=interaction,tag=rituals.totem,tag=rituals.active_ritual,limit=1,sort=nearest] rituals.tier matches 5 run data merge entity @s {power:[0.0,-0.06,0.0]}
execute if score @e[type=interaction,tag=rituals.totem,tag=rituals.active_ritual,limit=1,sort=nearest] rituals.tier matches 6 run data merge entity @s {power:[0.0,-0.07,0.0]}

