# ========================================
# Give Copper Upgrade Slate
# ========================================
# Remove ingredients and give the actual item

# Remove 4x Ritual Paste
clear @s clay_ball[custom_data~{rituals_paste:1}] 4

# Remove 1x Copper Totem
clear @s warped_fungus_on_a_stick[custom_data~{rituals_totem:1,totem_tier:2}] 1

# Give the upgrade slate
give @s paper[minecraft:custom_name='{"text":"Copper Upgrade Slate","color":"#B87333","italic":false}',minecraft:custom_data={rituals_upgrade:1,upgrade_tier:2,custom_model_data:100020}] 1

# Success message
tellraw @s [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Crafted Copper Upgrade Slate!","color":"green"}]
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1

