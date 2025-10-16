# ========================================
# Give Diamond Upgrade Slate
# ========================================
# Remove ingredients and give the actual item

# Remove 4x Ritual Paste
clear @s clay_ball[custom_data~{rituals_paste:1}] 4

# Remove 1x Diamond Totem
clear @s warped_fungus_on_a_stick[custom_data~{rituals_totem:1,totem_tier:5}] 1

# Give the upgrade slate
give @s paper[custom_name='{"text":"Diamond Upgrade Slate","color":"aqua","italic":false}',custom_model_data=100023,enchantment_glint_override=true,custom_data={rituals_upgrade:1,upgrade_tier:5}] 1

# Success message
tellraw @s [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Crafted Diamond Upgrade Slate!","color":"green"}]
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1

