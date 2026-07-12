# ========================================
# Re-spawn block_display totem visuals
# ========================================
# Run after cleanup_totem_artifacts if placed totems lost their pole geometry.

tellraw @a [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Refreshing totem block_display visuals…","color":"yellow"}]

execute as @e[type=interaction,tag=rituals.totem] at @s run function rituals:admin/refresh_totem_visual_single

tellraw @a [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"✓ Totem visuals refreshed.","color":"green"}]
