# Give Ritual Control Hammer to player
give @s carrot_on_a_stick[custom_name='{"text":"Ritual Hammer","color":"#FF8C00","italic":false,"bold":true}',lore=['"Right-click: Toggle ritual"','"Shift+Right-click: Debug"'],custom_model_data=100030,custom_data={rituals_hammer:1b}] 1
tellraw @s [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Gave Ritual Hammer!","color":"green","bold":false}]

