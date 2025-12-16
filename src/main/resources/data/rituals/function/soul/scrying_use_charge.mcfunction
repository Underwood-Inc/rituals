# ========================================
# Scrying Glass - Use a Charge
# ========================================
# Decrements uses and breaks glass when empty

# Get current uses from mainhand item
execute store result score #uses rituals.soul_temp run data get entity @s SelectedItem.components."minecraft:custom_data".scrying_uses

# Decrement
scoreboard players remove #uses rituals.soul_temp 1

# Check if broken (0 uses left)
execute if score #uses rituals.soul_temp matches ..0 run function rituals:soul/scrying_break
execute if score #uses rituals.soul_temp matches ..0 run return 0

# === UPDATE SCRYING GLASS VIA STORAGE (proper formatting) ===

# Copy current scrying glass to storage
data modify storage rituals:temp scrying_glass set from entity @s SelectedItem

# Update uses count in custom_data
execute store result storage rituals:temp scrying_glass.components."minecraft:custom_data".scrying_uses int 1 run scoreboard players get #uses rituals.soul_temp

# Build new lore with updated uses count
execute store result storage rituals:temp scrying_uses int 1 run scoreboard players get #uses rituals.soul_temp
function rituals:soul/scrying_build_lore with storage rituals:temp

# Apply new lore to item
data modify storage rituals:temp scrying_glass.components."minecraft:lore" set from storage rituals:temp scrying_lore

# Clear mainhand
item replace entity @s weapon.mainhand with air

# Spawn item entity with updated glass - instant pickup
summon item ~ ~0.5 ~ {Tags:["rituals.scrying_update"],PickupDelay:0,Item:{id:"minecraft:stone",count:1}}
data modify entity @e[type=item,tag=rituals.scrying_update,limit=1] Item set from storage rituals:temp scrying_glass
execute as @e[type=item,tag=rituals.scrying_update,limit=1] run tp @s @p
tag @e[type=item,tag=rituals.scrying_update] remove rituals.scrying_update

# Feedback (use score display, not macro)
tellraw @s [{"text":"  ","color":"gray"},{"text":"(","color":"dark_gray","italic":true},{"score":{"name":"#uses","objective":"rituals.soul_temp"},"color":"dark_gray","italic":true},{"text":" uses remaining)","color":"dark_gray","italic":true}]

# Cleanup
data remove storage rituals:temp scrying_glass
data remove storage rituals:temp scrying_lore
data remove storage rituals:temp scrying_uses

