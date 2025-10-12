# ========================================
# Animate item display with rotation and bobbing
# ========================================
# Runs as and at the totem every tick

# Store totem ID for matching
scoreboard players operation #anim_id rituals.temp = @s rituals.id

# Simple continuous rotation and bobbing using game time
# Updates every 10 ticks (0.5 seconds) for faster, smoother animation

# Animate based on time cycle - updates every 10 ticks for faster motion
execute store result score #time_mod rituals.temp run time query gametime
scoreboard players set #10 rituals.temp 10
scoreboard players operation #time_mod rituals.temp %= #10 rituals.temp

# Update every 10 ticks for smooth interpolated motion
execute if score #time_mod rituals.temp matches 0 as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #anim_id rituals.temp run function rituals:totem/animate_item_step
