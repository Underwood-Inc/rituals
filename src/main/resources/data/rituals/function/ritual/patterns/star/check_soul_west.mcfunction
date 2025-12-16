# ========================================
# Check West Totem for Soul Embodiment (Amethyst Shard)
# ========================================
# Runs as the totem at west position

scoreboard players operation #check_w_id rituals.temp = @s rituals.id
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #check_w_id rituals.temp if data entity @s {item:{id:"minecraft:amethyst_shard"}} run scoreboard players set #found_w rituals.temp 1

