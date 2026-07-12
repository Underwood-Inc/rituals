# ========================================
# Remove leftover placed-totem RP artifacts
# ========================================
# Prefer: /rituals admin cleanup_totem_artifacts (plugin removes orphans directly).
# This function is a datapack fallback with the same selectors.

tellraw @a [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Cleaning orphaned totem display entities…","color":"yellow"}]

# Failed RP experiments tagged visuals on item_display (not block_display)
kill @e[type=item_display,tag=rituals.totem_visual]
kill @e[type=item_display,tag=rituals.totem_visual_rp]

# Warped-fungus placed-model layer (not the ritual item holder on top)
kill @e[type=item_display,tag=!rituals.totem_display,nbt={item:{id:"minecraft:warped_fungus_on_a_stick"}}]

# Near existing totems — catch untagged orphans from older builds
execute as @e[type=interaction,tag=rituals.totem] at @s run kill @e[type=item_display,distance=..8,tag=!rituals.totem_display]

tellraw @a [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Cleanup pass complete. If poles are missing, run ","color":"green"},{"text":"/rituals admin refresh_totem_visuals","color":"aqua"},{"text":" or break and re-place the totem.","color":"green"}]
