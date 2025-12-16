# ========================================
# Check East Totem for Soul Embodiment (Ender Pearl)
# ========================================
# Runs as the totem at east position

scoreboard players operation #check_e_id rituals.temp = @s rituals.id
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #check_e_id rituals.temp if data entity @s {item:{id:"minecraft:ender_pearl"}} run scoreboard players set #found_e rituals.temp 1

