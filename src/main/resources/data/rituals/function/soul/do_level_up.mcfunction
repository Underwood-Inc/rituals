# ========================================
# Do Level Up
# ========================================
# Actually applies the level up to the item
# NOTE: Lore update is handled by sync_item AFTER this returns

# Calculate levels gained
scoreboard players operation #levels_gained rituals.soul_temp = #target_level rituals.soul_temp
scoreboard players operation #levels_gained rituals.soul_temp -= #current_level rituals.soul_temp

# Apply new level to the item in STORAGE (sync_item will write back)
data modify storage rituals:temp item.components."minecraft:custom_data".soul_level set value 0
execute store result storage rituals:temp item.components."minecraft:custom_data".soul_level int 1 run scoreboard players get #target_level rituals.soul_temp

# Roll for buff on level up
function rituals:soul/buffs/roll_on_levelup

# Visual effects
particle minecraft:totem_of_undying ~ ~1.5 ~ 0.5 0.5 0.5 0.5 50 force
playsound minecraft:entity.player.levelup player @a ~ ~ ~ 1.0 1.0

# Notify
tellraw @a[distance=..16] [{"text":"⚡ ","color":"gold"},{"text":"LEVEL UP! ","color":"yellow","bold":true},{"text":"Soul weapon reached level ","color":"gray"},{"score":{"name":"#target_level","objective":"rituals.soul_temp"},"color":"green","bold":true},{"text":"!","color":"gray"}]

# Check if at level cap (ready for ascension)
execute if score #target_level rituals.soul_temp = #level_cap rituals.soul_temp run function rituals:soul/mark_ready_ascend

# Mark that a level up happened (for sync_item to know)
scoreboard players set #did_level_up rituals.soul_temp 1

