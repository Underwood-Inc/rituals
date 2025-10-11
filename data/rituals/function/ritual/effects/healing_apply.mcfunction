# Apply healing effects in box range using macro parameters
# $neg_h, $neg_v, $box_h, $box_v

# Tier 1-2: Regeneration I (10 seconds)
$execute if score @s rituals.tier matches 1..2 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] regeneration 10 0 false
$execute if score @s rituals.tier matches 1..2 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @e[type=#rituals:healable_mobs,dx=$(box_h),dy=$(box_v),dz=$(box_h)] regeneration 10 0

# Tier 3-4: Regeneration II (12 seconds)
$execute if score @s rituals.tier matches 3..4 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] regeneration 12 1 false
$execute if score @s rituals.tier matches 3..4 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @e[type=#rituals:healable_mobs,dx=$(box_h),dy=$(box_v),dz=$(box_h)] regeneration 12 1

# Tier 5: Regeneration III + Absorption I (15 seconds regen, 30 seconds absorption)
$execute if score @s rituals.tier matches 5 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] regeneration 15 2 false
$execute if score @s rituals.tier matches 5 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @e[type=#rituals:healable_mobs,dx=$(box_h),dy=$(box_v),dz=$(box_h)] regeneration 15 2
$execute if score @s rituals.tier matches 5 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] absorption 30 0 false

# Tier 6: Regeneration IV + Absorption II + Health Boost I (20 seconds regen, 60 seconds others)
$execute if score @s rituals.tier matches 6 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] regeneration 20 3 false
$execute if score @s rituals.tier matches 6 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @e[type=#rituals:healable_mobs,dx=$(box_h),dy=$(box_v),dz=$(box_h)] regeneration 20 3
$execute if score @s rituals.tier matches 6 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] absorption 60 1 false
$execute if score @s rituals.tier matches 6 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] health_boost 120 0 false

# Particles on affected entities
$positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s run particle dust{color:[1.0,0.5,0.8],scale:1.0} ~ ~1 ~ 0.3 0.5 0.3 0 3
$positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=#rituals:healable_mobs,dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s run particle dust{color:[1.0,0.5,0.8],scale:1.0} ~ ~0.5 ~ 0.2 0.3 0.2 0 2

