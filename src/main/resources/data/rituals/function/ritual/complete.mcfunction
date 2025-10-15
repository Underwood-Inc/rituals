# ========================================
# Complete ritual successfully
# ========================================

# Store ritual type for feedback
scoreboard players operation #completed_effect rituals.temp = @s rituals.effect

# Remove ritual tags
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.active_ritual,distance=..32] run tag @s remove rituals.active_ritual
execute as @e[type=interaction,tag=rituals.totem,distance=..32] run tag @s remove rituals.growth_ritual
execute as @e[type=interaction,tag=rituals.totem,distance=..32] run tag @s remove rituals.strength_ritual
execute as @e[type=interaction,tag=rituals.totem,distance=..32] run tag @s remove rituals.prosperity_ritual
execute as @e[type=interaction,tag=rituals.totem,distance=..32] run tag @s remove rituals.protection_ritual
execute as @e[type=interaction,tag=rituals.totem,distance=..32] run tag @s remove rituals.healing_ritual

# Reset scores
execute as @e[type=interaction,tag=rituals.totem,distance=..32] run scoreboard players reset @s rituals.timer
execute as @e[type=interaction,tag=rituals.totem,distance=..32] run scoreboard players reset @s rituals.effect

# Success feedback
tellraw @a[distance=..32] [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Ritual completed successfully!","color":"green","bold":true}]
playsound ui.toast.challenge_complete block @a ~ ~ ~ 1.0 1.2
particle end_rod ~ ~1 ~ 3 2 3 0.1 50
particle firework ~ ~1 ~ 1 1 1 0.2 30

