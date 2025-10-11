# Check if this is a valid Sentry ritual
# Count how many totems have arrows (including self)
scoreboard players set #sentry_count rituals.temp 1
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=0.1..32] at @s run function rituals:ritual/types/count_if_arrow

# Activate if we have enough
execute if score #sentry_count rituals.temp >= #min_totems rituals.data run function rituals:ritual/activate_sentry

