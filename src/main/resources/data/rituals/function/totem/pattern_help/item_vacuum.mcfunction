# Show Item Vacuum pattern setup help
tellraw @a[distance=..10] [{"text":"🔹 ","color":"aqua"},{"text":"Item Vacuum Pattern Setup:","bold":true,"color":"cyan"}]
tellraw @a[distance=..10] [{"text":"  Place 6 totems in hexagon around center:","color":"gray"}]
tellraw @a[distance=..10] [{"text":"  • N/NE/SE/S/SW/NW: ","color":"gray"},{"text":"Any ritual items","color":"cyan","bold":true},{"text":" (🔵 Cyan particles)","color":"cyan"}]
tellraw @a[distance=..10] [{"text":"  Enchants the hopper with vacuum power!","color":"aqua","italic":true}]
tag @s add rituals.pattern_help_shown

