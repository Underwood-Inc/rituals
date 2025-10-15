# ========================================
# Activate Protection Ritual
# ========================================

# Mark all participating totems
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..32] at @s run function rituals:ritual/types/mark_if_iron

# Set effect type on all marked totems
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.active_ritual,distance=..32] run scoreboard players set @s rituals.effect 4

# Visual feedback
tellraw @a[distance=..32] [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Protection Ritual Activated!","color":"blue","bold":true}]
playsound block.enchantment_table.use block @a ~ ~ ~ 1.5 0.5
particle dust{color:[0.5,0.7,1.0],scale:1.5} ~ ~2 ~ 5 2 5 0.1 100

scoreboard players set @s rituals.timer 0

