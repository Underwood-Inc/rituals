# Confiscate illegally crafted netherite totem
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{rituals_totem:1,totem_tier:6}] 1

# Return materials
give @s minecraft:netherite_ingot 4
give @s minecraft:netherite_block 2

# Error message
tellraw @s [{"text":"❌ ","color":"red"},{"text":"Recipe Locked!","bold":true,"color":"red"}]
tellraw @s [{"text":"You must craft a ","color":"gray"},{"text":"Diamond Totem","color":"aqua"},{"text":" first to unlock this recipe!","color":"gray"}]

# Sound feedback
playsound minecraft:block.anvil.land player @s ~ ~ ~ 0.5 0.8

