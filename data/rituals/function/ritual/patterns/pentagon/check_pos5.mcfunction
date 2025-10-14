# Check if this totem has Glowstone Dust (Position 5 requirement)
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify storage rituals:temp check_pentagon_item set from entity @s item.id

# Validate item is Glowstone Dust
execute if data storage rituals:temp {check_pentagon_item:"minecraft:glowstone_dust"} run scoreboard players set #found_5 rituals.temp 1
execute if data storage rituals:temp {check_pentagon_item:"minecraft:glowstone_dust"} run tag @s add rituals.pattern_totem

