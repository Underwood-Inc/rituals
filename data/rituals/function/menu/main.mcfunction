# ========================================
# Main Menu
# ========================================

# Initialize if needed
execute unless score @s rituals.menu_state matches 0.. run function rituals:menu/init

# Set state to main menu
scoreboard players set @s rituals.menu_state 0

# Enable trigger
scoreboard players enable @s rituals.menu

# Display menu
tellraw @s [{"text":"\n========================================","color":"gold","bold":true}]
tellraw @s [{"text":"        TOTEM RITUALS MENU","color":"dark_purple","bold":true}]
tellraw @s [{"text":"========================================","color":"gold","bold":true}]
tellraw @s [{"text":""}]
tellraw @s [{"text":"1.","color":"gold","bold":true},{"text":" Totem Bases","color":"green"}]
tellraw @s [{"text":"2.","color":"gold","bold":true},{"text":" Ritual Paste","color":"yellow"}]
tellraw @s [{"text":"3.","color":"gold","bold":true},{"text":" Upgrade Slates","color":"aqua"}]
tellraw @s [{"text":"4.","color":"gold","bold":true},{"text":" Guidebook","color":"light_purple"}]
tellraw @s [{"text":"5.","color":"gold","bold":true},{"text":" Give Me Everything!","color":"red"}]
tellraw @s [{"text":""}]
tellraw @s [{"text":"Type: ","color":"gray"},{"text":"/trigger rituals.menu set <number>","color":"white","bold":true}]
tellraw @s [{"text":"========================================","color":"gold","bold":true}]

