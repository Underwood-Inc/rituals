# ========================================
# Cluster leader gate for multi-totem rituals
# ========================================
# Only the active ritual totem with the lowest rituals.id in this cluster runs heavy effects.
# Matches sentry deduplication — prevents N× scans when N totems share one ritual.

execute store result score #min_id rituals.temp run scoreboard players get @s rituals.id
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.active_ritual,distance=..32] if score @s rituals.effect = @e[type=interaction,tag=rituals.totem,tag=rituals.active_ritual,limit=1,sort=nearest] rituals.effect if score @s rituals.id < #min_id rituals.temp run scoreboard players operation #min_id rituals.temp = @s rituals.id
execute unless score @s rituals.id = #min_id rituals.temp run return 0
