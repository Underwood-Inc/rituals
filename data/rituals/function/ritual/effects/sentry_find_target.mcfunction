# Find nearest hostile mob in sentry range using macro
# $neg_h, $neg_v, $box_h, $box_v

# Tag nearest hostile mob as target (positioned at corner, use dx/dy/dz for box)
$execute positioned ~$(neg_h) ~$(neg_v) ~$(neg_h) as @e[type=#rituals:hostile_mobs,dx=$(box_h),dy=$(box_v),dz=$(box_h),limit=1,sort=nearest] run tag @s add rituals.sentry_target

# If we found a target, fire at it
execute if entity @e[tag=rituals.sentry_target,limit=1] run function rituals:ritual/effects/sentry_fire

# Clean up target tag
tag @e[tag=rituals.sentry_target] remove rituals.sentry_target

