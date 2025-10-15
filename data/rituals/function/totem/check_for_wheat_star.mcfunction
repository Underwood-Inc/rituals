# ========================================
# Check if There's Wheat at This Position
# ========================================
# Runs at a potential star pattern center position
# If a totem with wheat is found here, tag the calling totem as supplementary
# BUT only if the calling totem has the RIGHT supplementary items (seeds, carrot, potato, beetroot seeds)

# Check if there's a totem with wheat here
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1,limit=1] at @s if entity @e[type=item_display,tag=rituals.totem_display,distance=..2,nbt={item:{id:"minecraft:wheat"}}] run function rituals:totem/tag_if_valid_breeding_supplementary

