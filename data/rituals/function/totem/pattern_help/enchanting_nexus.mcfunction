# Show Enchanting Nexus pattern setup help
tellraw @a[distance=..10] [{"text":"📚 ","color":"dark_purple"},{"text":"Enchanting Nexus Pattern Setup:","bold":true,"color":"light_purple"}]
tellraw @a[distance=..10] [{"text":"  Place totems at 4 corners (4 blocks diagonally):","color":"gray"}]
tellraw @a[distance=..10] [{"text":"  • NE/NW/SE/SW: ","color":"gray"},{"text":"Any ritual item","color":"light_purple","bold":true},{"text":" (🟣 Purple particles)","color":"light_purple"}]
tellraw @a[distance=..10] [{"text":"  Creates a magical enchanting area!","color":"aqua","italic":true}]
tag @s add rituals.pattern_help_shown

