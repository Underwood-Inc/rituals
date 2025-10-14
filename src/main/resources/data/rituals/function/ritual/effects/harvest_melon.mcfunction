# Harvest melon from fully grown stem (if adjacent melon exists)
# Check all 4 directions for melon and harvest first found
execute if block ~1 ~ ~ melon run loot spawn ~1 ~ ~ mine ~1 ~ ~ minecraft:diamond_hoe[minecraft:enchantments={levels:{"minecraft:fortune":3}}]
execute if block ~1 ~ ~ melon run setblock ~1 ~ ~ air destroy

execute if block ~-1 ~ ~ melon run loot spawn ~-1 ~ ~ mine ~-1 ~ ~ minecraft:diamond_hoe[minecraft:enchantments={levels:{"minecraft:fortune":3}}]
execute if block ~-1 ~ ~ melon run setblock ~-1 ~ ~ air destroy

execute if block ~ ~ ~1 melon run loot spawn ~ ~ ~1 mine ~ ~ ~1 minecraft:diamond_hoe[minecraft:enchantments={levels:{"minecraft:fortune":3}}]
execute if block ~ ~ ~1 melon run setblock ~ ~ ~1 air destroy

execute if block ~ ~ ~-1 melon run loot spawn ~ ~ ~-1 mine ~ ~ ~-1 minecraft:diamond_hoe[minecraft:enchantments={levels:{"minecraft:fortune":3}}]
execute if block ~ ~ ~-1 melon run setblock ~ ~ ~-1 air destroy

# Stem stays and will regrow melons
particle happy_villager ~ ~0.5 ~ 0.2 0.2 0.2 0 3

