# Harvest pumpkin from fully grown stem (if adjacent pumpkin exists)
# Check all 4 directions for pumpkin and harvest first found
execute if block ~1 ~ ~ pumpkin run loot spawn ~1 ~ ~ mine ~1 ~ ~ minecraft:diamond_hoe[minecraft:enchantments={"minecraft:fortune":3}]
execute if block ~1 ~ ~ pumpkin run setblock ~1 ~ ~ air destroy

execute if block ~-1 ~ ~ pumpkin run loot spawn ~-1 ~ ~ mine ~-1 ~ ~ minecraft:diamond_hoe[minecraft:enchantments={"minecraft:fortune":3}]
execute if block ~-1 ~ ~ pumpkin run setblock ~-1 ~ ~ air destroy

execute if block ~ ~ ~1 pumpkin run loot spawn ~ ~ ~1 mine ~ ~ ~1 minecraft:diamond_hoe[minecraft:enchantments={"minecraft:fortune":3}]
execute if block ~ ~ ~1 pumpkin run setblock ~ ~ ~1 air destroy

execute if block ~ ~ ~-1 pumpkin run loot spawn ~ ~ ~-1 mine ~ ~ ~-1 minecraft:diamond_hoe[minecraft:enchantments={"minecraft:fortune":3}]
execute if block ~ ~ ~-1 pumpkin run setblock ~ ~ ~-1 air destroy

# Stem stays and will regrow pumpkins
particle happy_villager ~ ~0.5 ~ 0.2 0.2 0.2 0 3

