# Apply protection effects in box range using macro parameters
# $neg_h, $neg_v, $box_h, $box_v

# Apply Fire Resistance to players (protect from mobs like blazes)
$execute if score @s rituals.tier matches 1..2 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] fire_resistance 10 0 false
$execute if score @s rituals.tier matches 3..4 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] fire_resistance 15 0 false
$execute if score @s rituals.tier matches 5..6 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] fire_resistance 20 0 false

# Damage hostile mobs (damage scales with tier)
$execute if score @s rituals.tier matches 1 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=#rituals:hostile_mobs,dx=$(box_h),dy=$(box_v),dz=$(box_h)] run damage @s 2.0 magic
$execute if score @s rituals.tier matches 2 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=#rituals:hostile_mobs,dx=$(box_h),dy=$(box_v),dz=$(box_h)] run damage @s 3.0 magic
$execute if score @s rituals.tier matches 3 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=#rituals:hostile_mobs,dx=$(box_h),dy=$(box_v),dz=$(box_h)] run damage @s 4.0 magic
$execute if score @s rituals.tier matches 4 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=#rituals:hostile_mobs,dx=$(box_h),dy=$(box_v),dz=$(box_h)] run damage @s 5.0 magic
$execute if score @s rituals.tier matches 5 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=#rituals:hostile_mobs,dx=$(box_h),dy=$(box_v),dz=$(box_h)] run damage @s 7.0 magic
$execute if score @s rituals.tier matches 6 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=#rituals:hostile_mobs,dx=$(box_h),dy=$(box_v),dz=$(box_h)] run damage @s 10.0 magic

# Particles on damaged mobs
$positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=#rituals:hostile_mobs,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s run particle dust{color:[0.5,0.7,1.0],scale:1.0} ~ ~1 ~ 0.3 0.5 0.3 0 5

