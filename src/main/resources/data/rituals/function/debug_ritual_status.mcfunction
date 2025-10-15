# ========================================
# Debug: Check Ritual Status
# ========================================
# Run this to check if your auto-farm ritual is active
# Usage: /function rituals:debug_ritual_status

tellraw @a [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]
tellraw @a [{"text":"🔍 RITUAL DEBUG STATUS","color":"yellow","bold":true}]
tellraw @a [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]

# Check all totems with diamond hoe
execute as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item] at @s if entity @e[type=item_display,tag=rituals.totem_display,distance=..2,nbt={item:{id:"minecraft:diamond_hoe"}}] run function rituals:debug_check_single_totem

tellraw @a [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]

