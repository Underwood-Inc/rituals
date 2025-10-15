# ========================================
# Check if This Totem is at a Supplementary Position
# ========================================
# Runs as and at a totem that just had an item placed on it
# Checks if nearby totems could use THIS totem as a supplementary totem
# If so, tag it immediately to prevent it from starting its own ritual

# Skip if already tagged
execute if entity @s[tag=rituals.pattern_totem] run return 0

# If THIS totem is a CENTRAL totem, tag any supplementary totems that are already placed!
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id if data entity @s {item:{id:"minecraft:diamond_hoe"}} run return run function rituals:totem/tag_square_corners
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id if data entity @s {item:{id:"minecraft:wheat"}} run return run function rituals:totem/tag_if_valid_breeding_supplementary
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id if data entity @s {item:{id:"minecraft:experience_bottle"}} run return run function rituals:totem/tag_nearby_pentagon_position

# Check for DIAMOND HOE at square pattern center positions
# If THIS totem is at a corner, the center diamond hoe would be at the OPPOSITE diagonal
# NE corner (+5,+5) -> center at (-5,-5) from here
# SE corner (+5,-5) -> center at (-5,+5) from here
# SW corner (-5,-5) -> center at (+5,+5) from here
# NW corner (-5,+5) -> center at (+5,-5) from here
execute positioned ~-5 ~ ~-5 if entity @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1] run function rituals:totem/check_for_diamond_hoe_square
execute positioned ~-5 ~ ~5 if entity @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1] run function rituals:totem/check_for_diamond_hoe_square
execute positioned ~5 ~ ~5 if entity @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1] run function rituals:totem/check_for_diamond_hoe_square
execute positioned ~5 ~ ~-5 if entity @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1] run function rituals:totem/check_for_diamond_hoe_square

# Check for WHEAT at star pattern center positions
# If THIS totem is at a cardinal, the center wheat would be at the OPPOSITE cardinal
# North (+0,+5) -> center at (0,-5) from here
# East (+5,0) -> center at (-5,0) from here
# South (0,-5) -> center at (0,+5) from here
# West (-5,0) -> center at (+5,0) from here
execute positioned ~ ~ ~-5 if entity @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1] run function rituals:totem/check_for_wheat_star
execute positioned ~-5 ~ ~ if entity @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1] run function rituals:totem/check_for_wheat_star
execute positioned ~ ~ ~5 if entity @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1] run function rituals:totem/check_for_wheat_star
execute positioned ~5 ~ ~ if entity @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1] run function rituals:totem/check_for_wheat_star

# Check for EXPERIENCE BOTTLE at pentagon pattern center positions
# If THIS totem is at a pentagon position, the center would be at the OPPOSITE position
# North (0,+5) -> center at (0,-5) from here
# NE (+5,+2) -> center at (-5,-2) from here
# SE (+3,-4) -> center at (-3,+4) from here
# SW (-3,-4) -> center at (+3,+4) from here
# NW (-5,+2) -> center at (+5,-2) from here
execute positioned ~ ~ ~-5 if entity @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1] run function rituals:totem/check_for_xp_bottle_pentagon
execute positioned ~-5 ~ ~-2 if entity @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1] run function rituals:totem/check_for_xp_bottle_pentagon
execute positioned ~-3 ~ ~4 if entity @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1] run function rituals:totem/check_for_xp_bottle_pentagon
execute positioned ~3 ~ ~4 if entity @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1] run function rituals:totem/check_for_xp_bottle_pentagon
execute positioned ~5 ~ ~-2 if entity @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1] run function rituals:totem/check_for_xp_bottle_pentagon

