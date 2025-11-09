# Mark totem as part of ritual if it has iron
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id if data entity @s {item:{id:"minecraft:iron_ingot"}} run tag @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] add rituals.active_ritual
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id if data entity @s {item:{id:"minecraft:iron_ingot"}} run tag @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] add rituals.protection_ritual

