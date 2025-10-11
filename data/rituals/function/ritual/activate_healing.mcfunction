# ========================================
# Activate Healing Ritual
# ========================================

# Mark all participating totems
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..32] at @s run function rituals:ritual/types/mark_if_star

# Set effect type
scoreboard players set @s rituals.effect 5

# Visual feedback
tellraw @a[distance=..32] [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"Healing Ritual Activated!","color":"light_purple","bold":true}]
playsound block.enchantment_table.use block @a ~ ~ ~ 1.5 1.5
particle dust{color:[1.0,0.5,0.8],scale:2.0} ~ ~2 ~ 5 2 5 0.1 100

scoreboard players set @s rituals.timer 0

