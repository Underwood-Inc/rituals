# ========================================
# Tag if Valid Auto-Breeding Supplementary Item
# ========================================
# Tags nearby totem if it has seeds, carrot, potato, or beetroot seeds

# Check at cardinal positions (distance ~5) for valid supplementary items
execute positioned ~ ~ ~5 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,tag=!rituals.active_ritual,distance=..1.5,limit=1] at @s if entity @e[type=item_display,tag=rituals.totem_display,distance=..2,nbt={item:{id:"minecraft:wheat_seeds"}}] run tag @s add rituals.pattern_totem
execute positioned ~5 ~ ~ as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,tag=!rituals.active_ritual,distance=..1.5,limit=1] at @s if entity @e[type=item_display,tag=rituals.totem_display,distance=..2,nbt={item:{id:"minecraft:carrot"}}] run tag @s add rituals.pattern_totem
execute positioned ~ ~ ~-5 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,tag=!rituals.active_ritual,distance=..1.5,limit=1] at @s if entity @e[type=item_display,tag=rituals.totem_display,distance=..2,nbt={item:{id:"minecraft:potato"}}] run tag @s add rituals.pattern_totem
execute positioned ~-5 ~ ~ as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,tag=!rituals.active_ritual,distance=..1.5,limit=1] at @s if entity @e[type=item_display,tag=rituals.totem_display,distance=..2,nbt={item:{id:"minecraft:beetroot_seeds"}}] run tag @s add rituals.pattern_totem

