# Give all upgrade slates to player
give @s paper[custom_name='{"text":"Copper Upgrade Slate","color":"#B87333","italic":false}',custom_model_data=100020,custom_data={rituals_upgrade:1b,upgrade_tier:2b}] 1
give @s paper[custom_name='{"text":"Iron Upgrade Slate","color":"gray","italic":false}',custom_model_data=100021,custom_data={rituals_upgrade:1b,upgrade_tier:3b}] 1
give @s paper[custom_name='{"text":"Gold Upgrade Slate","color":"gold","italic":false}',custom_model_data=100022,custom_data={rituals_upgrade:1b,upgrade_tier:4b}] 1
give @s paper[custom_name='{"text":"Diamond Upgrade Slate","color":"aqua","italic":false}',custom_model_data=100023,enchantment_glint_override=true,custom_data={rituals_upgrade:1b,upgrade_tier:5b}] 1
give @s paper[custom_name='{"text":"Netherite Upgrade Slate","color":"dark_red","italic":false}',custom_model_data=100024,enchantment_glint_override=true,custom_data={rituals_upgrade:1b,upgrade_tier:6b}] 1
tellraw @s [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Gave Upgrade Slates!","color":"green","bold":false}]
