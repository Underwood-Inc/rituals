# Spawn Iron Totem visual (tall variant)
data modify storage rituals:temp block set value {Name:"minecraft:stone_brick_wall",Properties:{up:"true",north:"none",south:"none",east:"none",west:"none",waterlogged:"false"}}
data modify storage rituals:temp scale set value 0.6
data modify storage rituals:temp height set value 2.0
data modify storage rituals:temp offset set value -0.3
function rituals:totem/visuals/spawn_display with storage rituals:temp
