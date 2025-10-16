# Give Ritual Control Hammer to player
give @s carrot_on_a_stick[minecraft:custom_name='{"text":"Ritual Hammer","color":"#FF8C00","italic":false,"bold":true}',minecraft:lore=['{"text":"Right-click: Toggle ritual","color":"gray","italic":false}','{"text":"Shift+Right-click: Debug","color":"gray","italic":false}'],minecraft:custom_data={rituals_hammer:1,custom_model_data:100030}] 1
tellraw @s [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Gave Ritual Hammer!","color":"green","bold":false}]

