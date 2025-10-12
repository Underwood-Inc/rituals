# ========================================
# Uninstall Totem Rituals Datapack
# ========================================
# WARNING: This will remove all totems and reset all scores
# Run this before removing the datapack files

# Remove all totem entities
kill @e[type=interaction,tag=rituals.totem]
kill @e[type=item_display,tag=rituals.totem_display]
kill @e[type=block_display,tag=rituals.totem_visual]

# Remove scoreboards
scoreboard objectives remove rituals.data
scoreboard objectives remove rituals.timer
scoreboard objectives remove rituals.distance
scoreboard objectives remove rituals.tier
scoreboard objectives remove rituals.effect
scoreboard objectives remove rituals.temp
scoreboard objectives remove rituals.id

# Clear storage
data remove storage rituals:temp item
data remove storage rituals:temp check_item
data remove storage rituals:temp drop_item

# Confirmation message
tellraw @a [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"Datapack uninstalled. All totems removed and data cleared.","color":"red","bold":false}]
tellraw @a [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"You can now safely remove the datapack files.","color":"yellow","bold":false}]

