# Give the Rituals Guidebook (content from loot table — avoids oversized /give command)
loot give @s loot rituals:items/guidebook
tellraw @s [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Gave Rituals Guidebook!","color":"green"}]
advancement grant @s only rituals:guide/root
