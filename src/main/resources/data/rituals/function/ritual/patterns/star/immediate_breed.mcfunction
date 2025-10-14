# Immediate breeding on activation using tier-based range
# $h_range - horizontal range from macro

# Guarantee at least one successful breed of each animal type in range
$execute as @e[type=cow,distance=..$(h_range),limit=2,sort=nearest,nbt={InLove:0,Age:0}] run data merge entity @s {InLove:600}
$execute as @e[type=sheep,distance=..$(h_range),limit=2,sort=nearest,nbt={InLove:0,Age:0}] run data merge entity @s {InLove:600}
$execute as @e[type=pig,distance=..$(h_range),limit=2,sort=nearest,nbt={InLove:0,Age:0}] run data merge entity @s {InLove:600}
$execute as @e[type=chicken,distance=..$(h_range),limit=2,sort=nearest,nbt={InLove:0,Age:0}] run data merge entity @s {InLove:600}
$execute as @e[type=rabbit,distance=..$(h_range),limit=2,sort=nearest,nbt={InLove:0,Age:0}] run data merge entity @s {InLove:600}

# Show immediate breeding feedback
particle minecraft:heart ~ ~2 ~ 8 2 8 0.3 50 force

