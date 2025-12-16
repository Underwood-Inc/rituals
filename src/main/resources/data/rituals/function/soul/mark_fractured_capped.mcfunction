# ========================================
# Mark Fractured at Cap
# ========================================
# Called when a FRACTURED soul weapon reaches its level cap
# This is as far as it can ever go

# Somber notification
tellraw @a[distance=..16] ""
tellraw @a[distance=..16] [{"text":"  ","color":"dark_gray"},{"text":"✦ ","color":"dark_red"},{"text":"MAXIMUM LEVEL REACHED","color":"gray"},{"text":" ✦","color":"dark_red"}]
tellraw @a[distance=..16] [{"text":"   ","color":"gray"},{"text":"The fractured soul has reached its final form.","color":"dark_gray","italic":true}]
tellraw @a[distance=..16] [{"text":"   ","color":"gray"},{"text":"It can grow no further. It will never ascend.","color":"gray"}]
tellraw @a[distance=..16] ""

# Somber particles
particle minecraft:soul ~ ~2 ~ 0.3 0.5 0.3 0.02 15 force
particle minecraft:smoke ~ ~1.5 ~ 0.2 0.3 0.2 0.01 10 force

# Melancholy sound
playsound minecraft:block.beacon.deactivate player @a ~ ~ ~ 0.8 0.5

