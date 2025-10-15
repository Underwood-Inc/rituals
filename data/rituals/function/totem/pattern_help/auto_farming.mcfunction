# Show Auto-Farming pattern setup help
tellraw @a[distance=..10] [{"text":"🚜 ","color":"yellow"},{"text":"Auto-Farming Pattern Setup:","bold":true,"color":"green"}]
tellraw @a[distance=..10] [{"text":"  Place totems 5 blocks diagonally in corners:","color":"gray"}]
tellraw @a[distance=..10] [{"text":"  • NE (+5,+5): ","color":"gray"},{"text":"Wheat","color":"gold","bold":true}]
tellraw @a[distance=..10] [{"text":"  • SE (+5,-5): ","color":"gray"},{"text":"Carrot","color":"#FF8C00","bold":true}]
tellraw @a[distance=..10] [{"text":"  • SW (-5,-5): ","color":"gray"},{"text":"Potato","color":"#CD853F","bold":true}]
tellraw @a[distance=..10] [{"text":"  • NW (-5,+5): ","color":"gray"},{"text":"Beetroot","color":"red","bold":true}]
tag @s add rituals.pattern_help_shown


