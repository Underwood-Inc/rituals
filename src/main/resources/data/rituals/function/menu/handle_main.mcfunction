# ========================================
# Handle Main Menu Selection
# ========================================

# 1. Totem Bases
execute if score @s rituals.menu matches 1 run function rituals:menu/totems

# 2. Guidebook
execute if score @s rituals.menu matches 2 run function rituals:guidebook
execute if score @s rituals.menu matches 2 run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
execute if score @s rituals.menu matches 2 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 2 run tellraw @s [{"text":"========================================","color":"gold","bold":true}]
execute if score @s rituals.menu matches 2 run tellraw @s [{"text":"✓ Received: ","color":"green","bold":true},{"text":"Rituals Guidebook","color":"light_purple"}]
execute if score @s rituals.menu matches 2 run tellraw @s [{"text":"========================================","color":"gold","bold":true}]
execute if score @s rituals.menu matches 2 run function rituals:menu/main

# 3. Give Me Everything
execute if score @s rituals.menu matches 3 run function rituals:give/all
execute if score @s rituals.menu matches 3 run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1.5
execute if score @s rituals.menu matches 3 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 3 run tellraw @s [{"text":"========================================","color":"gold","bold":true}]
execute if score @s rituals.menu matches 3 run tellraw @s [{"text":"✓ Received: ","color":"green","bold":true},{"text":"ALL RITUAL ITEMS!","color":"red","bold":true}]
execute if score @s rituals.menu matches 3 run tellraw @s [{"text":"========================================","color":"gold","bold":true}]
execute if score @s rituals.menu matches 3 run function rituals:menu/main

# Reset trigger
scoreboard players set @s rituals.menu 0

