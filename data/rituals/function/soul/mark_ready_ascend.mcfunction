# ========================================
# Mark Ready for Ascension
# ========================================
# Called when soul weapon reaches its current level cap
# Works with storage rituals:temp item

# Check if soul is FRACTURED - if so, show different message and abort
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_fractured run function rituals:soul/mark_fractured_capped
execute if data storage rituals:temp item.components."minecraft:custom_data".soul_fractured run return 0

# Set the ready_ascend flag on the item in STORAGE
data modify storage rituals:temp item.components."minecraft:custom_data".soul_ready_ascend set value 1b

# Dramatic notification
tellraw @a[distance=..16] [{"text":""},{"text":"✦ ","color":"dark_purple","bold":true},{"text":"ASCENSION READY","color":"light_purple","bold":true},{"text":" ✦","color":"dark_purple","bold":true}]
tellraw @a[distance=..16] [{"text":"   Your soul weapon has reached its limit!","color":"gray"}]
tellraw @a[distance=..16] [{"text":"   Perform the Soul Embodiment ritual again to ","color":"gray"},{"text":"ASCEND","color":"gold","bold":true},{"text":"!","color":"gray"}]

# Special particles
particle minecraft:end_rod ~ ~2 ~ 0.5 1 0.5 0.05 30 force
particle minecraft:reverse_portal ~ ~1.5 ~ 0.3 0.5 0.3 0.1 50 force

# Sound
playsound minecraft:block.beacon.power_select player @a ~ ~ ~ 1.0 0.8

