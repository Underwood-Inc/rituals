# Update totem display name based on tier and effect
# Called when totem is placed or ritual is applied
# Context: Run as the totem interaction entity

# Determine tier name
execute if score @s rituals.tier matches 1 run data modify storage rituals:temp tier_name set value "Wood"
execute if score @s rituals.tier matches 2 run data modify storage rituals:temp tier_name set value "Copper"
execute if score @s rituals.tier matches 3 run data modify storage rituals:temp tier_name set value "Iron"
execute if score @s rituals.tier matches 4 run data modify storage rituals:temp tier_name set value "Gold"
execute if score @s rituals.tier matches 5 run data modify storage rituals:temp tier_name set value "Diamond"
execute if score @s rituals.tier matches 6 run data modify storage rituals:temp tier_name set value "Netherite"

# Determine effect name
execute unless score @s rituals.effect matches 1.. run data modify storage rituals:temp effect_name set value "Inactive"
execute if score @s rituals.effect matches 1 run data modify storage rituals:temp effect_name set value "Growth"
execute if score @s rituals.effect matches 2 run data modify storage rituals:temp effect_name set value "Strength"
execute if score @s rituals.effect matches 3 run data modify storage rituals:temp effect_name set value "Prosperity"
execute if score @s rituals.effect matches 4 run data modify storage rituals:temp effect_name set value "Protection"
execute if score @s rituals.effect matches 5 run data modify storage rituals:temp effect_name set value "Healing"
execute if score @s rituals.effect matches 6 run data modify storage rituals:temp effect_name set value "Sentry"

# Store this totem's ID for matching
scoreboard players operation #current_id rituals.temp = @s rituals.id

# Apply the name to the text_display label
execute as @e[type=text_display,tag=rituals.totem_label] if score @s rituals.id = #current_id rituals.temp run function rituals:totem/update_display_name_apply with storage rituals:temp
