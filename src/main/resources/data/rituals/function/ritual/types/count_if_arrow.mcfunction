# Check if this totem has an arrow
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id if data entity @s {item:{id:"minecraft:arrow"}} run scoreboard players add #sentry_count rituals.temp 1

