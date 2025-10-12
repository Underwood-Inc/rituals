# ========================================
# Activate Strength Ritual
# ========================================

# Mark all participating totems
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..32] at @s run function rituals:ritual/types/mark_if_diamond

# Set effect type on all marked totems
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.active_ritual,distance=..32] run scoreboard players set @s rituals.effect 2

# Visual feedback
tellraw @a[distance=..32] [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"Strength Ritual Activated!","color":"aqua","bold":true}]
playsound block.enchantment_table.use block @a ~ ~ ~ 1.5 0.8
particle crit ~ ~2 ~ 5 2 5 0.1 100

scoreboard players set @s rituals.timer 0

