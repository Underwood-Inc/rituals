# ========================================
# Check if There's a Diamond Hoe at This Position
# ========================================
# Runs at a potential square pattern center position
# If a totem with diamond hoe is found here, tag the calling totem (wheat) as supplementary

# Check if there's a diamond hoe at THIS position (potential center)
# If found, tag ALL totems at corner positions (±5, ±5 from here)
execute if entity @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5,limit=1] if entity @e[type=item_display,tag=rituals.totem_display,distance=..2,nbt={item:{id:"minecraft:diamond_hoe"}}] run function rituals:totem/tag_square_corners

