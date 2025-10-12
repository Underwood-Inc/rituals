# ========================================
# Hide/remove the range barrier displays
# ========================================
# Runs as and at the totem

# Store totem ID
scoreboard players operation #barrier_id rituals.temp = @s rituals.id

# Kill all barrier displays with matching ID
execute as @e[type=block_display,tag=rituals.totem_barrier] if score @s rituals.id = #barrier_id rituals.temp run kill @s

# Remove barrier shown tag
tag @s remove rituals.barrier_shown

# Sound and particle feedback
playsound block.beacon.deactivate block @a ~ ~ ~ 0.3 2.0
particle smoke ~ ~2 ~ 0.3 0.3 0.3 0.02 10

