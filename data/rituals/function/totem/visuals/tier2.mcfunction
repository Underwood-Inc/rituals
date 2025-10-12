# Spawn Copper Totem visual (tall variant) - using cut copper
data modify storage rituals:temp block set value {Name:"minecraft:cut_copper_slab",Properties:{type:"bottom",waterlogged:"false"}}
data modify storage rituals:temp scale set value 0.6
data modify storage rituals:temp height set value 2.0
data modify storage rituals:temp offset set value -0.3
function rituals:totem/visuals/spawn_display with storage rituals:temp
