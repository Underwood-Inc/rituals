# ========================================
# Upgrade a totem
# ========================================
# Runs as and at the totem being upgraded

# Get the upgrade tier from the player's held item
execute store result score #upgrade_tier rituals.temp run data get entity @p[distance=..5] SelectedItem.components."minecraft:custom_data".upgrade_to_tier

# Store current tier
scoreboard players operation #current_tier rituals.temp = @s rituals.tier

# Check if upgrade is valid (must be exactly +1 tier)
scoreboard players operation #tier_diff rituals.temp = #upgrade_tier rituals.temp
scoreboard players operation #tier_diff rituals.temp -= #current_tier rituals.temp

# If tier difference is exactly 1, allow upgrade
execute if score #tier_diff rituals.temp matches 1 run function rituals:totem/apply_upgrade
execute unless score #tier_diff rituals.temp matches 1 run function rituals:totem/upgrade_failed

