# Tier 6 breeding (8 block range - added 1 block padding)
execute store result score #cow_count rituals.temp if entity @e[type=cow,distance=..8,nbt={Age:0,InLove:0}]
execute if score #cow_count rituals.temp matches 2.. as @e[type=cow,distance=..8,limit=2,sort=nearest,nbt={Age:0,InLove:0}] run data merge entity @s {InLove:600}
execute store result score #sheep_count rituals.temp if entity @e[type=sheep,distance=..8,nbt={Age:0,InLove:0}]
execute if score #sheep_count rituals.temp matches 2.. as @e[type=sheep,distance=..8,limit=2,sort=nearest,nbt={Age:0,InLove:0}] run data merge entity @s {InLove:600}
execute store result score #pig_count rituals.temp if entity @e[type=pig,distance=..8,nbt={Age:0,InLove:0}]
execute if score #pig_count rituals.temp matches 2.. as @e[type=pig,distance=..8,limit=2,sort=nearest,nbt={Age:0,InLove:0}] run data merge entity @s {InLove:600}
execute store result score #chicken_count rituals.temp if entity @e[type=chicken,distance=..8,nbt={Age:0,InLove:0}]
execute if score #chicken_count rituals.temp matches 2.. as @e[type=chicken,distance=..8,limit=2,sort=nearest,nbt={Age:0,InLove:0}] run data merge entity @s {InLove:600}
execute store result score #rabbit_count rituals.temp if entity @e[type=rabbit,distance=..8,nbt={Age:0,InLove:0}]
execute if score #rabbit_count rituals.temp matches 2.. as @e[type=rabbit,distance=..8,limit=2,sort=nearest,nbt={Age:0,InLove:0}] run data merge entity @s {InLove:600}

