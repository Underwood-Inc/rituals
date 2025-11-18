# ========================================
# Animate item display with rotation and bobbing
# ========================================
# Runs as and at the totem every tick

# Store totem ID for matching
scoreboard players operation #anim_id rituals.temp = @s rituals.id

# Simple continuous rotation and bobbing using game time
# Updates every 20 ticks (1 second) for TPS-independent smooth animation

# Animate based on time cycle - updates every 20 ticks for longer interpolation buffer
execute store result score #time_mod rituals.temp run time query gametime
scoreboard players set #20 rituals.temp 20
scoreboard players operation #time_mod rituals.temp %= #20 rituals.temp

# Update every 20 ticks for smooth interpolated motion (30 tick interpolation masks TPS lag)
execute if score #time_mod rituals.temp matches 0 as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #anim_id rituals.temp run function rituals:totem/animate_item_step
