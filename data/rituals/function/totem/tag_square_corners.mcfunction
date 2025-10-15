# ========================================
# Tag All Totems at Square Pattern Corner Positions
# ========================================
# Runs at a diamond hoe totem (center)
# Tags all totems at corner positions as supplementary
# Accepts: Wheat, Carrot, Potato, Beetroot

# Tag totems at all 4 corner positions (±5, ±5) - ONLY if they have valid farm items
# NE Corner (+5,+5): Wheat
execute positioned ~5 ~ ~5 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,tag=!rituals.active_ritual,distance=..1.5,limit=1] at @s if entity @e[type=item_display,tag=rituals.totem_display,distance=..2,nbt={item:{id:"minecraft:wheat"}}] run tag @s add rituals.pattern_totem

# SE Corner (+5,-5): Carrot
execute positioned ~5 ~ ~-5 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,tag=!rituals.active_ritual,distance=..1.5,limit=1] at @s if entity @e[type=item_display,tag=rituals.totem_display,distance=..2,nbt={item:{id:"minecraft:carrot"}}] run tag @s add rituals.pattern_totem

# SW Corner (-5,-5): Potato
execute positioned ~-5 ~ ~-5 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,tag=!rituals.active_ritual,distance=..1.5,limit=1] at @s if entity @e[type=item_display,tag=rituals.totem_display,distance=..2,nbt={item:{id:"minecraft:potato"}}] run tag @s add rituals.pattern_totem

# NW Corner (-5,+5): Beetroot
execute positioned ~-5 ~ ~5 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,tag=!rituals.active_ritual,distance=..1.5,limit=1] at @s if entity @e[type=item_display,tag=rituals.totem_display,distance=..2,nbt={item:{id:"minecraft:beetroot"}}] run tag @s add rituals.pattern_totem

