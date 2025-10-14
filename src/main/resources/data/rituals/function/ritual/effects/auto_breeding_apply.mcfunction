# Apply breeding to animals in range
# $h_range - horizontal range from macro

# Cows
$execute as @e[type=cow,distance=..$(h_range),limit=2,sort=random,nbt={InLove:0,Age:0}] run data merge entity @s {InLove:600}

# Sheep
$execute as @e[type=sheep,distance=..$(h_range),limit=2,sort=random,nbt={InLove:0,Age:0}] run data merge entity @s {InLove:600}

# Pigs
$execute as @e[type=pig,distance=..$(h_range),limit=2,sort=random,nbt={InLove:0,Age:0}] run data merge entity @s {InLove:600}

# Chickens
$execute as @e[type=chicken,distance=..$(h_range),limit=2,sort=random,nbt={InLove:0,Age:0}] run data merge entity @s {InLove:600}

# Rabbits
$execute as @e[type=rabbit,distance=..$(h_range),limit=2,sort=random,nbt={InLove:0,Age:0}] run data merge entity @s {InLove:600}

# Horses (tamed only)
$execute as @e[type=horse,distance=..$(h_range),limit=2,sort=random,nbt={InLove:0,Age:0,Tame:true}] run data merge entity @s {InLove:600}

# Wolves (tamed only)
$execute as @e[type=wolf,distance=..$(h_range),limit=2,sort=random,nbt={InLove:0,Age:0,Owner:[I;]}] run data merge entity @s {InLove:600}

# Cats (tamed only)
$execute as @e[type=cat,distance=..$(h_range),limit=2,sort=random,nbt={InLove:0,Age:0,Owner:[I;]}] run data merge entity @s {InLove:600}

