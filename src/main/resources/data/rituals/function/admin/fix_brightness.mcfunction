# Fix brightness on all existing totem item displays
# Removes the glowing effect by recreating displays without brightness
# SAFE: Only affects totems without active rituals

# Fix each totem display (only if the totem isn't running a ritual)
execute as @e[type=item_display,tag=rituals.totem_display] at @s run function rituals:admin/fix_brightness_check

tellraw @a [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"✓ Fixed brightness on all inactive totems!","color":"green","bold":false}]
tellraw @a [{"text":"  ","color":"dark_gray"},{"text":"Active rituals were not affected.","color":"gray","bold":false}]

