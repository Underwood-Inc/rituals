# ========================================
# Scrying Glass - Break
# ========================================
# Called when scrying glass runs out of uses

# Remove the glass from mainhand
item replace entity @s weapon.mainhand with air

# Effects
playsound minecraft:block.glass.break player @s ~ ~ ~ 1.0 0.8
playsound minecraft:block.amethyst_block.break player @s ~ ~ ~ 0.8 1.2
particle minecraft:crit ~ ~1 ~ 0.3 0.3 0.3 0.3 20
particle minecraft:enchanted_hit ~ ~1 ~ 0.2 0.2 0.2 0.5 15

# Message
tellraw @s [{"text":"  ","color":"gray"},{"text":"The Scrying Glass shatters...","color":"dark_purple","italic":true}]

