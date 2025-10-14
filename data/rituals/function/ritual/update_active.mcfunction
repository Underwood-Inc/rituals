# ========================================
# Update active rituals and apply effects
# ========================================
# Runs as and at totems with active rituals

# Increment timer
scoreboard players add @s rituals.timer 1

# Check if any totem in the ritual lost its item (breaks the ritual)
execute store result score #ritual_intact rituals.temp if entity @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,tag=rituals.active_ritual,distance=..32]

# If less than minimum totems, ritual is broken
execute if score #ritual_intact rituals.temp < #min_totems rituals.data run function rituals:ritual/deactivate

# Apply ritual effects based on type
execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 1 run function rituals:ritual/effects/growth
execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 2 run function rituals:ritual/effects/strength
execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 3 run function rituals:ritual/effects/prosperity
execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 4 run function rituals:ritual/effects/protection
execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 5 run function rituals:ritual/effects/healing
execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 6 run function rituals:ritual/effects/sentry
execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 7 run function rituals:ritual/effects/farming

# Ambient particles for active rituals
execute if score @s rituals.timer matches 0..9 run function rituals:ritual/ambient_particles

# Auto-deactivate after duration (600 ticks = 30 seconds)
execute if score @s rituals.timer >= #ritual_duration rituals.data run function rituals:ritual/complete

