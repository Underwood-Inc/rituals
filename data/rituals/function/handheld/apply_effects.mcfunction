# Apply handheld totem effects to holder and nearby players
# Radius is 1/4 of placed totem range

# Calculate 1/4 radius based on tier
# Tier 1: 2 blocks / 4 = 0.5 blocks (round to 1)
# Tier 2: 3 blocks / 4 = 0.75 blocks (round to 1)  
# Tier 3: 4 blocks / 4 = 1 block
# Tier 4: 5 blocks / 4 = 1.25 blocks (round to 2)
# Tier 5: 6 blocks / 4 = 1.5 blocks (round to 2)
# Tier 6: 7 blocks / 4 = 1.75 blocks (round to 2)

# Apply a default "strength" buff set (strength + resistance)
# This makes handheld totems a combat-focused item

execute if score @s rituals.tier matches 1..2 run effect give @s strength 3 0 false
execute if score @s rituals.tier matches 1..2 run effect give @s resistance 3 0 false
execute if score @s rituals.tier matches 1..2 run effect give @a[distance=0.1..1.5] strength 3 0 false
execute if score @s rituals.tier matches 1..2 run effect give @a[distance=0.1..1.5] resistance 3 0 false

execute if score @s rituals.tier matches 3 run effect give @s strength 3 1 false
execute if score @s rituals.tier matches 3 run effect give @s resistance 3 0 false
execute if score @s rituals.tier matches 3 run effect give @a[distance=0.1..1.5] strength 3 1 false
execute if score @s rituals.tier matches 3 run effect give @a[distance=0.1..1.5] resistance 3 0 false

execute if score @s rituals.tier matches 4..5 run effect give @s strength 3 1 false
execute if score @s rituals.tier matches 4..5 run effect give @s resistance 3 1 false
execute if score @s rituals.tier matches 4..5 run effect give @a[distance=0.1..2.5] strength 3 1 false
execute if score @s rituals.tier matches 4..5 run effect give @a[distance=0.1..2.5] resistance 3 1 false

execute if score @s rituals.tier matches 6 run effect give @s strength 3 2 false
execute if score @s rituals.tier matches 6 run effect give @s resistance 3 2 false
execute if score @s rituals.tier matches 6 run effect give @a[distance=0.1..2.5] strength 3 2 false
execute if score @s rituals.tier matches 6 run effect give @a[distance=0.1..2.5] resistance 3 2 false

# Visual feedback particles
execute if score @s rituals.tier matches 1..2 run particle crit ~ ~1 ~ 0.3 0.5 0.3 0.05 2
execute if score @s rituals.tier matches 3 run particle crit ~ ~1 ~ 0.3 0.5 0.3 0.05 3
execute if score @s rituals.tier matches 4..5 run particle crit ~ ~1 ~ 0.4 0.5 0.4 0.05 4
execute if score @s rituals.tier matches 6 run particle crit ~ ~1 ~ 0.5 0.5 0.5 0.05 5

