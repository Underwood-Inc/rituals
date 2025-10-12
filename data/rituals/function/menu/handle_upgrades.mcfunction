# ========================================
# Handle Upgrade Slates Submenu Selection
# ========================================

# 0. Back to main menu
execute if score @s rituals.menu matches 0 run function rituals:menu/main

# 1. Copper
execute if score @s rituals.menu matches 1 run function rituals:give/upgrade_slate_copper
execute if score @s rituals.menu matches 1 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 0.9
execute if score @s rituals.menu matches 1 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 1 run tellraw @s [{"text":">>> ","color":"gold","bold":true},{"text":"✓ Received: ","color":"green","bold":true},{"text":"Copper Upgrade Slate","color":"#FF6347"}]
execute if score @s rituals.menu matches 1 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 1 run function rituals:menu/upgrades

# 2. Iron
execute if score @s rituals.menu matches 2 run function rituals:give/upgrade_slate_iron
execute if score @s rituals.menu matches 2 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.0
execute if score @s rituals.menu matches 2 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 2 run tellraw @s [{"text":">>> ","color":"gold","bold":true},{"text":"✓ Received: ","color":"green","bold":true},{"text":"Iron Upgrade Slate","color":"#D8D8D8"}]
execute if score @s rituals.menu matches 2 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 2 run function rituals:menu/upgrades

# 3. Gold
execute if score @s rituals.menu matches 3 run function rituals:give/upgrade_slate_gold
execute if score @s rituals.menu matches 3 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.1
execute if score @s rituals.menu matches 3 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 3 run tellraw @s [{"text":">>> ","color":"gold","bold":true},{"text":"✓ Received: ","color":"green","bold":true},{"text":"Gold Upgrade Slate","color":"gold"}]
execute if score @s rituals.menu matches 3 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 3 run function rituals:menu/upgrades

# 4. Diamond
execute if score @s rituals.menu matches 4 run function rituals:give/upgrade_slate_diamond
execute if score @s rituals.menu matches 4 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.2
execute if score @s rituals.menu matches 4 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 4 run tellraw @s [{"text":">>> ","color":"gold","bold":true},{"text":"✓ Received: ","color":"green","bold":true},{"text":"Diamond Upgrade Slate","color":"aqua"}]
execute if score @s rituals.menu matches 4 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 4 run function rituals:menu/upgrades

# 5. Netherite
execute if score @s rituals.menu matches 5 run function rituals:give/upgrade_slate_netherite
execute if score @s rituals.menu matches 5 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.3
execute if score @s rituals.menu matches 5 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 5 run tellraw @s [{"text":">>> ","color":"gold","bold":true},{"text":"✓ Received: ","color":"green","bold":true},{"text":"Netherite Upgrade Slate","color":"dark_purple"}]
execute if score @s rituals.menu matches 5 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 5 run function rituals:menu/upgrades

# 6. All Upgrade Slates
execute if score @s rituals.menu matches 6 run function rituals:give/upgrade_slates
execute if score @s rituals.menu matches 6 run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 1.2
execute if score @s rituals.menu matches 6 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 6 run tellraw @s [{"text":">>> ","color":"gold","bold":true},{"text":"✓ Received: ","color":"green","bold":true},{"text":"ALL Upgrade Slates!","color":"green","bold":true}]
execute if score @s rituals.menu matches 6 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 6 run function rituals:menu/upgrades

# Reset trigger
scoreboard players set @s rituals.menu 0
