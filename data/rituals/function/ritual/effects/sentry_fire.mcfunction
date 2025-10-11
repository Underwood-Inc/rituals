# Fire a magical projectile at the target

# Calculate damage based on tier (0.5 damage per tier, starting at 1.0 for tier 1)
execute store result score #sentry_damage rituals.temp run data get storage rituals:config sentry_base_damage 10
execute store result score #damage_per_tier rituals.temp run data get storage rituals:config sentry_damage_per_tier 10
scoreboard players operation #tier_bonus rituals.temp = @s rituals.tier
scoreboard players operation #tier_bonus rituals.temp *= #damage_per_tier rituals.temp
scoreboard players operation #sentry_damage rituals.temp += #tier_bonus rituals.temp

# Spawn marker for projectile with tier-based speed
execute store result score #projectile_speed rituals.temp run data get storage rituals:config sentry_projectile_speed 100
execute store result score #speed_per_tier rituals.temp run data get storage rituals:config sentry_speed_per_tier 100
scoreboard players operation #tier_speed_bonus rituals.temp = @s rituals.tier
scoreboard players operation #tier_speed_bonus rituals.temp *= #speed_per_tier rituals.temp
scoreboard players operation #projectile_speed rituals.temp += #tier_speed_bonus rituals.temp

# Summon projectile entity (small fireball for visual)
summon small_fireball ~ ~1.5 ~ {Tags:["rituals.sentry_projectile","rituals.new_projectile"],power:[0.0,0.0,0.0]}

# Set projectile to target the mob
execute as @e[type=small_fireball,tag=rituals.new_projectile,limit=1] at @s facing entity @e[tag=rituals.sentry_target,limit=1] eyes run tp @s ~ ~ ~ ~ ~

# Store damage in projectile
execute as @e[type=small_fireball,tag=rituals.new_projectile,limit=1] store result entity @s ExplosionPower byte 0 run scoreboard players get #sentry_damage rituals.temp

# Apply motion based on tier speed
execute as @e[type=small_fireball,tag=rituals.new_projectile,limit=1] at @s facing entity @e[tag=rituals.sentry_target,limit=1] eyes run function rituals:ritual/effects/sentry_projectile_motion

# Visual and sound
particle flame ~ ~1.5 ~ 0.1 0.1 0.1 0.1 10
particle enchant ~ ~1.5 ~ 0.3 0.3 0.3 0.1 20
playsound entity.blaze.shoot block @a ~ ~ ~ 0.5 1.5
playsound entity.firework_rocket.launch block @a ~ ~ ~ 0.3 2.0

tag @e[type=small_fireball,tag=rituals.new_projectile] remove rituals.new_projectile

