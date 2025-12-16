# ========================================
# Scrying Glass - No Soul Weapon
# ========================================
# Player tried to use glass without soul weapon in offhand

playsound minecraft:block.amethyst_block.hit player @s ~ ~ ~ 0.8 0.8
tellraw @s [{"text":"✦ ","color":"dark_purple"},{"text":"The glass searches but finds no soul...","color":"gray","italic":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Hold a Soul Weapon in your offhand!","color":"yellow"}]

