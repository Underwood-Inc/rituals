# Mark totem as part of ritual if it has nether star
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id if data entity @s {item:{id:"minecraft:nether_star"}} run tag @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] add rituals.active_ritual
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id if data entity @s {item:{id:"minecraft:nether_star"}} run tag @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] add rituals.healing_ritual

