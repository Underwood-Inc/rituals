# Apply XP Harvester effects in box range using macro parameters
# $neg_h, $neg_v, $box_h, $box_v

# Give 1 XP point directly to all players in range (once per second)
# Higher tiers = larger range, not more XP
$execute positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run experience add @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] 1 points

# Visual feedback particles for players receiving XP
$execute positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s run particle minecraft:experience_orb ~ ~1 ~ 0.3 0.5 0.3 0.05 3


