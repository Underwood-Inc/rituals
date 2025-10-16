# ========================================
# Update Preview Advancements
# ========================================
# Updates preview advancements based on player progress
# This creates a "2 steps ahead" preview system

# Check if player has completed basic totem crafting
execute if entity @s[advancements={rituals:guide/craft_totem=true}] run function rituals:admin/update_copper_preview

# Check if player has completed copper totem crafting
execute if entity @s[advancements={rituals:guide/craft_copper_totem=true}] run function rituals:admin/update_iron_preview

# Check if player has completed iron totem crafting
execute if entity @s[advancements={rituals:guide/craft_iron_totem=true}] run function rituals:admin/update_gold_preview

# Check if player has completed gold totem crafting
execute if entity @s[advancements={rituals:guide/craft_gold_totem=true}] run function rituals:admin/update_diamond_preview

# Check if player has completed diamond totem crafting
execute if entity @s[advancements={rituals:guide/craft_diamond_totem=true}] run function rituals:admin/update_netherite_preview

# Check if player has completed netherite totem crafting
execute if entity @s[advancements={rituals:guide/craft_netherite_totem=true}] run function rituals:admin/update_master_preview

# Check if player has completed master ritualist
execute if entity @s[advancements={rituals:guide/master_ritualist=true}] run function rituals:admin/update_pattern_preview
