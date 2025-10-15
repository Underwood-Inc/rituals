# ========================================
# Remove Beam At Marker Location
# ========================================
# Runs as marker entity, removes beacon structure

# Remove barrier above
execute positioned ~ ~2 ~ if block ~ ~ ~ minecraft:barrier run setblock ~ ~ ~ minecraft:air replace

# Remove colored glass
execute positioned ~ ~1 ~ if block ~ ~ ~ #minecraft:stained_glass run setblock ~ ~ ~ minecraft:air replace

# Remove beacon
execute if block ~ ~ ~ minecraft:beacon run setblock ~ ~ ~ minecraft:air replace

# Remove iron block base
execute positioned ~ ~-1 ~ if block ~ ~ ~ minecraft:iron_block run setblock ~ ~ ~ minecraft:air replace

# Kill this marker
kill @s

