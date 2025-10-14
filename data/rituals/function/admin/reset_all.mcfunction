# ========================================
# Reset All Ritual States
# ========================================
# Deactivates all active rituals without removing totems

# Remove all ritual tags
execute as @e[type=interaction,tag=rituals.totem] run tag @s remove rituals.active_ritual
execute as @e[type=interaction,tag=rituals.totem] run tag @s remove rituals.growth_ritual
execute as @e[type=interaction,tag=rituals.totem] run tag @s remove rituals.strength_ritual
execute as @e[type=interaction,tag=rituals.totem] run tag @s remove rituals.prosperity_ritual
execute as @e[type=interaction,tag=rituals.totem] run tag @s remove rituals.protection_ritual
execute as @e[type=interaction,tag=rituals.totem] run tag @s remove rituals.healing_ritual

# Reset scores
scoreboard players reset @e[type=interaction,tag=rituals.totem] rituals.timer
scoreboard players reset @e[type=interaction,tag=rituals.totem] rituals.effect

# Clear all range markers (in case any are orphaned)
kill @e[type=area_effect_cloud,tag=rituals.range_marker]
execute as @e[type=interaction,tag=rituals.totem] run tag @s remove rituals.barrier_shown

tellraw @a [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"✓ All rituals have been reset.","color":"yellow","bold":false}]
tellraw @a [{"text":"  Totems are still placed. Run ","color":"gray"},{"text":"/function rituals:admin/list_totems","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/list_totems"},"hover_event":{"action":"show_text","value":[{"text":"Click to list all totems","color":"green"}]}},{"text":" to see them.","color":"gray"}]

