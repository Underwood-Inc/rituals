# Apply strength effects in box range using macro parameters
# $neg_h, $neg_v, $box_h, $box_v

# Tier 1-2: Strength I, Resistance I (10 seconds)
$execute if score @s rituals.tier matches 1..2 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] strength 10 0 false
$execute if score @s rituals.tier matches 1..2 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] resistance 10 0 false

# Tier 3: Strength II, Resistance I (12 seconds)
$execute if score @s rituals.tier matches 3 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] strength 12 1 false
$execute if score @s rituals.tier matches 3 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] resistance 12 0 false

# Tier 4: Strength II, Resistance II (15 seconds)
$execute if score @s rituals.tier matches 4 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] strength 15 1 false
$execute if score @s rituals.tier matches 4 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] resistance 15 1 false

# Tier 5: Strength III, Resistance II (20 seconds)
$execute if score @s rituals.tier matches 5 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] strength 20 2 false
$execute if score @s rituals.tier matches 5 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] resistance 20 1 false

# Tier 6: Strength IV, Resistance III (30 seconds)
$execute if score @s rituals.tier matches 6 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] strength 30 3 false
$execute if score @s rituals.tier matches 6 positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) run effect give @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] resistance 30 2 false

# Particles on affected players
$positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @a[dx=$(box_h),dy=$(box_v),dz=$(box_h)] at @s run particle crit ~ ~1 ~ 0.3 0.5 0.3 0.1 3

