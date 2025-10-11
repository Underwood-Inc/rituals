# Unlock all ritual recipes for the player
recipe give @s rituals:totem_base_wood
recipe give @s rituals:totem_base_iron
recipe give @s rituals:totem_base_diamond
recipe give @s rituals:paste
recipe give @s rituals:upgrade_slate_iron
recipe give @s rituals:upgrade_slate_diamond

tellraw @s [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"All recipes unlocked!","color":"green","bold":false}]

