# ========================================
# Check if placed item is awakeable for Soul Embodiment
# ========================================
# Uses ITEM TAGS to check if item can be awakened
# Runs AS the totem (interaction entity)

# Get this totem's matching item_display
scoreboard players operation #soul_check_id rituals.temp = @s rituals.id

# Check using the awakeable_tools tag (contains #minecraft:swords, #minecraft:pickaxes, etc.)
scoreboard players set #is_awakeable rituals.temp 0
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #soul_check_id rituals.temp if items entity @s contents #rituals:awakeable_tools run scoreboard players set #is_awakeable rituals.temp 1

# If awakeable, show the soul embodiment help
execute if score #is_awakeable rituals.temp matches 1 run function rituals:totem/pattern_help/soul_embodiment
