# ========================================
# Check North Totem for Soul Embodiment (Soul Sand)
# ========================================
# Runs as the totem at north position

scoreboard players operation #check_n_id rituals.temp = @s rituals.id
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #check_n_id rituals.temp if data entity @s {item:{id:"minecraft:soul_sand"}} run scoreboard players set #found_n rituals.temp 1

