# ========================================
# Break/remove a totem
# ========================================
# Runs as and at the totem being broken
# Note: Tool validation is handled by check_tool_and_break.mcfunction

# Mark as broken to prevent double-breaking
tag @s add rituals.broken

# Store this totem's ID for matching
scoreboard players operation #break_id rituals.temp = @s rituals.id

# Drop the totem item based on tier and variant
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

# Drop any item that was displayed (strip ritual tags first)
execute if entity @s[tag=rituals.has_item] run function rituals:totem/drop_displayed_item_clean

# Remove any beacons spawned by this totem

# Remove all associated entities with matching ID
execute as @e[type=block_display,tag=rituals.totem_visual] if score @s rituals.id = #break_id rituals.temp run kill @s
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #break_id rituals.temp run kill @s
execute as @e[type=block_display,tag=rituals.totem_barrier] if score @s rituals.id = #break_id rituals.temp run kill @s
execute as @e[type=area_effect_cloud,tag=rituals.range_marker] if score @s rituals.id = #break_id rituals.temp run kill @s

# Remove barrier blocks that provided collision
# Short totems: remove ONE barrier at ~ (1 block tall)
# Tall totems: remove TWO barriers at ~ and ~1 (2 blocks tall)
setblock ~ ~ ~ air
execute if entity @s[tag=!rituals.short_totem] run setblock ~ ~1 ~ air

# Also kill any entities at this exact location (failsafe)
kill @e[type=block_display,tag=rituals.totem_visual,distance=..0.1]
kill @e[type=item_display,tag=rituals.totem_display,distance=..0.1]

# Visual and sound feedback
particle block{block_state:"minecraft:cobblestone"} ~ ~1 ~ 0.3 0.5 0.3 0 20
playsound block.stone.break block @a ~ ~ ~ 1.0 0.8

tellraw @p[distance=..3] [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Totem removed!","color":"yellow","bold":false}]

# Kill self last
kill @s

