# ========================================
# Upgrade Slates Submenu
# ========================================

# Set state
scoreboard players set @s rituals.menu_state 3

# Enable trigger
scoreboard players enable @s rituals.menu

# Display submenu
tellraw @s [{"text":"\n========================================","color":"gold","bold":true}]
tellraw @s [{"text":"        UPGRADE SLATES","color":"aqua","bold":true}]
tellraw @s [{"text":"========================================","color":"gold","bold":true}]
tellraw @s [{"text":""}]
tellraw @s [{"text":"1.","color":"gold","bold":true},{"text":" Copper Upgrade Slate","color":"#FF6347"}]
tellraw @s [{"text":"2.","color":"gold","bold":true},{"text":" Iron Upgrade Slate","color":"#D8D8D8"}]
tellraw @s [{"text":"3.","color":"gold","bold":true},{"text":" Gold Upgrade Slate","color":"gold"}]
tellraw @s [{"text":"4.","color":"gold","bold":true},{"text":" Diamond Upgrade Slate","color":"aqua"}]
tellraw @s [{"text":"5.","color":"gold","bold":true},{"text":" Netherite Upgrade Slate","color":"dark_purple"}]
tellraw @s [{"text":"6.","color":"gold","bold":true},{"text":" All Upgrade Slates","color":"green"}]
tellraw @s [{"text":""}]
tellraw @s [{"text":"0.","color":"gray","bold":true},{"text":" Back to Main Menu","color":"gray"}]
tellraw @s [{"text":""}]
tellraw @s [{"text":"Type: ","color":"gray"},{"text":"/trigger rituals.menu set <number>","color":"white","bold":true}]
tellraw @s [{"text":"========================================","color":"gold","bold":true}]

