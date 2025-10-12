# ========================================
# Maintain barrier displays
# ========================================
# Checks if barriers exist for powered totems and respawns if missing
# Only runs for totems marked as powered and barrier_shown

# Check if this totem should have barriers but they're missing
scoreboard players operation #check_id rituals.temp = @s rituals.id

# Count how many barriers exist with this totem's ID
execute store result score #existing_barriers rituals.temp if entity @e[type=block_display,tag=rituals.totem_barrier] if score @s rituals.id = #check_id rituals.temp

# If barriers should be shown (powered + barrier_shown tag) but none exist, respawn them
execute if entity @s[tag=rituals.redstone_powered,tag=rituals.barrier_shown] if score #existing_barriers rituals.temp matches 0 run function rituals:totem/respawn_barriers


