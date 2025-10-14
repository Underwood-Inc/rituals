# Feedback when player tries to break metal totem without a pickaxe
tellraw @s [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"This totem requires a ","color":"red"},{"text":"pickaxe","color":"yellow","bold":true},{"text":" to break!","color":"red"}]
playsound block.anvil.land block @s ~ ~ ~ 0.5 2.0
particle block{block_state:"minecraft:iron_block"} ~ ~1 ~ 0.2 0.3 0.2 0 10

