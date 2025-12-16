# ========================================
# Scrying Glass - No Pending Sync
# ========================================
# Player's soul weapon has no pending XP to sync

playsound minecraft:block.amethyst_block.step player @s ~ ~ ~ 0.8 1.0
tellraw @s [{"text":"✦ ","color":"dark_purple"},{"text":"The soul is already in harmony.","color":"gray","italic":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"No pending XP to sync.","color":"dark_gray"}]

