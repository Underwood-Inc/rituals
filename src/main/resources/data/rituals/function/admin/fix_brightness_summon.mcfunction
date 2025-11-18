# Summon replacement display without brightness
# Uses stored NBT but removes brightness field

$summon item_display ~ ~ ~ {Tags:["rituals.totem_display"],billboard:"fixed",transformation:$(transformation),item:$(item),interpolation_duration:10}

# Restore the ID
scoreboard players operation @e[type=item_display,tag=rituals.totem_display,limit=1,sort=nearest] rituals.id = #temp rituals.id

