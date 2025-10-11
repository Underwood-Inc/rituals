# Check if player just right-clicked with totem
execute if score @s rituals.use_count matches 1.. run function rituals:totem/place_simple
