# Apply prosperity effects in box range using macro parameters
# $neg_h, $neg_v, $box_h, $box_v

# Pull items toward nearest player (speed based on tier) + particles
$execute if score @s rituals.tier matches 1 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=item,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s run particle dust{color:[1.0,0.8,0.0],scale:0.8} ~ ~0.2 ~ 0.1 0.1 0.1 0 1
$execute if score @s rituals.tier matches 1 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=item,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s facing entity @p feet run tp @s ^ ^ ^0.3

$execute if score @s rituals.tier matches 2 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=item,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s run particle dust{color:[1.0,0.8,0.0],scale:0.8} ~ ~0.2 ~ 0.1 0.1 0.1 0 1
$execute if score @s rituals.tier matches 2 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=item,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s facing entity @p feet run tp @s ^ ^ ^0.4

$execute if score @s rituals.tier matches 3 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=item,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s run particle dust{color:[1.0,0.8,0.0],scale:0.8} ~ ~0.2 ~ 0.1 0.1 0.1 0 1
$execute if score @s rituals.tier matches 3 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=item,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s facing entity @p feet run tp @s ^ ^ ^0.5

$execute if score @s rituals.tier matches 4 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=item,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s run particle dust{color:[1.0,0.8,0.0],scale:0.8} ~ ~0.2 ~ 0.1 0.1 0.1 0 1
$execute if score @s rituals.tier matches 4 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=item,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s facing entity @p feet run tp @s ^ ^ ^0.6

$execute if score @s rituals.tier matches 5 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=item,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s run particle dust{color:[1.0,0.8,0.0],scale:0.8} ~ ~0.2 ~ 0.1 0.1 0.1 0 1
$execute if score @s rituals.tier matches 5 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=item,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s facing entity @p feet run tp @s ^ ^ ^0.8

$execute if score @s rituals.tier matches 6 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=item,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s run particle dust{color:[1.0,0.8,0.0],scale:0.8} ~ ~0.2 ~ 0.1 0.1 0.1 0 1
$execute if score @s rituals.tier matches 6 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=item,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s facing entity @p feet run tp @s ^ ^ ^1.0

# Apply Luck effect to players in range (helps with loot)
$execute if score @s rituals.tier matches 1..2 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] luck 10 0 false
$execute if score @s rituals.tier matches 3..4 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] luck 12 0 false
$execute if score @s rituals.tier matches 5 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] luck 15 1 false
$execute if score @s rituals.tier matches 6 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] luck 20 2 false

# Occasionally spawn experience orbs (10% chance every check, value based on tier)
execute if predicate rituals:random_10_percent if score @s rituals.tier matches 1..2 run summon experience_orb ~ ~1 ~ {Value:2}
execute if predicate rituals:random_10_percent if score @s rituals.tier matches 3..4 run summon experience_orb ~ ~1 ~ {Value:4}
execute if predicate rituals:random_10_percent if score @s rituals.tier matches 5 run summon experience_orb ~ ~1 ~ {Value:7}
execute if predicate rituals:random_10_percent if score @s rituals.tier matches 6 run summon experience_orb ~ ~1 ~ {Value:10}

