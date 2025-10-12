# ========================================
# Totem Bases Submenu
# ========================================

# Set state
scoreboard players set @s rituals.menu_state 1

# Enable trigger
scoreboard players enable @s rituals.menu

# Display submenu
tellraw @s [{"text":"\n========================================","color":"gold","bold":true}]
tellraw @s [{"text":"         TOTEM BASES","color":"green","bold":true}]
tellraw @s [{"text":"========================================","color":"gold","bold":true}]
tellraw @s [{"text":""}]
tellraw @s [{"text":"1.","color":"gold","bold":true},{"text":" Wood Totem (Tall)","color":"#8B4513"}]
tellraw @s [{"text":"2.","color":"gold","bold":true},{"text":" Wood Totem (Short)","color":"#8B4513"}]
tellraw @s [{"text":"3.","color":"gold","bold":true},{"text":" Copper Totem (Tall)","color":"#FF6347"}]
tellraw @s [{"text":"4.","color":"gold","bold":true},{"text":" Copper Totem (Short)","color":"#FF6347"}]
tellraw @s [{"text":"5.","color":"gold","bold":true},{"text":" Iron Totem (Tall)","color":"#D8D8D8"}]
tellraw @s [{"text":"6.","color":"gold","bold":true},{"text":" Iron Totem (Short)","color":"#D8D8D8"}]
tellraw @s [{"text":"7.","color":"gold","bold":true},{"text":" Gold Totem (Tall)","color":"gold"}]
tellraw @s [{"text":"8.","color":"gold","bold":true},{"text":" Gold Totem (Short)","color":"gold"}]
tellraw @s [{"text":"9.","color":"gold","bold":true},{"text":" Diamond Totem (Tall)","color":"aqua"}]
tellraw @s [{"text":"10.","color":"gold","bold":true},{"text":" Diamond Totem (Short)","color":"aqua"}]
tellraw @s [{"text":"11.","color":"gold","bold":true},{"text":" Netherite Totem (Tall)","color":"dark_purple"}]
tellraw @s [{"text":"12.","color":"gold","bold":true},{"text":" Netherite Totem (Short)","color":"dark_purple"}]
tellraw @s [{"text":""}]
tellraw @s [{"text":"0.","color":"gray","bold":true},{"text":" Back to Main Menu","color":"gray"}]
tellraw @s [{"text":""}]
tellraw @s [{"text":"Type: ","color":"gray"},{"text":"/trigger rituals.menu set <number>","color":"white","bold":true}]
tellraw @s [{"text":"========================================","color":"gold","bold":true}]

