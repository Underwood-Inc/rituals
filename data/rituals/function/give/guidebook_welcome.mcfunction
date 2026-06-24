# Enchanted welcome guidebook (Fortune III + Luck while held). First join or OP re-give.
loot give @s loot rituals:items/guidebook_welcome
tellraw @s [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Gave the enchanted Rituals Guidebook ","color":"light_purple"},{"text":"(Fortune III, +2 Luck when held).","color":"gray"}]
advancement grant @s only rituals:guide/root
