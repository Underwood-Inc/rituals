# ========================================
# Activate Prosperity Ritual
# ========================================

# Mark all participating totems
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..32] at @s run function rituals:ritual/types/mark_if_gold

# Set effect type on all marked totems
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.active_ritual,distance=..32] run scoreboard players set @s rituals.effect 3

# Update display name for all marked totems
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.active_ritual,distance=..32] run function rituals:totem/update_display_name

# Visual feedback
tellraw @a[distance=..32] [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"Prosperity Ritual Activated!","color":"yellow","bold":true}]
playsound block.enchantment_table.use block @a ~ ~ ~ 1.5 1.0
particle dust{color:[1.0,0.8,0.0],scale:1.5} ~ ~2 ~ 5 2 5 0.1 100

scoreboard players set @s rituals.timer 0

