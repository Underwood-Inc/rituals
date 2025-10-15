# Tier 1 breeding (3 block range - added 1 block padding)
# Debug output is handled by parent function

# Cows - ONLY breed if there are at least 2 eligible animals
execute store result score #cow_count rituals.temp if entity @e[type=cow,distance=..3,nbt={Age:0,InLove:0}]
# Debug output removed - controlled by parent
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

