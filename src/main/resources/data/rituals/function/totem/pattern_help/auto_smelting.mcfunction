# Show Auto-Smelting pattern setup help
tellraw @a[distance=..10] [{"text":"🔥 ","color":"gold"},{"text":"Auto-Smelting Pattern Setup:","bold":true,"color":"#FF8C00"}]
tellraw @a[distance=..10] [{"text":"  Place 6 totems in hexagon around center:","color":"gray"}]
tellraw @a[distance=..10] [{"text":"  • N/NE/SE/S/SW/NW: ","color":"gray"},{"text":"Any ritual items","color":"#FF8C00","bold":true},{"text":" (🟠 Orange particles)","color":"#FF8C00"}]
tellraw @a[distance=..10] [{"text":"  Enchants furnace for instant smelting!","color":"yellow","italic":true}]
tag @s add rituals.pattern_help_shown

