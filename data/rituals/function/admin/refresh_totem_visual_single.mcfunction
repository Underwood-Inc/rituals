# Re-spawn 3-part block_display pole for one totem (run as/at the interaction entity)
scoreboard players operation #refresh_id rituals.temp = @s rituals.id

execute as @e[type=block_display,tag=rituals.totem_visual] if score @s rituals.id = #refresh_id rituals.temp run kill @s
execute as @e[type=item_display,tag=rituals.totem_visual] if score @s rituals.id = #refresh_id rituals.temp run kill @s
execute as @e[type=item_display,tag=rituals.totem_visual_rp] if score @s rituals.id = #refresh_id rituals.temp run kill @s

execute if entity @s[tag=rituals.short_totem] if score @s rituals.tier matches 1 run function rituals:totem/visuals/tier1_short
execute if entity @s[tag=rituals.short_totem] if score @s rituals.tier matches 2 run function rituals:totem/visuals/tier2_short
execute if entity @s[tag=rituals.short_totem] if score @s rituals.tier matches 3 run function rituals:totem/visuals/tier3_short
execute if entity @s[tag=rituals.short_totem] if score @s rituals.tier matches 4 run function rituals:totem/visuals/tier4_short
execute if entity @s[tag=rituals.short_totem] if score @s rituals.tier matches 5 run function rituals:totem/visuals/tier5_short
execute if entity @s[tag=rituals.short_totem] if score @s rituals.tier matches 6 run function rituals:totem/visuals/tier6_short
execute if entity @s[tag=!rituals.short_totem] if score @s rituals.tier matches 1 run function rituals:totem/visuals/tier1
execute if entity @s[tag=!rituals.short_totem] if score @s rituals.tier matches 2 run function rituals:totem/visuals/tier2
execute if entity @s[tag=!rituals.short_totem] if score @s rituals.tier matches 3 run function rituals:totem/visuals/tier3
execute if entity @s[tag=!rituals.short_totem] if score @s rituals.tier matches 4 run function rituals:totem/visuals/tier4
execute if entity @s[tag=!rituals.short_totem] if score @s rituals.tier matches 5 run function rituals:totem/visuals/tier5
execute if entity @s[tag=!rituals.short_totem] if score @s rituals.tier matches 6 run function rituals:totem/visuals/tier6
