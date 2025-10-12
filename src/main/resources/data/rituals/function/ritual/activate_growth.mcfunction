# ========================================
# Activate Growth Ritual
# ========================================

# Mark all participating totems
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..32] at @s run function rituals:ritual/types/mark_if_emerald

# Set effect type on all marked totems
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.active_ritual,distance=..32] run scoreboard players set @s rituals.effect 1

# Visual feedback
tellraw @a[distance=..32] [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"Growth Ritual Activated!","color":"green","bold":true}]
playsound block.enchantment_table.use block @a ~ ~ ~ 1.5 1.2
particle happy_villager ~ ~2 ~ 5 2 5 0.1 100

# Grant advancement to nearby players
advancement grant @a[distance=..32] only rituals:guide/first_ritual

# Initialize ritual timer
scoreboard players set @s rituals.timer 0

