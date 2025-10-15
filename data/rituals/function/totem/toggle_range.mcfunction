# Toggle range display manually (for debugging or manual control)
# This can be called when interacting with the totem with a specific item

execute if entity @s[tag=rituals.show_range] run tag @s remove rituals.show_range
execute if entity @s[tag=!rituals.show_range] run tag @s add rituals.show_range

execute if entity @s[tag=rituals.show_range] run tellraw @a[distance=..5] [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Range display enabled","color":"green"}]
execute if entity @s[tag=!rituals.show_range] run tellraw @a[distance=..5] [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Range display disabled","color":"gray"}]

