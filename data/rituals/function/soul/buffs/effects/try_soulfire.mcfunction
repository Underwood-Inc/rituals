# ========================================
# Soul Flame - Ignite on Melee Hit
# ========================================
# Chance per tick to ignite recently-hit entities near the player.
# Uses HurtTime detection: mobs set HurtTime=10 the tick they take damage.
# Only triggers on mobs within melee range (4 blocks).
#
# Level 1: 10% chance, Level 2: 20%, Level 3: 30%
# Expects: #soulfire_lvl rituals.soul_temp (1-3)

# Roll chance: level 1 = 1/10, level 2 = 2/10, level 3 = 3/10
execute store result score #fire_roll rituals.soul_temp run random value 1..10
execute if score #soulfire_lvl rituals.soul_temp matches 1 unless score #fire_roll rituals.soul_temp matches 1 run return 0
execute if score #soulfire_lvl rituals.soul_temp matches 2 unless score #fire_roll rituals.soul_temp matches 1..2 run return 0
execute if score #soulfire_lvl rituals.soul_temp matches 3.. unless score #fire_roll rituals.soul_temp matches 1..3 run return 0

# Find entities that were JUST hurt (HurtTime=10) within melee range
# Set them on fire. Duration scales with level: 3s / 5s / 7s (60/100/140 ticks)
execute if score #soulfire_lvl rituals.soul_temp matches 1 as @e[type=!player,type=!item,distance=..4,nbt={HurtTime:10s}] run data modify entity @s Fire set value 60
execute if score #soulfire_lvl rituals.soul_temp matches 2 as @e[type=!player,type=!item,distance=..4,nbt={HurtTime:10s}] run data modify entity @s Fire set value 100
execute if score #soulfire_lvl rituals.soul_temp matches 3.. as @e[type=!player,type=!item,distance=..4,nbt={HurtTime:10s}] run data modify entity @s Fire set value 140

# Visual: flame particles on ignited targets
execute as @e[type=!player,type=!item,distance=..4,nbt={HurtTime:10s}] at @s run particle minecraft:flame ~ ~0.5 ~ 0.3 0.3 0.3 0.02 5
