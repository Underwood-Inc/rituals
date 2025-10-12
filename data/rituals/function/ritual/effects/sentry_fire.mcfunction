# Fire a magical projectile at the target
# Runs as the totem, target is tagged
# Uses #sentry_damage and #projectile_speed from get_sentry_settings

# Summon marker projectile
summon marker ~ ~1.5 ~ {Tags:["rituals.sentry_projectile","rituals.sentry_new"]}

# Store tier, damage, and speed on projectile
execute as @e[type=marker,tag=rituals.sentry_new,limit=1] run scoreboard players operation @s rituals.tier = @e[type=interaction,tag=rituals.totem,tag=rituals.active_ritual,limit=1,sort=nearest] rituals.tier
execute as @e[type=marker,tag=rituals.sentry_new,limit=1] run scoreboard players operation @s rituals.data = #sentry_damage rituals.temp
execute as @e[type=marker,tag=rituals.sentry_new,limit=1] run scoreboard players operation @s rituals.distance = #projectile_speed rituals.temp

# Store target UUID in projectile (for homing)
execute as @e[type=marker,tag=rituals.sentry_new,limit=1] run data modify entity @s data.target_uuid set from entity @e[tag=rituals.sentry_target,limit=1] UUID

# Visual and sound
particle flame ~ ~1.5 ~ 0.1 0.1 0.1 0.1 10
particle enchant ~ ~1.5 ~ 0.3 0.3 0.3 0.1 20
particle electric_spark ~ ~1.5 ~ 0.2 0.2 0.2 0.2 5
playsound entity.blaze.shoot block @a ~ ~ ~ 0.5 1.5
playsound entity.firework_rocket.launch block @a ~ ~ ~ 0.3 2.0

# Remove new tag
tag @e[type=marker,tag=rituals.sentry_new] remove rituals.sentry_new

