# ========================================
# Ascension Blocked - Fractured Soul
# ========================================
# Called when attempting to ascend a fractured soul weapon

# Dramatic failure effects
playsound minecraft:block.glass.break master @a[distance=..16] ~ ~ ~ 1.0 0.5
playsound minecraft:entity.wither.hurt master @a[distance=..16] ~ ~ ~ 0.5 0.6
playsound minecraft:block.anvil.land master @a[distance=..16] ~ ~ ~ 0.5 0.8

# Sad particles
particle minecraft:soul ~ ~2 ~ 0.3 0.5 0.3 0.02 20 force
particle minecraft:smoke ~ ~2 ~ 0.5 0.5 0.5 0.03 30 force
particle minecraft:crit ~ ~2 ~ 0.3 0.3 0.3 0.3 15 force

# Message
tellraw @a[distance=..16] ""
tellraw @a[distance=..16] [{"text":"  ","color":"dark_red"},{"text":"═══════════════════════════════════","color":"dark_gray"}]
tellraw @a[distance=..16] [{"text":"  ⚠ ","color":"dark_red"},{"text":"ASCENSION ","color":"red"},{"text":"DENIED","color":"dark_red","bold":true}]
tellraw @a[distance=..16] [{"text":"  ═══════════════════════════════════","color":"dark_gray"}]
tellraw @a[distance=..16] ""
tellraw @a[distance=..16] [{"text":"  ","color":"gray"},{"text":"The soul is ","color":"gray"},{"text":"FRACTURED","color":"dark_red","bold":true},{"text":".","color":"gray"}]
tellraw @a[distance=..16] [{"text":"  ","color":"gray"},{"text":"Its broken essence cannot grow further.","color":"dark_gray","italic":true}]
tellraw @a[distance=..16] [{"text":"  ","color":"gray"},{"text":"This weapon is forever bound to its current tier.","color":"gray"}]
tellraw @a[distance=..16] ""

# Return the ritual items (don't consume them)
# (The calling function returns early, so items are not consumed)

