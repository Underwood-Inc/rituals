# ========================================
# Activate Sentry Ritual
# ========================================

# Mark all participating totems
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..32] at @s run function rituals:ritual/types/mark_if_arrow

# Set effect type on all marked totems
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.active_ritual,distance=..32] run scoreboard players set @s rituals.effect 6

# Visual feedback
tellraw @a[distance=..32] [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Sentry Totem Activated!","color":"red","bold":true}]
playsound entity.arrow.shoot block @a ~ ~ ~ 1.5 0.8
playsound block.beacon.activate block @a ~ ~ ~ 0.5 1.5
particle flame ~ ~2 ~ 0.5 1 0.5 0.1 50
particle enchant ~ ~2 ~ 1 1 1 0.3 100

# Grant advancement
advancement grant @a[distance=..32] only rituals:guide/first_ritual

scoreboard players set @s rituals.timer 0

