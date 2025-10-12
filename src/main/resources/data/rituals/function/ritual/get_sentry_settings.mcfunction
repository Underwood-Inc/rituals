# Load sentry ritual config for current tier
execute if score @s rituals.tier matches 1 store result score #current_freq rituals.temp run data get storage rituals:config sentry_tier1_fire_rate
execute if score @s rituals.tier matches 2 store result score #current_freq rituals.temp run data get storage rituals:config sentry_tier2_fire_rate
execute if score @s rituals.tier matches 3 store result score #current_freq rituals.temp run data get storage rituals:config sentry_tier3_fire_rate
execute if score @s rituals.tier matches 4 store result score #current_freq rituals.temp run data get storage rituals:config sentry_tier4_fire_rate
execute if score @s rituals.tier matches 5 store result score #current_freq rituals.temp run data get storage rituals:config sentry_tier5_fire_rate
execute if score @s rituals.tier matches 6 store result score #current_freq rituals.temp run data get storage rituals:config sentry_tier6_fire_rate

execute if score @s rituals.tier matches 1 store result score #sentry_damage rituals.temp run data get storage rituals:config sentry_tier1_damage 10
execute if score @s rituals.tier matches 2 store result score #sentry_damage rituals.temp run data get storage rituals:config sentry_tier2_damage 10
execute if score @s rituals.tier matches 3 store result score #sentry_damage rituals.temp run data get storage rituals:config sentry_tier3_damage 10
execute if score @s rituals.tier matches 4 store result score #sentry_damage rituals.temp run data get storage rituals:config sentry_tier4_damage 10
execute if score @s rituals.tier matches 5 store result score #sentry_damage rituals.temp run data get storage rituals:config sentry_tier5_damage 10
execute if score @s rituals.tier matches 6 store result score #sentry_damage rituals.temp run data get storage rituals:config sentry_tier6_damage 10

execute if score @s rituals.tier matches 1 store result score #projectile_speed rituals.temp run data get storage rituals:config sentry_tier1_projectile_speed 10
execute if score @s rituals.tier matches 2 store result score #projectile_speed rituals.temp run data get storage rituals:config sentry_tier2_projectile_speed 10
execute if score @s rituals.tier matches 3 store result score #projectile_speed rituals.temp run data get storage rituals:config sentry_tier3_projectile_speed 10
execute if score @s rituals.tier matches 4 store result score #projectile_speed rituals.temp run data get storage rituals:config sentry_tier4_projectile_speed 10
execute if score @s rituals.tier matches 5 store result score #projectile_speed rituals.temp run data get storage rituals:config sentry_tier5_projectile_speed 10
execute if score @s rituals.tier matches 6 store result score #projectile_speed rituals.temp run data get storage rituals:config sentry_tier6_projectile_speed 10

