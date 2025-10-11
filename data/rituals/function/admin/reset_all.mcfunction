# ========================================
# Reset All Ritual States
# ========================================
# Deactivates all active rituals without removing totems

# Remove all ritual tags
execute as @e[type=interaction,tag=rituals.totem] run tag @s remove rituals.active_ritual
execute as @e[type=interaction,tag=rituals.totem] run tag @s remove rituals.growth_ritual
execute as @e[type=interaction,tag=rituals.totem] run tag @s remove rituals.strength_ritual
execute as @e[type=interaction,tag=rituals.totem] run tag @s remove rituals.prosperity_ritual
execute as @e[type=interaction,tag=rituals.totem] run tag @s remove rituals.protection_ritual
execute as @e[type=interaction,tag=rituals.totem] run tag @s remove rituals.healing_ritual

# Reset scores
scoreboard players reset @e[type=interaction,tag=rituals.totem] rituals.timer
scoreboard players reset @e[type=interaction,tag=rituals.totem] rituals.effect

tellraw @a [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"All rituals have been reset.","color":"yellow","bold":false}]

