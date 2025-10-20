# Apply prosperity effects in box range using macro parameters
# $neg_h, $neg_v, $box_h, $box_v

# Summon marker at totem position for items to face
summon marker ~ ~ ~ {Tags:["rituals.prosperity_target"]}

# Pull items toward totem (speed based on tier) + particles
$execute if score @s rituals.tier matches 1 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=item,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s run particle dust{color:[1.0,0.8,0.0],scale:0.8} ~ ~0.2 ~ 0.1 0.1 0.1 0 1
$execute if score @s rituals.tier matches 1 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=item,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s facing entity @e[type=marker,tag=rituals.prosperity_target,limit=1,sort=nearest] feet run tp @s ^ ^ ^0.3

$execute if score @s rituals.tier matches 2 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=item,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s run particle dust{color:[1.0,0.8,0.0],scale:0.8} ~ ~0.2 ~ 0.1 0.1 0.1 0 1
$execute if score @s rituals.tier matches 2 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=item,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s facing entity @e[type=marker,tag=rituals.prosperity_target,limit=1,sort=nearest] feet run tp @s ^ ^ ^0.4

$execute if score @s rituals.tier matches 3 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=item,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s run particle dust{color:[1.0,0.8,0.0],scale:0.8} ~ ~0.2 ~ 0.1 0.1 0.1 0 1
$execute if score @s rituals.tier matches 3 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=item,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s facing entity @e[type=marker,tag=rituals.prosperity_target,limit=1,sort=nearest] feet run tp @s ^ ^ ^0.5

$execute if score @s rituals.tier matches 4 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=item,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s run particle dust{color:[1.0,0.8,0.0],scale:0.8} ~ ~0.2 ~ 0.1 0.1 0.1 0 1
$execute if score @s rituals.tier matches 4 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=item,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s facing entity @e[type=marker,tag=rituals.prosperity_target,limit=1,sort=nearest] feet run tp @s ^ ^ ^0.6

$execute if score @s rituals.tier matches 5 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=item,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s run particle dust{color:[1.0,0.8,0.0],scale:0.8} ~ ~0.2 ~ 0.1 0.1 0.1 0 1
$execute if score @s rituals.tier matches 5 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=item,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s facing entity @e[type=marker,tag=rituals.prosperity_target,limit=1,sort=nearest] feet run tp @s ^ ^ ^0.8

$execute if score @s rituals.tier matches 6 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=item,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s run particle dust{color:[1.0,0.8,0.0],scale:0.8} ~ ~0.2 ~ 0.1 0.1 0.1 0 1
$execute if score @s rituals.tier matches 6 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=item,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s facing entity @e[type=marker,tag=rituals.prosperity_target,limit=1,sort=nearest] feet run tp @s ^ ^ ^1.0

# Kill the marker
kill @e[type=marker,tag=rituals.prosperity_target]

# Apply Luck effect to players in range (helps with loot)
$execute if score @s rituals.tier matches 1..2 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] luck 10 0 false
$execute if score @s rituals.tier matches 3..4 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] luck 12 0 false
$execute if score @s rituals.tier matches 5 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] luck 15 1 false
$execute if score @s rituals.tier matches 6 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] luck 20 2 false

