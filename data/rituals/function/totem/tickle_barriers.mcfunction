# ========================================
# Keep barrier entities alive (anti-culling)
# ========================================
# Runs commands on barriers every tick to prevent mod culling
# Simply selecting/running as the entities keeps them in the active tick list

# Store totem ID
scoreboard players operation #tickle_id rituals.temp = @s rituals.id

# Just running commands "as" the entities keeps them loaded and prevents culling
# This is lightweight but effective
execute as @e[type=block_display,tag=rituals.totem_barrier] if score @s rituals.id = #tickle_id rituals.temp run scoreboard players set @s rituals.temp 1


