# Apply XP Harvester effects in box range using macro parameters
# $neg_h, $neg_v, $box_h, $box_v, $xp_amount

# Give XP points directly to all players in range (once per second)
# Higher tiers = larger range AND more XP per second
$execute positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run experience add @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] $(xp_amount) points

# Visual feedback particles for players receiving XP
$execute positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s run particle minecraft:glow ~ ~1 ~ 0.3 0.5 0.3 0.05 3


