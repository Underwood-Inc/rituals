# Actually place the totem at current position
# Get next ID
scoreboard players add #global_totem_id rituals.id 1

# Summon totem interaction entity (for clicking/breaking)
# Short totems = 1.5 blocks tall (like fences), tall totems = 2.5 blocks
# Width set to 1.2f for easier interaction (larger hitbox for breaking)
execute unless score @p rituals.temp matches 1 run summon interaction ~ ~ ~ {width:1.2f,height:2.5f,Tags:["rituals.totem","rituals.new_totem"],response:1b}
execute if score @p rituals.temp matches 1 run summon interaction ~ ~ ~ {width:1.2f,height:1.5f,Tags:["rituals.totem","rituals.new_totem"],response:1b}

# Add barrier for collision (invisible, unbreakable in survival)
# Short totems: ONE barrier at ~ (1 block tall: Y=0 to Y=1)
# Tall totems: TWO barriers at ~ and ~1 (2 blocks tall: Y=0 to Y=2)
setblock ~ ~ ~ barrier
execute unless score @p rituals.temp matches 1 run setblock ~ ~1 ~ barrier

# Initialize
execute as @e[type=interaction,tag=rituals.new_totem,limit=1,sort=nearest] run function rituals:totem/initialize

# Remove item from player
execute as @p if entity @s[gamemode=!creative] run item modify entity @s weapon.mainhand rituals:decrement

# Effects
playsound block.stone.place block @a ~ ~ ~ 1.0 0.8
particle happy_villager ~ ~1 ~ 0.3 0.5 0.3 0 10

tellraw @p [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Totem placed!","color":"green"}]
advancement grant @p only rituals:guide/place_totem

# Reset distance
scoreboard players set @p rituals.distance 0

