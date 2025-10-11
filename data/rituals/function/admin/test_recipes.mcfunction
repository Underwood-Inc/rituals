# Test if recipes are loaded
tellraw @s [{"text":"[Test] Checking recipes...","color":"yellow"}]

# Try to give the recipe result directly to test if the format works
give @s warped_fungus_on_a_stick[custom_name='{"text":"TEST Wooden Totem","color":"gold","italic":false}',custom_data={rituals_totem:1b,totem_tier:1b}] 1

tellraw @s [{"text":"[Test] If you got an item, the format works!","color":"green"}]
tellraw @s [{"text":"[Test] Now check if you can craft it in a crafting table","color":"yellow"}]
tellraw @s [{"text":"[Test] Pattern: Stick top/sides, Oak Planks middle/bottom","color":"gray"}]

