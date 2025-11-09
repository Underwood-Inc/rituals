# Mark this totem if it has an arrow
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id if data entity @s {item:{id:"minecraft:arrow"}} run tag @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] add rituals.active_ritual

