# ========================================
# Validate Netherite Upgrade Slate Crafting
# ========================================
# Check if player has the correct custom items

# Clear the knowledge book
clear @s knowledge_book

# Check if player has 4x Ritual Paste and 1x Netherite Totem in inventory
execute store result score @s rituals.temp if items entity @s container.* clay_ball[custom_data~{rituals_paste:1}]

# If player has at least 4 paste, check for netherite totem
execute if score @s rituals.temp matches 4.. store result score @s rituals.data if items entity @s container.* warped_fungus_on_a_stick[custom_data~{rituals_totem:1,totem_tier:6}]

# If valid: Remove ingredients and give upgrade slate
execute if score @s rituals.temp matches 4.. if score @s rituals.data matches 1.. run function rituals:crafting/give_upgrade_netherite

# If invalid: Original items remain in inventory - just show error message
execute unless score @s rituals.temp matches 4.. run tellraw @s [{"text":"[Rituals] ","color":"red","bold":true},{"text":"Invalid ingredients! You need 4x Ritual Paste and 1x Netherite Totem.","color":"red"}]
execute if score @s rituals.temp matches 4.. unless score @s rituals.data matches 1.. run tellraw @s [{"text":"[Rituals] ","color":"red","bold":true},{"text":"Invalid totem! You need a Netherite Totem (Tier 6).","color":"red"}]

# Revoke advancement
advancement revoke @s only rituals:technical/craft_upgrade_netherite

