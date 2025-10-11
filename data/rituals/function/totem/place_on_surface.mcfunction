# Place totem on top of the block we're looking at
# Center on block grid
execute align xyz positioned ~0.5 ~1 ~0.5 if block ~ ~ ~ minecraft:air run function rituals:totem/place_at_target
execute align xyz positioned ~0.5 ~1 ~0.5 if block ~ ~ ~ minecraft:cave_air run function rituals:totem/place_at_target
execute align xyz positioned ~0.5 ~1 ~0.5 if block ~ ~ ~ minecraft:void_air run function rituals:totem/place_at_target

