# Fix a single totem display entity by recreating it without brightness
# This runs at the display entity

# Store the display data
data modify storage rituals:temp fix_display set from entity @s {}

# Get the totem ID for relinking
scoreboard players operation #temp rituals.id = @s rituals.id

# Kill the old entity
kill @s

# Respawn without brightness at the stored position
execute store result score #x rituals.temp run data get storage rituals:temp fix_display.Pos[0] 1000
execute store result score #y rituals.temp run data get storage rituals:temp fix_display.Pos[1] 1000
execute store result score #z rituals.temp run data get storage rituals:temp fix_display.Pos[2] 1000

# Summon new display at exact position without brightness
execute positioned as @s run function rituals:admin/fix_brightness_summon with storage rituals:temp fix_display

