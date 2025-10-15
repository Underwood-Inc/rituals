# ========================================
# Check if There's an Experience Bottle at This Position
# ========================================
# Runs at a potential pentagon pattern center position
# If a totem with experience bottle is found here, tag the calling totem as supplementary

# Check if there's a totem with experience bottle here
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1,limit=1] at @s if entity @e[type=item_display,tag=rituals.totem_display,distance=..2,nbt={item:{id:"minecraft:experience_bottle"}}] run function rituals:totem/tag_nearby_pentagon_position

