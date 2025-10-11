# Actually place the totem at current position
# Get next ID
scoreboard players add #global_totem_id rituals.id 1

# Summon totem with larger hitbox
summon interaction ~ ~ ~ {width:1.2f,height:2.5f,Tags:["rituals.totem","rituals.new_totem"],response:1b}

# Initialize
execute as @e[type=interaction,tag=rituals.new_totem,limit=1,sort=nearest] run function rituals:totem/initialize

# Remove item from player
execute as @p if entity @s[gamemode=!creative] run item modify entity @s weapon.mainhand rituals:decrement

# Effects
playsound block.stone.place block @a ~ ~ ~ 1.0 0.8
particle happy_villager ~ ~1 ~ 0.3 0.5 0.3 0 10

tellraw @p [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"Totem placed!","color":"green"}]
advancement grant @p only rituals:guide/place_totem

# Reset distance
scoreboard players set @p rituals.distance 0

