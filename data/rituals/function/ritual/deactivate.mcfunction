# ========================================
# Deactivate ritual (interrupted)
# ========================================

# Remove ritual tags from all totems
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.active_ritual,distance=..32] run tag @s remove rituals.active_ritual
execute as @e[type=interaction,tag=rituals.totem,distance=..32] run tag @s remove rituals.growth_ritual
execute as @e[type=interaction,tag=rituals.totem,distance=..32] run tag @s remove rituals.strength_ritual
execute as @e[type=interaction,tag=rituals.totem,distance=..32] run tag @s remove rituals.prosperity_ritual
execute as @e[type=interaction,tag=rituals.totem,distance=..32] run tag @s remove rituals.protection_ritual
execute as @e[type=interaction,tag=rituals.totem,distance=..32] run tag @s remove rituals.healing_ritual

# Reset timers and effect type
scoreboard players reset @s rituals.timer
scoreboard players reset @s rituals.effect

# Feedback
tellraw @a[distance=..32] [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"Ritual interrupted!","color":"red","bold":false}]
playsound entity.wither.hurt block @a ~ ~ ~ 0.5 2.0
particle smoke ~ ~1 ~ 2 1 2 0.05 30

