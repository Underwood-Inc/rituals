# Show Auto-Breeding pattern setup help
tellraw @a[distance=..10] [{"text":"🌾 ","color":"gold"},{"text":"Auto-Breeding Pattern Setup:","bold":true,"color":"yellow"}]
tellraw @a[distance=..10] [{"text":"  Place totems 5 blocks away in cardinal directions:","color":"gray"}]
tellraw @a[distance=..10] [{"text":"  • North: ","color":"gray"},{"text":"Seeds","color":"green","bold":true},{"text":" (🟢 Green particles)","color":"green"}]
tellraw @a[distance=..10] [{"text":"  • East: ","color":"gray"},{"text":"Carrot","color":"#FF8C00","bold":true},{"text":" (🟠 Orange particles)","color":"#FF8C00"}]
tellraw @a[distance=..10] [{"text":"  • South: ","color":"gray"},{"text":"Potato","color":"#CD853F","bold":true},{"text":" (🟤 Brown particles)","color":"#CD853F"}]
tellraw @a[distance=..10] [{"text":"  • West: ","color":"gray"},{"text":"Beetroot Seeds","color":"red","bold":true},{"text":" (🔴 Red particles)","color":"red"}]
tag @s add rituals.pattern_help_shown

