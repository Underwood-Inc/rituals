# ========================================
# Tag Pentagon Supplementary Positions
# ========================================
# Tags totems at all pentagon positions around this center

execute positioned ~ ~ ~5 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,tag=!rituals.active_ritual,distance=..1.5,limit=1] run tag @s add rituals.pattern_totem
execute positioned ~5 ~ ~2 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,tag=!rituals.active_ritual,distance=..1.5,limit=1] run tag @s add rituals.pattern_totem
execute positioned ~3 ~ ~-4 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,tag=!rituals.active_ritual,distance=..1.5,limit=1] run tag @s add rituals.pattern_totem
execute positioned ~-3 ~ ~-4 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,tag=!rituals.active_ritual,distance=..1.5,limit=1] run tag @s add rituals.pattern_totem
execute positioned ~-5 ~ ~2 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,tag=!rituals.active_ritual,distance=..1.5,limit=1] run tag @s add rituals.pattern_totem

