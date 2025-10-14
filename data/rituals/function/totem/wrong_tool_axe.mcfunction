# Feedback when player tries to break wood totem without an axe
tellraw @s [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"This totem requires an ","color":"red"},{"text":"axe","color":"yellow","bold":true},{"text":" to break!","color":"red"}]
playsound block.anvil.land block @s ~ ~ ~ 0.5 2.0
particle block{block_state:"minecraft:oak_planks"} ~ ~1 ~ 0.2 0.3 0.2 0 10

