# ========================================
# Roll for Fractured Soul
# ========================================
# 10% chance for the soul to become FRACTURED
# This is PERMANENT and prevents all future ascension

execute store result score #fracture_roll rituals.soul_temp run random value 1..100
execute unless score #fracture_roll rituals.soul_temp matches 1..10 run return 0

# === THE SOUL FRACTURES ===
# This is a catastrophic event!

# Mark the item as fractured
data modify storage rituals:temp item.components."minecraft:custom_data".soul_fractured set value 1b

# Add to debuffs list for display
data modify storage rituals:temp item.components."minecraft:custom_data".soul_debuffs append value {id:"fractured",level:1}

# Dramatic effects
playsound minecraft:entity.wither.spawn hostile @a[distance=..32] ~ ~ ~ 0.5 0.5
playsound minecraft:block.glass.break master @a[distance=..16] ~ ~ ~ 1.0 0.5
playsound minecraft:entity.elder_guardian.curse master @a[distance=..16] ~ ~ ~ 0.8 0.6

# Particles - soul shattering
particle minecraft:soul ~ ~2 ~ 1 1 1 0.1 100 force
particle minecraft:smoke ~ ~2 ~ 0.5 0.5 0.5 0.05 50 force
particle minecraft:crit ~ ~2 ~ 0.5 0.5 0.5 0.5 30 force
particle minecraft:enchanted_hit ~ ~2 ~ 0.3 0.3 0.3 0.5 20 force

# Screen shake effect (damage flash)
execute as @a[distance=..10] run damage @s 0.001 minecraft:magic

# Dramatic announcement
tellraw @a[distance=..32] ""
tellraw @a[distance=..32] [{"text":"  ","color":"dark_red"},{"text":"═══════════════════════════════════","color":"dark_gray"}]
tellraw @a[distance=..32] [{"text":"  ⚠ ","color":"dark_red"},{"text":"THE SOUL HAS ","color":"red"},{"text":"FRACTURED","color":"dark_red","bold":true}]
tellraw @a[distance=..32] [{"text":"  ═══════════════════════════════════","color":"dark_gray"}]
tellraw @a[distance=..32] ""
tellraw @a[distance=..32] [{"text":"  ","color":"gray"},{"text":"A crack echoes through the ethereal plane...","color":"dark_gray","italic":true}]
tellraw @a[distance=..32] [{"text":"  ","color":"gray"},{"text":"The soul's growth has been permanently stunted.","color":"gray"}]
tellraw @a[distance=..32] [{"text":"  ","color":"gray"},{"text":"This weapon can ","color":"gray"},{"text":"NEVER","color":"red","bold":true},{"text":" ascend beyond its current tier.","color":"gray"}]
tellraw @a[distance=..32] ""

# Update lore to show fractured status
data modify storage rituals:temp item.components."minecraft:custom_data".soul_fractured_at_level set from storage rituals:temp item.components."minecraft:custom_data".soul_level

