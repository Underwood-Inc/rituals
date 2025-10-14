# Confiscate illegally crafted copper totem
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{rituals_totem:1,totem_tier:2}] 1

# Return materials
give @s minecraft:copper_ingot 4
give @s minecraft:copper_block 2

# Error message
tellraw @s [{"text":"❌ ","color":"red"},{"text":"Recipe Locked!","bold":true,"color":"red"}]
tellraw @s [{"text":"You must craft a ","color":"gray"},{"text":"Wood Totem","color":"gold"},{"text":" first to unlock this recipe!","color":"gray"}]

# Sound feedback
playsound minecraft:block.anvil.land player @s ~ ~ ~ 0.5 0.8

