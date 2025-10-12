# Damage all hostile mobs in the box range
# $neg_h, $neg_v, $box_h, $box_v

# Find and damage all hostile mobs
$execute positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=#rituals:hostile_mobs,dx=$(box_h),dy=$(box_v),dz=$(box_h)] run function rituals:ritual/effects/protection_damage_mob

