# Initialize totem - copy tier from player
scoreboard players operation @s rituals.tier = @p rituals.tier

# Fallback: If tier still not set, default to 1 (shouldn't happen but prevents issues)
execute unless score @s rituals.tier matches 1..6 run scoreboard players set @s rituals.tier 1

execute if score @p rituals.temp matches 1 run tag @s add rituals.short_totem
scoreboard players operation @s rituals.id = #global_totem_id rituals.id
tag @s remove rituals.new_totem

# Visuals
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

# Item display - short at 1.5, tall at 2.5 (higher to accommodate bobbing down)
# With Y-axis rotation and bobbing animation (interpolation: 10 ticks for smooth motion)
execute if entity @s[tag=rituals.short_totem] run summon item_display ~ ~1.5 ~ {Tags:["rituals.totem_display","rituals.new_display"],billboard:"fixed",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]},interpolation_duration:10,start_interpolation:0}
execute if entity @s[tag=!rituals.short_totem] run summon item_display ~ ~2.5 ~ {Tags:["rituals.totem_display","rituals.new_display"],billboard:"fixed",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]},interpolation_duration:10,start_interpolation:0}

scoreboard players operation @e[type=item_display,tag=rituals.new_display,limit=1,sort=nearest] rituals.id = @s rituals.id
tag @e[type=item_display,tag=rituals.new_display,limit=1,sort=nearest] remove rituals.new_display
