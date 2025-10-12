# ========================================
# Handle Totem Submenu Selection
# ========================================

# 0. Back to main menu
execute if score @s rituals.menu matches 0 run function rituals:menu/main

# 1. Wood (Tall)
execute if score @s rituals.menu matches 1 run function rituals:give/totem_basic
execute if score @s rituals.menu matches 1 run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 1 0.8
execute if score @s rituals.menu matches 1 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 1 run tellraw @s [{"text":">>> ","color":"gold","bold":true},{"text":"✓ Received: ","color":"green","bold":true},{"text":"Wood Totem (Tall)","color":"#8B4513"}]
execute if score @s rituals.menu matches 1 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 1 run function rituals:menu/totems

# 2. Wood (Short)
execute if score @s rituals.menu matches 2 run function rituals:give/totem_basic_short
execute if score @s rituals.menu matches 2 run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 1 0.8
execute if score @s rituals.menu matches 2 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 2 run tellraw @s [{"text":">>> ","color":"gold","bold":true},{"text":"✓ Received: ","color":"green","bold":true},{"text":"Wood Totem (Short)","color":"#8B4513"}]
execute if score @s rituals.menu matches 2 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 2 run function rituals:menu/totems

# 3. Copper (Tall)
execute if score @s rituals.menu matches 3 run function rituals:give/totem_copper
execute if score @s rituals.menu matches 3 run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 1 0.9
execute if score @s rituals.menu matches 3 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 3 run tellraw @s [{"text":">>> ","color":"gold","bold":true},{"text":"✓ Received: ","color":"green","bold":true},{"text":"Copper Totem (Tall)","color":"#FF6347"}]
execute if score @s rituals.menu matches 3 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 3 run function rituals:menu/totems

# 4. Copper (Short)
execute if score @s rituals.menu matches 4 run function rituals:give/totem_copper_short
execute if score @s rituals.menu matches 4 run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 1 0.9
execute if score @s rituals.menu matches 4 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 4 run tellraw @s [{"text":">>> ","color":"gold","bold":true},{"text":"✓ Received: ","color":"green","bold":true},{"text":"Copper Totem (Short)","color":"#FF6347"}]
execute if score @s rituals.menu matches 4 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 4 run function rituals:menu/totems

# 5. Iron (Tall)
execute if score @s rituals.menu matches 5 run function rituals:give/totem_advanced
execute if score @s rituals.menu matches 5 run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 1 1.0
execute if score @s rituals.menu matches 5 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 5 run tellraw @s [{"text":">>> ","color":"gold","bold":true},{"text":"✓ Received: ","color":"green","bold":true},{"text":"Iron Totem (Tall)","color":"#D8D8D8"}]
execute if score @s rituals.menu matches 5 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 5 run function rituals:menu/totems

# 6. Iron (Short)
execute if score @s rituals.menu matches 6 run function rituals:give/totem_advanced_short
execute if score @s rituals.menu matches 6 run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 1 1.0
execute if score @s rituals.menu matches 6 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 6 run tellraw @s [{"text":">>> ","color":"gold","bold":true},{"text":"✓ Received: ","color":"green","bold":true},{"text":"Iron Totem (Short)","color":"#D8D8D8"}]
execute if score @s rituals.menu matches 6 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 6 run function rituals:menu/totems

# 7. Gold (Tall)
execute if score @s rituals.menu matches 7 run function rituals:give/totem_gold
execute if score @s rituals.menu matches 7 run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 1 1.1
execute if score @s rituals.menu matches 7 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 7 run tellraw @s [{"text":">>> ","color":"gold","bold":true},{"text":"✓ Received: ","color":"green","bold":true},{"text":"Gold Totem (Tall)","color":"gold"}]
execute if score @s rituals.menu matches 7 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 7 run function rituals:menu/totems

# 8. Gold (Short)
execute if score @s rituals.menu matches 8 run function rituals:give/totem_gold_short
execute if score @s rituals.menu matches 8 run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 1 1.1
execute if score @s rituals.menu matches 8 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 8 run tellraw @s [{"text":">>> ","color":"gold","bold":true},{"text":"✓ Received: ","color":"green","bold":true},{"text":"Gold Totem (Short)","color":"gold"}]
execute if score @s rituals.menu matches 8 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 8 run function rituals:menu/totems

# 9. Diamond (Tall)
execute if score @s rituals.menu matches 9 run function rituals:give/totem_master
execute if score @s rituals.menu matches 9 run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 1 1.2
execute if score @s rituals.menu matches 9 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 9 run tellraw @s [{"text":">>> ","color":"gold","bold":true},{"text":"✓ Received: ","color":"green","bold":true},{"text":"Diamond Totem (Tall)","color":"aqua"}]
execute if score @s rituals.menu matches 9 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 9 run function rituals:menu/totems

# 10. Diamond (Short)
execute if score @s rituals.menu matches 10 run function rituals:give/totem_master_short
execute if score @s rituals.menu matches 10 run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 1 1.2
execute if score @s rituals.menu matches 10 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 10 run tellraw @s [{"text":">>> ","color":"gold","bold":true},{"text":"✓ Received: ","color":"green","bold":true},{"text":"Diamond Totem (Short)","color":"aqua"}]
execute if score @s rituals.menu matches 10 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 10 run function rituals:menu/totems

# 11. Netherite (Tall)
execute if score @s rituals.menu matches 11 run function rituals:give/totem_netherite
execute if score @s rituals.menu matches 11 run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 1 1.3
execute if score @s rituals.menu matches 11 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 11 run tellraw @s [{"text":">>> ","color":"gold","bold":true},{"text":"✓ Received: ","color":"green","bold":true},{"text":"Netherite Totem (Tall)","color":"dark_purple"}]
execute if score @s rituals.menu matches 11 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 11 run function rituals:menu/totems

# 12. Netherite (Short)
execute if score @s rituals.menu matches 12 run function rituals:give/totem_netherite_short
execute if score @s rituals.menu matches 12 run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 1 1.3
execute if score @s rituals.menu matches 12 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 12 run tellraw @s [{"text":">>> ","color":"gold","bold":true},{"text":"✓ Received: ","color":"green","bold":true},{"text":"Netherite Totem (Short)","color":"dark_purple"}]
execute if score @s rituals.menu matches 12 run tellraw @s [{"text":""}]
execute if score @s rituals.menu matches 12 run function rituals:menu/totems

# Reset trigger
scoreboard players set @s rituals.menu 0
