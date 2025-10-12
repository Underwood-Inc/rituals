# ========================================
# List All Totems
# ========================================
# Shows count of totems in the world

# Count totems
execute store result score #total_totems rituals.temp if entity @e[type=interaction,tag=rituals.totem]
execute store result score #totems_with_items rituals.temp if entity @e[type=interaction,tag=rituals.totem,tag=rituals.has_item]
execute store result score #active_rituals rituals.temp if entity @e[type=interaction,tag=rituals.totem,tag=rituals.active_ritual]

# Display counts
tellraw @s [{"text":"=== Totem Statistics ===","color":"gold","bold":true}]
tellraw @s [{"text":"Total Totems: ","color":"gray"},{"score":{"name":"#total_totems","objective":"rituals.temp"},"color":"white"}]
tellraw @s [{"text":"Totems with Items: ","color":"gray"},{"score":{"name":"#totems_with_items","objective":"rituals.temp"},"color":"green"}]
tellraw @s [{"text":"Active Rituals: ","color":"gray"},{"score":{"name":"#active_rituals","objective":"rituals.temp"},"color":"aqua"}]
tellraw @s [{"text":"======================","color":"gold","bold":true}]

