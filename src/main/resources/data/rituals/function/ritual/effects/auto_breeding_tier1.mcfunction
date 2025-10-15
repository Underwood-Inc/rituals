# Tier 1 breeding (3 block range - added 1 block padding)
tellraw @a[distance=..10] [{"text":"[DEBUG] Tier 1 breeding - range 3","color":"aqua"}]

# Cows - ONLY breed if there are at least 2 eligible animals
execute store result score #cow_count rituals.temp if entity @e[type=cow,distance=..3,nbt={Age:0,InLove:0}]
tellraw @a[distance=..10] [{"text":"[DEBUG] Found ","color":"gray"},{"score":{"name":"#cow_count","objective":"rituals.temp"},"color":"yellow"},{"text":" eligible cows","color":"gray"}]
execute if score #cow_count rituals.temp matches 2.. as @e[type=cow,distance=..3,limit=2,sort=nearest,nbt={Age:0,InLove:0}] run data merge entity @s {InLove:600}

# Sheep
execute store result score #sheep_count rituals.temp if entity @e[type=sheep,distance=..3,nbt={Age:0,InLove:0}]
execute if score #sheep_count rituals.temp matches 2.. as @e[type=sheep,distance=..3,limit=2,sort=nearest,nbt={Age:0,InLove:0}] run data merge entity @s {InLove:600}

# Pigs
execute store result score #pig_count rituals.temp if entity @e[type=pig,distance=..3,nbt={Age:0,InLove:0}]
execute if score #pig_count rituals.temp matches 2.. as @e[type=pig,distance=..3,limit=2,sort=nearest,nbt={Age:0,InLove:0}] run data merge entity @s {InLove:600}

# Chickens
execute store result score #chicken_count rituals.temp if entity @e[type=chicken,distance=..3,nbt={Age:0,InLove:0}]
execute if score #chicken_count rituals.temp matches 2.. as @e[type=chicken,distance=..3,limit=2,sort=nearest,nbt={Age:0,InLove:0}] run data merge entity @s {InLove:600}

# Rabbits
execute store result score #rabbit_count rituals.temp if entity @e[type=rabbit,distance=..3,nbt={Age:0,InLove:0}]
execute if score #rabbit_count rituals.temp matches 2.. as @e[type=rabbit,distance=..3,limit=2,sort=nearest,nbt={Age:0,InLove:0}] run data merge entity @s {InLove:600}

