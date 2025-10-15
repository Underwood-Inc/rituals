# ========================================
# Apply totem upgrade
# ========================================

# Set new tier
scoreboard players operation @s rituals.tier = #upgrade_tier rituals.temp

# Store ID for visual cleanup
scoreboard players operation #upgrade_id rituals.temp = @s rituals.id

# Remove old visual
execute as @e[type=block_display,tag=rituals.totem_visual] if score @s rituals.id = #upgrade_id rituals.temp run kill @s

# Summon new visual based on new tier and variant
execute if entity @s[tag=rituals.short_totem] if score @s rituals.tier matches 1 run function rituals:totem/visuals/tier1_short
execute if entity @s[tag=rituals.short_totem] if score @s rituals.tier matches 2 run function rituals:totem/visuals/tier2_short
execute if entity @s[tag=rituals.short_totem] if score @s rituals.tier matches 3 run function rituals:totem/visuals/tier3_short
execute if entity @s[tag=!rituals.short_totem] if score @s rituals.tier matches 1 run function rituals:totem/visuals/tier1
execute if entity @s[tag=!rituals.short_totem] if score @s rituals.tier matches 2 run function rituals:totem/visuals/tier2
execute if entity @s[tag=!rituals.short_totem] if score @s rituals.tier matches 3 run function rituals:totem/visuals/tier3

# Visual and audio feedback
particle end_rod ~ ~1 ~ 0.5 1 0.5 0.1 30
playsound block.enchantment_table.use block @a ~ ~ ~ 1.5 1.5
tellraw @p[distance=..5] [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Totem upgraded to Tier ","color":"green"},{"score":{"name":"@s","objective":"rituals.tier"},"color":"aqua"},{"text":"!","color":"green"}]

# Grant advancement
advancement grant @p[distance=..5] only rituals:guide/upgrade_totem

# Remove upgrade slate from player (NOT in creative)
execute as @p[distance=..5,gamemode=!creative] run item modify entity @s weapon.mainhand rituals:decrement

