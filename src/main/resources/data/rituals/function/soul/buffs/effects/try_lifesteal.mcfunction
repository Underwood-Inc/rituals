# ========================================
# Soul Leech - Lifesteal on Hit
# ========================================
# Heals the player when they damage entities.
# Uses HurtTime detection on nearby mobs (same as soulfire).
# Gives instant_health proportional to level.
#
# Level 1: 0.5 hearts, Level 2: 1 heart, Level 3: 1.5 hearts
# Only triggers once per hit (checks for recently-hurt mobs in melee range)
# Expects: #lifesteal_lvl rituals.soul_temp (1-3)

# Only trigger if there are freshly-hurt entities nearby (melee range)
execute unless entity @e[type=!player,type=!item,distance=..4,nbt={HurtTime:10s}] run return 0

# Apply scaled healing
# instant_health level 0 = 2 HP (1 heart), level 1 = 4 HP (2 hearts)
# For finer control: use regeneration with short duration
execute if score #lifesteal_lvl rituals.soul_temp matches 1 run effect give @s regeneration 2 0 true
execute if score #lifesteal_lvl rituals.soul_temp matches 2 run effect give @s regeneration 2 1 true
execute if score #lifesteal_lvl rituals.soul_temp matches 3.. run effect give @s instant_health 1 0 true

# Visual: soul particles flowing from target to player
particle minecraft:soul ~ ~1 ~ 0.3 0.3 0.3 0.02 3
