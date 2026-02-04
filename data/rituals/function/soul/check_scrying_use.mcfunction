# ========================================
# Check Scrying Glass Use
# ========================================
# Detects spyglass use via statistics - instant trigger

# Get current spyglass usage count
execute store result score #current_use rituals.soul_temp run scoreboard players get @s rituals.spyglass_used

# Ensure prev score exists
execute unless score @s rituals.spyglass_prev matches -2147483648.. run scoreboard players set @s rituals.spyglass_prev 0

# First time: initialize prev to current (prevents false trigger)
execute unless entity @s[tag=rituals.spyglass_initialized] store result score @s rituals.spyglass_prev run scoreboard players get #current_use rituals.soul_temp
execute unless entity @s[tag=rituals.spyglass_initialized] run tag @s add rituals.spyglass_initialized

# Check delta
execute store result score #prev_use rituals.soul_temp run scoreboard players get @s rituals.spyglass_prev
scoreboard players operation #use_delta rituals.soul_temp = #current_use rituals.soul_temp
scoreboard players operation #use_delta rituals.soul_temp -= #prev_use rituals.soul_temp

# Update prev
scoreboard players operation @s rituals.spyglass_prev = #current_use rituals.soul_temp

# If delta > 0, spyglass was used - trigger sync
execute if score #use_delta rituals.soul_temp matches 1.. run function rituals:soul/scrying_glass_use

