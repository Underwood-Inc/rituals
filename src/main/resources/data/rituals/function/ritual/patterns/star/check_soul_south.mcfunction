# ========================================
# Check South Totem for Soul Embodiment (Glowstone Dust)
# ========================================
# Runs as the totem at south position

scoreboard players operation #check_s_id rituals.temp = @s rituals.id
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #check_s_id rituals.temp if data entity @s {item:{id:"minecraft:glowstone_dust"}} run scoreboard players set #found_s rituals.temp 1

