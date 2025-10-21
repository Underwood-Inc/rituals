# ========================================
# Mark Ritual as Completed
# ========================================
# Called when a player successfully activates a ritual for the first time
# Runs as the totem entity, but needs to find the player who activated it

# Get the ritual type from the totem
execute if entity @s[tag=rituals.growth_ritual] run scoreboard players set #ritual_type rituals.temp 1
execute if entity @s[tag=rituals.strength_ritual] run scoreboard players set #ritual_type rituals.temp 2
execute if entity @s[tag=rituals.prosperity_ritual] run scoreboard players set #ritual_type rituals.temp 3
execute if entity @s[tag=rituals.protection_ritual] run scoreboard players set #ritual_type rituals.temp 4
execute if entity @s[tag=rituals.healing_ritual] run scoreboard players set #ritual_type rituals.temp 5
execute if entity @s[tag=rituals.sentry_ritual] run scoreboard players set #ritual_type rituals.temp 6
execute if entity @s[tag=rituals.auto_farming] run scoreboard players set #ritual_type rituals.temp 7
execute if entity @s[tag=rituals.auto_breeding] run scoreboard players set #ritual_type rituals.temp 11

# Mark the ritual as completed for all nearby players (within 32 blocks)
# This rewards everyone who participated in setting up the ritual

# Growth Ritual
execute if score #ritual_type rituals.temp matches 1 as @a[distance=..32] run scoreboard players set @s rituals.growth_done 1
execute if score #ritual_type rituals.temp matches 1 as @a[distance=..32] run scoreboard players add @s rituals.growth_count 1

# Strength Ritual
execute if score #ritual_type rituals.temp matches 2 as @a[distance=..32] run scoreboard players set @s rituals.strength_done 1
execute if score #ritual_type rituals.temp matches 2 as @a[distance=..32] run scoreboard players add @s rituals.strength_count 1

# Prosperity Ritual
execute if score #ritual_type rituals.temp matches 3 as @a[distance=..32] run scoreboard players set @s rituals.prosperity_done 1
execute if score #ritual_type rituals.temp matches 3 as @a[distance=..32] run scoreboard players add @s rituals.prosperity_count 1

# Protection Ritual
execute if score #ritual_type rituals.temp matches 4 as @a[distance=..32] run scoreboard players set @s rituals.protection_done 1
execute if score #ritual_type rituals.temp matches 4 as @a[distance=..32] run scoreboard players add @s rituals.protection_count 1

# Healing Ritual
execute if score #ritual_type rituals.temp matches 5 as @a[distance=..32] run scoreboard players set @s rituals.healing_done 1
execute if score #ritual_type rituals.temp matches 5 as @a[distance=..32] run scoreboard players add @s rituals.healing_count 1

# Sentry Ritual
execute if score #ritual_type rituals.temp matches 6 as @a[distance=..32] run scoreboard players set @s rituals.sentry_done 1
execute if score #ritual_type rituals.temp matches 6 as @a[distance=..32] run scoreboard players add @s rituals.sentry_count 1

# Auto-Farming Ritual
execute if score #ritual_type rituals.temp matches 7 as @a[distance=..32] run scoreboard players set @s rituals.farming_done 1
execute if score #ritual_type rituals.temp matches 7 as @a[distance=..32] run scoreboard players add @s rituals.farming_count 1

# Auto-Breeding Ritual
execute if score #ritual_type rituals.temp matches 11 as @a[distance=..32] run scoreboard players set @s rituals.breeding_done 1
execute if score #ritual_type rituals.temp matches 11 as @a[distance=..32] run scoreboard players add @s rituals.breeding_count 1

# Increment total activation counter for all nearby players
execute as @a[distance=..32] run scoreboard players add @s rituals.total_activations 1

# Update badges for all nearby players (also checks hidden advancements)
execute as @a[distance=..32] run function rituals:badges/calculate_badge

# Reset temp
scoreboard players reset #ritual_type rituals.temp

