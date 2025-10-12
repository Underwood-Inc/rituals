# Check if this totem has a netherite block
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id if data entity @s {item:{id:"minecraft:netherite_block"}} run scoreboard players add #gold_count rituals.temp 1

