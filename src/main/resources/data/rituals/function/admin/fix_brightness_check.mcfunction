# Check if this totem has an active ritual before fixing
# Only fix if the totem is NOT running a ritual

# Get the totem ID
scoreboard players operation #check rituals.id = @s rituals.id

# Check if there's a totem with this ID that has an active ritual
execute store result score #has_ritual rituals.temp if entity @e[type=armor_stand,tag=rituals.totem,tag=rituals.ritual_active] if score @s rituals.id = #check rituals.id

# Only fix if no active ritual
execute if score #has_ritual rituals.temp matches 0 run function rituals:admin/fix_brightness_single

