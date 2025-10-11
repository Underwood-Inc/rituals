# ========================================
# Ambient particles for active rituals
# ========================================

# Create a circle of particles around the totem based on ritual type
execute if score @s rituals.effect matches 1 run particle happy_villager ~ ~2.5 ~ 0.5 0.5 0.5 0 2
execute if score @s rituals.effect matches 2 run particle crit ~ ~2.5 ~ 0.5 0.5 0.5 0 2
execute if score @s rituals.effect matches 3 run particle dust{color:[1.0,0.8,0.0],scale:1.0} ~ ~2.5 ~ 0.5 0.5 0.5 0 2
execute if score @s rituals.effect matches 4 run particle dust{color:[0.5,0.7,1.0],scale:1.0} ~ ~2.5 ~ 0.5 0.5 0.5 0 2
execute if score @s rituals.effect matches 5 run particle dust{color:[1.0,0.5,0.8],scale:1.5} ~ ~2.5 ~ 0.5 0.5 0.5 0 2

