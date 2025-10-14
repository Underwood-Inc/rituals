# ========================================
# Check for Illegally Crafted Totems
# ========================================
# Runs on players who just got a totem - validate they have the advancement

# Check for Copper Totem (Tier 2) - requires wood totem advancement
execute if entity @s[nbt={Inventory:[{components:{"minecraft:custom_data":{rituals_totem:1,totem_tier:2}}}]}] unless entity @s[advancements={rituals:guide/craft_totem=true}] run function rituals:player/confiscate_copper_totem

# Check for Iron Totem (Tier 3) - requires copper totem advancement
execute if entity @s[nbt={Inventory:[{components:{"minecraft:custom_data":{rituals_totem:1,totem_tier:3}}}]}] unless entity @s[advancements={rituals:guide/craft_copper_totem=true}] run function rituals:player/confiscate_iron_totem

# Check for Gold Totem (Tier 4) - requires iron totem advancement
execute if entity @s[nbt={Inventory:[{components:{"minecraft:custom_data":{rituals_totem:1,totem_tier:4}}}]}] unless entity @s[advancements={rituals:guide/craft_iron_totem=true}] run function rituals:player/confiscate_gold_totem

# Check for Diamond Totem (Tier 5) - requires gold totem advancement
execute if entity @s[nbt={Inventory:[{components:{"minecraft:custom_data":{rituals_totem:1,totem_tier:5}}}]}] unless entity @s[advancements={rituals:guide/craft_gold_totem=true}] run function rituals:player/confiscate_diamond_totem

# Check for Netherite Totem (Tier 6) - requires diamond totem advancement
execute if entity @s[nbt={Inventory:[{components:{"minecraft:custom_data":{rituals_totem:1,totem_tier:6}}}]}] unless entity @s[advancements={rituals:guide/craft_diamond_totem=true}] run function rituals:player/confiscate_netherite_totem

