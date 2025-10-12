# Spawn Netherite Totem visual (short variant)
data modify storage rituals:temp block set value {Name:"minecraft:polished_blackstone_brick_wall",Properties:{up:"true",north:"none",south:"none",east:"none",west:"none",waterlogged:"false"}}
data modify storage rituals:temp scale set value 0.6
data modify storage rituals:temp height set value 1.0
data modify storage rituals:temp offset set value -0.3
function rituals:totem/visuals/spawn_display with storage rituals:temp

