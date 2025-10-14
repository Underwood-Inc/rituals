# ========================================
# Break/remove a totem (SACRIFICE - no item drop)
# ========================================
# Runs as and at the totem being broken/sacrificed
# Used for pattern ritual supplemental totems - items are consumed as sacrifice

# Mark as broken to prevent double-breaking
tag @s add rituals.broken

# Store this totem's ID for matching
scoreboard players operation #break_id rituals.temp = @s rituals.id

# Drop the totem base item (but NOT the ritual item - it's sacrificed)
execute if entity @s[tag=rituals.short_totem] if score @s rituals.tier matches 1 run function rituals:totem/drop/tier1_short
execute if entity @s[tag=rituals.short_totem] if score @s rituals.tier matches 2 run function rituals:totem/drop/tier2_short
execute if entity @s[tag=rituals.short_totem] if score @s rituals.tier matches 3 run function rituals:totem/drop/tier3_short
execute if entity @s[tag=rituals.short_totem] if score @s rituals.tier matches 4 run function rituals:totem/drop/tier4_short
execute if entity @s[tag=rituals.short_totem] if score @s rituals.tier matches 5 run function rituals:totem/drop/tier5_short
execute if entity @s[tag=rituals.short_totem] if score @s rituals.tier matches 6 run function rituals:totem/drop/tier6_short
execute if entity @s[tag=!rituals.short_totem] if score @s rituals.tier matches 1 run function rituals:totem/drop/tier1
execute if entity @s[tag=!rituals.short_totem] if score @s rituals.tier matches 2 run function rituals:totem/drop/tier2
execute if entity @s[tag=!rituals.short_totem] if score @s rituals.tier matches 3 run function rituals:totem/drop/tier3
execute if entity @s[tag=!rituals.short_totem] if score @s rituals.tier matches 4 run function rituals:totem/drop/tier4
execute if entity @s[tag=!rituals.short_totem] if score @s rituals.tier matches 5 run function rituals:totem/drop/tier5
execute if entity @s[tag=!rituals.short_totem] if score @s rituals.tier matches 6 run function rituals:totem/drop/tier6

# DO NOT drop the ritual item - it's consumed as part of the sacrifice!
# Just kill the item display entity
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #break_id rituals.temp run kill @s

# Remove all associated entities with matching ID
execute as @e[type=block_display,tag=rituals.totem_visual] if score @s rituals.id = #break_id rituals.temp run kill @s
execute as @e[type=block_display,tag=rituals.totem_barrier] if score @s rituals.id = #break_id rituals.temp run kill @s
execute as @e[type=area_effect_cloud,tag=rituals.range_marker] if score @s rituals.id = #break_id rituals.temp run kill @s

# Remove barrier blocks that provided collision
setblock ~ ~ ~ air
execute if entity @s[tag=!rituals.short_totem] run setblock ~ ~1 ~ air

# Also kill any entities at this exact location (failsafe)
kill @e[type=block_display,tag=rituals.totem_visual,distance=..0.1]
kill @e[type=item_display,tag=rituals.totem_display,distance=..0.1]

# Visual and sound feedback - MORE DRAMATIC for sacrifice
particle block{block_state:"minecraft:cobblestone"} ~ ~1 ~ 0.3 0.5 0.3 0 20
playsound block.stone.break block @a ~ ~ ~ 1.0 0.8

tellraw @p[distance=..5] [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"Totem sacrificed!","color":"red","bold":false}]

# Kill self last
kill @s

